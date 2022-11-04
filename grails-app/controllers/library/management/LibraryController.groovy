package library.management

import CO.BookCO
import CO.BookIssueCO
import CO.StudentCO
import com.security.Book
import com.security.BookIssue
import com.security.Student
import grails.converters.JSON

class LibraryController {

    LibraryService libraryService

    def view() {

        List<Book> books = Book.list()//TODO : Apply logic for only available books should be fetched
        render view: '/libraryManagementSystem/dashboard', model: [books: books]
    }

    def fetchStudentDetails() {
        Map result = [:]
        List<Student> studentList = Student.list()
        result.code = 200
        result.status = "SUCCESS"
        render(view: '/libraryManagementSystem/createUpdateStudentRecord', model: [studentList: studentList])
    }

    def createStudentDetails(StudentCO studentCO) {
        Map result = [:]
        Student student = new Student(studentCO)
        student.save()
        result.code = 200
        result.status = "Saved"
        result.template = g.render(template: '/libraryManagementSystem/studentRecordTemplate', model: [studentList: Student.list()])
        result as JSON
    }

    def updateStudentDetails() {
        Map result = [:]
        StudentCO studentCO = new StudentCO()
        bindData(studentCO, params)
        if (studentCO?.uuid) {
            Boolean status = libraryService.update(studentCO)
            if (status) {
                result.code = 200
                result.status = "SUCCESS"
            } else {
                result.code = 302
                result.status = "ERROR"
            }
        }
        render template: '/libraryManagementSystem/studentRecordTemplate', model: ['studentList': studentCO]
        result as JSON
    }

    def deleteStudentDetails() {
        Map result = [:]
        println(params)
        if (params.uuid) {
            Student student = Student.findByUuid(params.uuid)
            if (student) {
                student.delete(flush: true)
                println("after delete")
                result.code = 200
                result.status = "SUCCESS"
            } else {
                result.code = 400
                result.status = "Error"
            }
        }
        result.template = g.render(template: '/libraryManagementSystem/studentRecordTemplate', model: [studentList: Student.list()])
    }

    def fetchBookDetails() {
        Map result = [:]
        List<Book> bookList = Book.list()
        result.code=200
        result.status="Success"
        render(view: '/libraryManagementSystem/createUpdateBookRecord', model: ['bookList': bookList])
    }

    def createBookDetails(BookCO bookCO) {
        Map result = [:]
        Book book = new Book(bookCO)
            book.save(flush: true)
            result.code = 200
            result.status = "Success"
            render template: '/libraryManagementSystem/bookRecordTemplate', model: ['bookList': book.list()]
            result as JSON

    }

    def updateBookDetials() {
        Map result = [:]
        BookCO bookCO = new BookCO()
        bindData(bookCO, params)
        if (bookCO?.uuid) {
            Boolean status = libraryService.updateBook(bookCO)
            if (status) {
                result.code = 200
                result.message = "Upadte Successfully"
            } else {
                result.code = 302
                result.status = "Record not found"
            }
        }
        render template: '/libraryManagementSystem/bookRecordTemplate', model: ['bookList': bookCO]
    }

    def deleteBookDetails() {
        Map result = [:]
        println(params)
        if (params.uuid) {
            Book book = Book.findByUuid(params.uuid)
            if (book) {
                book.delete(flush: true)
                result.code = 200
                result.status = "Delete"
            } else {
                result.code = 404
                result.message = "record not found"
            }
        }
        render template: '/libraryManagementSystem/bookRecordTemplate', model: ['bookList': Book.list()]
    }

    def fetchIssueBookDetails() {
        List<BookIssue> list = BookIssue.list()
        render(view: '/libraryManagementSystem/issueBookRecord', model: ['issueBookList': list])
    }

    def createIssueBookDetails(BookIssueCO bookIssueCO) {
        Map result = [:]
        BookIssue issueBook = new BookIssue(bookIssueCO)
        println("")
        println("")
        println("")
        println("before save")
        issueBook.save()
        result.code = 200
        result.status = "Success"
        render(template: '/libraryManagementSystem/issueBookRecordTemplate', model: ['issueBookList': issueBook.list()])
    }
}