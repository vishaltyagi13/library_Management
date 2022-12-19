package library.management

import CO.BookCO
import CO.BookIssueCO
import CO.BookReturnDetailsCO
import CO.StudentCO
import com.security.Book
import com.security.BookIssue
import com.security.BookReturn
import com.security.Student
import com.security.User
import grails.converters.JSON

class LibraryController {

    LibraryService libraryService
    JobExecutionService jobExecutionService
    def passwordEncoder

    def view() {
        List<Book> availableBookList = libraryService.availableBooks()
        List<Book> bookList = Book.list()
        List<Book> listOfBooks = libraryService.fetchMostPopularBooksDetail()
        List<Book> newBooks = libraryService.fetchMostPopularWritterBooksDetail()
        List<Book> newRecentBooks = libraryService.fetchRecentAddedBooksDetail()
        render view: '/libraryManagementSystem/dashboard', model: [availableBookList: availableBookList, bookList: bookList, 'listOfBooks': listOfBooks, 'newBook': newBooks, 'newRecentBooks': newRecentBooks]
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
        Boolean isValidated = studentCO.validate()
        println ""
        println ""
        println ""
        println "isValidated    " + isValidated
        println ""
        println ""
        println ""
        println(" name value :" + studentCO.name)
        println " "
        println " "
        println " "
        println " "
        println " "
        println " "
        studentCO.errors.each {
            println(it)
        }
        if (isValidated) {
            println "in if Part "
            println "    "
            println "    "
            println "    "
            println " value of name : " + studentCO.name
            println "    "
            println "    "
            println "value: " + isValidated
            result.code = "200"
            result.message = "Saved"
            Student student = new Student(studentCO)
            student.save()
            println ""
            println ""
            println ""
            println ""
            println ""
            println ""
            println ""
            result.template = g.render(template: '/libraryManagementSystem/studentRecordTemplate', model: [studentList: Student.list()])
        } else {
            result.code = "402"
            result.message = "Validation Errors"
            println "in else part"
            println ""
            println ""
            println ""
            println "value of isValidated in else part: " + isValidated
            println ""
            println ""
            println ""
            println ""
            println " name value in else part :" + studentCO.name
            println ""
            println ""
            println ""
            println ""
            println ""
            result.template = g.render(template: '/libraryManagementSystem/studentRegisterFormTemplate', model: [studentCO: studentCO])
        }
        render result as JSON
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
        result.code = 200
        result.status = "Success"
        render(view: '/libraryManagementSystem/createUpdateBookRecord', model: ['bookList': bookList])
    }

    def createBookDetails(BookCO bookCO) {
        Map result = [:]
        Boolean isValidated = bookCO.validate()
        println ""
        println ""
        println ""
        println "isValidated    " + isValidated
        println ""
        println ""
        println ""
        println(" name value :" + bookCO.bookName)
        println " "
        println " "
        println " "
        println " "
        println " "
        println " "
        bookCO.errors.each {
            println(it)
        }
        if (isValidated) {
            println "in if Part "
            println "    "
            println "    "
            println "    "
            println " value of name : " + bookCO.bookName
            println "    "
            println "    "
            println "value: " + isValidated
            result.code = "200"
            result.message = "Saved"
            Book book = new Book(bookCO)
            book.save()
            println ""
            println ""
            println ""
            println ""
            println ""
            println ""
            println ""
            result.template = g.render(template: '/libraryManagementSystem/bookRecordTemplate',model: ['bookList': book.list()])
        } else {
            result.code = "402"
            result.message = "Validation Errors"
            println "in else part"
            println ""
            println ""
            println ""
            println "value of isValidated in else part: " + isValidated
            println ""
            println ""
            println ""
            println ""
            println " name value in else part :" + bookCO.bookName
            println ""
            println ""
            println ""
            println ""
            println ""
            result.template = g.render(template: '/libraryManagementSystem/bookRegisterFormTemplate',model: ['bookCO':bookCO])
        }
        render result as JSON
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
        List<BookIssueCO> bookIssueList = jobExecutionService.calculateFine()
        List<Book> availableBookList = Book.list()

        render(view: '/libraryManagementSystem/issueBookRecord', model: ['bookIssueList': bookIssueList, availableBookList: availableBookList])

    }

