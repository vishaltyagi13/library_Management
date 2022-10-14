package library.management

import CO.StudentCO
import com.security.Student
import grails.converters.JSON

class LibraryController {

    LibraryService libraryService

    def view() {

        render view: '/libraryManagementSystem/dashboard'
    }

    def list() {
        List<Student> studentList = Student.list()
        render(view: '/libraryManagementSystem/dashboard', model: [studentList: studentList])
    }

    def createStudentDetails(StudentCO studentCO) {
        Map result = [:]
        Student student = new Student(studentCO)
        student.save()
        result.code = 200
        result.status = "Saved"
        render view: '/libraryManagementSystem/dashboard', model: ['studentList': student.list()]
        result as JSON


    }

    def update() {
        Map result = [:]
        StudentCO studentCO = new StudentCO()
        bindData(studentCO, params)
        if (studentCO.rollNo) {
            Boolean status = libraryService.update(studentCO)
            if (status) {
                result.code = 200
            }
        }


    }
}
