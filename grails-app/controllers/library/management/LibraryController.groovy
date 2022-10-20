package library.management

import CO.BookCO
import CO.StudentCO
import com.security.Book
import com.security.Student
import grails.converters.JSON

class LibraryController {

    LibraryService libraryService

    def view(){

        render view: '/libraryManagementSystem/dashboard'
    }

    def fetchStudentDetails(){
        Map result=[:]
        List<Student> studentList = Student.list()
        result.code=200
        result.status="SUCCESS"
        render(template: '/libraryManagementSystem/studentRecordTemplate', model: [studentList: studentList])
    }

    def createStudentDetails(StudentCO studentCO){
        Map result = [:]
        Student student = new Student(studentCO)
        student.save()
        result.code = 200
        result.status = "Saved"
        render template: '/libraryManagementSystem/studentRecordTemplate', model: ['studentList': student.list()]
        result as JSON
    }

    def updateStudentDetails(){
        Map result = [:]
        println(params)
        StudentCO studentCO = new StudentCO()
        bindData(studentCO, params)
        if (studentCO?.uuid) {
            Boolean status = libraryService.update(studentCO)
            if (status) {
                result.code = 200
                result.status="SUCCESS"
            }
            else {
                result.code=302
                result.status="ERROR"
            }
        }

        render template: '/libraryManagementSystem/studentRecordTemplate', model: ['studentList': studentCO]

        result as  JSON
    }

    def deleteStudentDetails(){

        Map result=[:]
        println(params)
        if (params.uuid){
            Student student=Student.findByUuid(params.uuid)
            if (student){
                student.delete(flush:true)
                result.code=200
                result.status="SUCCESS"
            }else {
                result.code=400
                result.status="Error"
            }
        }
        render template: '/libraryManagementSystem/studentRecordTemplate', model: ['studentList': Student.list()]
    }

    def fetchBookDetails(){
        List<Book> bookList=Book.list()
        render(template: '/libraryManagementSystem/bookRecordTemplate', model: ['bookList': bookList])
    }

    def createBookDetails(BookCO bookCO) {
        Map result = [:]
        println("")
        println("")
        println("")
        println("")
        Book book = new Book(bookCO)
        book.save()
       // println eachError()
        result.code = 200
        result.status = "Saved"
        render template: '/libraryManagementSystem/bookRecordTemplate', model: ['bookList': book.list()]
        result as JSON
    }

    def updateBookDetails(){
        Map result=[:]
        BookCO bookCO=new BookCO()

    }


}