    def createIssueBookDetails(BookIssueCO bookIssueCO) {
        Map result = [:]
        BookIssue issueBook = new BookIssue(bookIssueCO)
        if (bookIssueCO.validate()) {
            issueBook.save()
            String name = libraryService.insertAvailibiltyAndIssueCounts()
            result.code = 200
            result.status = "Success"
            render(template: '/libraryManagementSystem/issueBookRecordTable', model: ['bookIssueList': issueBook.list()])
        }
    }

    def updateIssueBookDetails() {
        Map result = [:]
        BookIssueCO bookIssueCO = new BookIssueCO()
        bindData(bookIssueCO, params)
        if (bookIssueCO?.uuid) {
            Boolean status = libraryService.updateBookIssue(bookIssueCO)
            String name = libraryService.insertAvailibiltyAndIssueCounts()
            if (status) {
                result.code = 200
                result.status = "Updated"
            } else {
                result.code = 302
                result.status = "Record not found"
            }
        }
        render template: '/libraryManagementSystem/issueBookRecordTable', model: ['bookIssueList': bookIssueCO]
    }

    def deleteIssueBookDetails() {
        Map result = [:]
        println(params)
        if (params.uuid) {
            BookIssue bookIssue = BookIssue.findByUuid(params.uuid)
            if (bookIssue) {
                bookIssue.delete()
                result.code = 200
                result.message = "Delete Successfully"
            } else {
                result.code = 404
                result.message = "record not found"
            }
        }
        render(template: '/libraryManagementSystem/issueBookRecordTable', model: ['bookIssueList': BookIssue.list()])
    }

    def bookIssue(Integer availableCount) {
        Book book = Book.createCriteria().get {
            eq('count', availableCount)
            le("availableCount", 0)
        }
    }

    def searchReturnBookDetails() {
        Student student = Student.findByRollNo(params.rollNo)
        Book book = Book.findByUuid(params.bookId)
        BookIssue bookIssue = BookIssue.findByBookIdAndStudentId(book?.id, student?.id)
        Map result = [:]
        Map<String, Date> dateMap = libraryService.fetchIssueAndDueDate(bookIssue.bookId, bookIssue.studentId)
        result.code = 200
        result.status = "Success"
        result.dateMap = dateMap
        render libraryService.fetchIssueAndDueDate(bookIssue.bookId, bookIssue.studentId) as JSON
    }

    def fetchBookReturnDetals() {
        List<BookReturn> bookReturnList = libraryService.fetchBookReturn() as List<BookReturn>
        List<Book> bookList = Book.list()
        render view: '/libraryManagementSystem/bookReturnRecordTable', model: [bookReturnList: bookReturnList, bookList: bookList]
    }

    def createBookReturnDetails(BookReturnDetailsCO bookReturnCO) {
        Map result = [:]
        BookReturn bookReturn = new BookReturn(bookReturnCO)
        if (bookReturnCO.validate()) {
            bookReturn.save()
            result.code = 200
            result.status = "Success"
            render template: '/libraryManagementSystem/BookReturnRecordTable', model: [bookReturnList: bookReturn.list()]
        }
    }

    def updateBookReturnDetails() {
        Map result = [:]
        BookReturnDetailsCO bookReturnCO = new BookReturnDetailsCO()
        bindData(bookReturnCO, params)
        if (bookReturnCO?.uuid) {
            Boolean status = libraryService.updateReturnBook(bookReturnCO)
            if (status) {
                result.code = 200
                result.status = "Updated"
            } else {
                result.code = 302
                result.status = "Record not found"
            }
        }
        render template: '/libraryManagementSystem/BookReturnRecordTable', model: [bookReturnList: bookReturnCO]
    }

    def deleteBookReturnDetails() {
        Map result = [:]
        println(params)
        if (params.uuid) {
            BookReturn bookReturn = BookReturn.findByUuid(params.uuid)
            if (bookReturn) {
                bookReturn.delete()
                result.code = 200
                result.message = "Delete Successfully"
            } else {
                result.code = 404
                result.message = "record not found"
            }
        }
    }

    def validateCredentials(String username, String password) {
        Map result = [:]
        User user = User.findByUsername(username)
        if (user) {
            Boolean passwordValid = passwordEncoder.isPasswordValid(user.password, password as String, null)
            if (passwordValid) {
                result.code = 200
                result.message = "Successfully Login"
            } else {

                result.code = 404
                result.error = true
                result.message = "Invalid Username and Password"
            }
        }
        render result as JSON
    }
}