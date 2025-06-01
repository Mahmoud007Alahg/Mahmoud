const mongoose =  require('mongoose')

const academicYearSchema = new mongoose.Schema({
    year: { 
        type: mongoose.Schema.Types.Mixed, 
        required: true, 
        unique: true 
    },
    database: {
        type : String , 
        required: true
    },
    startDate: { 
        type: Date, 
    },
    endDate: { type: Date },
})

const AcademicYear = mongoose.model('AcademicYear', academicYearSchema)
module.exports = AcademicYear