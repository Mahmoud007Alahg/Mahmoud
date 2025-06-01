const express = require('express')
const router = express.Router()
const Activity = require('../models/blog/activity')
const easynest = require('easynest')

router.get('/', async (req, res) => {
    try {
        const result = await easynest.from(Activity).many()
        res.status(200).json(result)
    } catch (error) {
        res.json({ error: error.message })
    }
})

// Student participation endpoint
router.put('/', async (req, res) => {
    try {
        const { phoneNumber, activityId } = req.body;
        const userId = req.session.user.id;
        
        // Validate required fields
        if (!phoneNumber || !activityId) {
            return res.status(400).json({ 
                success: false,
                message: 'يجب إدخال رقم الموبايل ومعرف النشاط ومعرف الطالب'
            });
        }

        // Verify activity exists
        const activity = await Activity.findById(activityId);
        if (!activity) {
            return res.status(404).json({ 
                success: false,
                message: 'النشاط غير موجود'
            });
        }

        // Check if already participated (more reliable check)
        const alreadyParticipated = activity.members.some(member => 
            member.students && member.students.toString() === userId.toString()
        );

        if (alreadyParticipated) {
            return res.status(400).json({ 
                success: false,
                message: 'سبق المشاركة في هذا النشاط'
            });
        }

        // Add student to activity
        activity.members.push({
            students: userId,
            phoneNumber,
            joinedAt: new Date()
        });

        const updatedActivity = await activity.save();
        await updatedActivity.populate({
            path: 'members.students',
            select: 'firstName middleName lastName identifier picture'
        });

        return res.status(200).json({
            success: true,
            message: 'تمت المشاركة بنجاح',
            data: {
                activity: updatedActivity,
                member: updatedActivity.members.find(m => 
                    m.students && m.students._id.toString() === userId.toString()
                )
            }
        });

    } catch (error) {
        console.error('Error in activity participation:', error);
        return res.status(500).json({ 
            success: false,
            message: 'خطأ في الخادم',
            error: process.env.NODE_ENV === 'development' ? error.message : undefined
        });
    }
});
module.exports = router