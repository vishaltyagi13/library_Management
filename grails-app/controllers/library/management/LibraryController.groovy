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
        render(view: '/libraryManagementSystem/createUpdateStudentRecord', model: [studentList: studentList])
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
                println("after delete")
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

    def createBookDetails(BookCO bookCO){
        Map result=[:]
        Book book= new Book(bookCO)
        book.save(flush:true)
        result.code=200
        result.status="Success"
        render template: '/libraryManagementSystem/bookRecordTemplate',model: ['bookList':book.list()]
        result as JSON
    }

    def updateBookDetials(){
        Map result=[:]
        BookCO bookCO=new BookCO()
        bindData(bookCO,params)
        if (bookCO?.uuid){
            Boolean status = libraryService.updateBook(bookCO)
            if (status){
                result.code=200
                result.message="Upadte Successfully"
            }else{
                result.code=302
                result.status="Record not found"
            }
        }
        render template: '/libraryManagementSystem/bookRecordTemplate',model: ['bookList':bookCO]
    }

    def deleteBookDetails(){
        Map result=[:]
        println(params)
        if(params.uuid){
            Book book = Book.findByUuid(params.uuid)
            if (book){
                book.delete(flush: true)
                result.code=200
                result.status="Delete"
            }
            else{
                result.code=404
                result.message="record not found"
            }
        }
        render template: '/libraryManagementSystem/bookRecordTemplate',model: ['bookList':Book.list()]
    }
}