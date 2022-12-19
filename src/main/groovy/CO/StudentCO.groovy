package CO

import com.security.Student
import grails.validation.Validateable

class StudentCO implements Validateable {

    String uuid
    String rollNo
    String name
    String fatherName
    String course
    String stream
    String address

    static constraints = {

        uuid nullable: true
        rollNo(nullable: true, validator: { value, object ->
            println "Value   :   " + value
            Student student = Student.findByRollNo(value)
            if (!value){
                return "roll.no.is.mandatory"
            }
           else if (student  ) {
                return "roll.no.already.exists"
            } else if (!value.isNumber()){
                return "roll.no.only.have.numeric.value"
            }

        })
        name(nullable: true, validator: { value, object ->
            println "*******************************************"
            println("")
            println("")
            println("")
            println(" value :" + value)
            println(" object:"   + object)
            if (!value ){
                return "student.name.is.mendatory"
            }else if (value.isNumber()){
                    return "student.name.only.text.value"
            }
        })
        fatherName(nullable: true, validator: { value, object ->
            if (!value ){
            }else if (value.isNumber()  ){
                return "father.name.only.text.value"
            }
        })
        course (nullable: true, validator: { value,object ->
            println(" course value :" + value)
            if (!value){
                return "Course.is.mendatory"

            }else if (value.isNumber()  ){
                return "course.name.only.text.value"
            }else{
                println("##############Course Value**** :"+value)
            }

        })
        stream (nullable: true, validator: { value, object ->
            println(" stream Value :" + value)
            if (!value){
                println(" value of stream in if part"+  value)
                return "Stream.name.is.mendatory"
            }else if (value.isNumber()  ){
                return "stream.name.only.text.value"
            }
        })
        address (nullable: true,validator: { value,object ->
            println(" address Value : " + value)
            if (!value){
                println("value of address in if part"+ value)
            }else if (value.isNumber()  ) {
                return "address.name.only.text.value"
            }
        })
    }
    }


