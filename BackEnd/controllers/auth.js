//Models
const Owner = require('../models/users/owner')
const Admin = require('../models/users/admins')
const Student = require('../models/users/students')

const Subclass = require('../models/academic/subclasses')
const Class = require('../models/academic/classes')

//Auth
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

//Reset
const crypto = require('crypto')
const path = require('path')
const { promisify } = require('util');
const exec = promisify(require('child_process').exec);

//Enviroment Keys
const JWT_SECRET = process.env.PrivateKey

//Functions
function generateCode(){
    return crypto.randomInt(10000,99999).toString()
}
function pythonPath(){
    return path.join(__dirname, '../functions/Email.py')
}

//--------------------------------------------------

//Register Controller
const Register = async ( role , name , password ) =>{
    try {
        
    } catch (error) {
        console.log(error.message)
    }
}

//Login Controller 
const Login = async (req, identifier , password ) =>{
    try 
    {
        //Serching for User
        const user = await Student.findOne({identifier})
        if(!user || password != user.password){
            return ({message: 'رقم المعرف أو كلمة السر خاطئة'})
        }

        //Create JWT Token
        const token = jwt.sign({id: user._id , role: user.role }, JWT_SECRET , {expiresIn: '72h'})
        const className = await Class.findOne({_id: user.classId})
        const subclassName = await Subclass.findOne({_id: user.subclassId})
        //Store User in Session
        req.session.user = {
            id: user._id,
            role: user.role,
            class: user.classId,
            subclass: user.subclassId,
            token: token,
            subclassName: subclassName.name,
            className: className.name,
            presence: user.presence,
            absence: user.absence,
            average: user.average
        }

        //Result
        return ({
            token: token,
            user: {
                id: user._id,
                name: `${user.firstName} ${user.lastName}`,
                role: user.role,
                class: user.classId,
                subclass: user.subclassId,
                subclassName: subclassName.name,
                className: className.name,
                presence: user.presence,
                absence: user.absence,
                average: user.average
            }
        })

    } catch (error) {
        console.log(error.message)
    }
}

//Logout Controller
const Logout = (req) =>{
    req.session.destroy(err => {
        if(err){
            return ({message: 'خطأ بتسجيل الخروج'})
        }
        return ({message: 'تم تسجيل الخروج بنجاح'})
    })
}

// Model selector helper
const getModelByRole = (role) => {
    const roleModelMap = {
        'admin': Admin,
        'owner': Owner,
        'student': Student
    };
    return roleModelMap[role];
};

// 1. Send Verification Code
const sendVerificationCode = async (req, email) => {
    try {
        if (!email) throw new Error('Email is required');
        
        const verificationCode = generateCode();
        const expiresAt = Date.now() + 15 * 60 * 1000;

        req.session.verificationCode = req.session.verificationCode || {};
        req.session.verificationCode[req.session.user.token] = {
            code: verificationCode,
            expiresAt: expiresAt
        };

        const pythonScriptPath = pythonPath();
        
        // Use promisified exec and await it
        const { stdout, stderr } = await exec(`python ${pythonScriptPath} "${email}" "${verificationCode}"`);
        
        if (stderr) {
            console.error('Python script error:', stderr);
            throw new Error('Failed to send verification code');
        }

        return { success: true, message: 'تم إرسال كود التحقق إلى البريد الالكتروني' };
    } catch (error) {
        console.error('SendVerificationCode error:', error);
        throw new Error('فشل إرسال كود التحقق، يرجى المحاولة لاحقاً');
    }
};

// 2. Verify Code
const verifyCode = (req, code) => {
    try {
        if (!code) throw new Error('Verification code is required');

        const storedCode = req.session.verificationCode?.[req.session.user.token];
        
        // Check if code exists and is not expired
        if (!storedCode || storedCode.expiresAt < Date.now()) {
            throw new Error('Invalid or expired verification code');
        }

        if (storedCode.code !== code) {
            throw new Error('Invalid verification code');
        }

        return { success: true, message: 'تمت المصادقة' };
    } catch (error) {
        console.error('VerifyCode error:', error.message);
        throw error;
    }
};

// 3. Change Password
const changePassword = async (req, newPassword) => {
    try {
        if (!newPassword || newPassword.length < 8) {
            throw new Error('Password must be at least 8 characters');
        }

        const role = req.session.user.role;
        const Model = getModelByRole(role);
        if (!Model) throw new Error('Invalid user role');

        // Hash the new password before saving
        const hashedPassword = await bcrypt.hash(newPassword, 10);
        
        await Model.findOneAndUpdate(
            { _id: req.session.user.id }, 
            { password: hashedPassword }
        );

        // Clean up the verification code from session
        if (req.session.verificationCode?.[req.session.user.token]) {
            delete req.session.verificationCode[req.session.user.token];
        }

        return { success: true, message: 'تم تغيير كلمة السر بنجاح' };
    } catch (error) {
        console.error('ChangePassword error:', error.message);
        throw error;
    }
};



module.exports = { Register , Login , Logout , sendVerificationCode , verifyCode , changePassword }