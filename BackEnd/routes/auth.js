const express = require('express')
const router = express.Router()

const { Login , sendVerificationCode , verifyCode , changePassword } = require('../controllers/auth')

// router.post('/register' , async(req,res)=>{
//     try {
//         const { role , name , password } = req.body
//         const result = await Register(role , name , password)
//         res.status(200).send(result)
//     } catch (error) {
//         console.log(error.message)
//     }
// })

router.post('/login' , async(req,res)=>{
    try {
        const { identifier , password } = req.body
        const result = await Login(req ,identifier , password)
        res.status(200).send({success: true , data: result , message: 'تم تسجيل الدخول بنجاح'})
    } catch (error) {
        console.log(error.message)
        res.status(500).send({success: false , data: error.message , message: 'خطأ بتسجيل الدخول'})
    }
})

router.post('/logout' , async(req,res)=>{
    req.session.destroy(err => {
        if(err){
            return res.status(500).json({success: false , data: err.message, message: 'خطأ بتسجيل الخروج'})
        }
        return res.status(200).json({success: true , data: null , message: 'تم تسجيل الخروج بنجاح'})
    })
})

router.post('/code' , async(req,res)=>{
    try {
        const { email } = req.body
        const result = await sendVerificationCode(req , email)
        res.status(200).json(result)
    } catch (error) {
        return res.status(500).json({success: false , data: error.message, message: 'خطأ بالمخدم يرجى المحاولة لاحقاً'})
    }
})

router.post('/verify' , async(req,res)=>{
    try {
        const { code } = req.body
        const result = await verifyCode(req , code)
        res.status(200).json(result)
    } catch (error) {
        return res.status(500).json({success: false , data: error.message, message: 'خطأ بالمخدم يرجى المحاولة لاحقاً'})
    }
})

router.post('/change' , async(req,res)=>{
    try {
        const { newPassword } = req.body
        const result = await changePassword(req , newPassword)
        res.status(200).json(result)
    } catch (error) {
        return res.status(500).json({success: false , data: error.message, message: 'خطأ بالمخدم يرجى المحاولة لاحقاً'})
    }
})

module.exports = router