package library.management

import CO.BookCO
import CO.BookIssueCO
import CO.BookReturnDetailsCO
import CO.StudentCO
import com.security.Book
import com.security.BookIssue
import com.security.BookReturn
import com.security.Role
import com.security.Student
import com.security.User
import com.security.UserRole
import grails.transaction.Transactional
import util.DateUtil

@Transactional
class LibraryService {

    def createAndAssignUseRoleDetails() {
        User user = new User(username: "admin@perfios.com", password: "admin@123")
        user.save()
        Role role = new Role(authority: "ROLE_ADMIN")
        role.save()
        UserRole userRole = new UserRole()
        userRole.user = user
        userRole.save()
        userRole.role = role
        userRole.save()
    }

    Boolean update(StudentCO studentCO) {
        Student student = Student.findByUuid(studentCO.uuid)
        Boolean isUpdate = false
        if (student) {
            student.name = studentCO?.name
            student.rollNo = studentCO?.rollNo
            student.fatherName = studentCO?.fatherName
            student.course = studentCO?.course
            student.stream = studentCO?.stream
            student.address = studentCO?.address
            return student.save()
            isUpdate = true
        }
        return isUpdate
    }

    Boolean updateBook(BookCO bookCO) {
        Book book = Book.findByUuid(bookCO.uuid)
        Boolean isUpdate = false
        if (book) {
            book.bookName = bookCO.bookName
            book.publisherName = bookCO.publisherName
            book.year = bookCO.year
            book.writterName = bookCO.writterName
            book.totalCount = bookCO.totalCount
            book.price = bookCO.price
            return book.save()
            isUpdate = true
        }
        return isUpdate
    }

    static String fetchBookName(Long bookId) {
        String name = Book.createCriteria().get {
            eq('id', bookId)
            projections {
                property ("bookName")
            }
            maxResults(1)
        }
        return name
    }

    static String fetchStudentRollNo(Long studentId) {
        return  Student.createCriteria().get {
            eq('id',studentId)
            projections{
                property('rollNo')
            }
            maxResults(1)
        }
    }

    String fetchBookUuid(Long bookId){
        String bookUid=Book.createCriteria().get {
            eq('id',bookId)
            projections{
                property("uuid")
            }
            maxResults(1)
        }
        return  bookUid
    }

    List<BookIssueCO> fetchBookIssueDetails() {

        List<BookIssueCO> bookIssueCOList = []
        List<BookIssue> bookIssueList = BookIssue.list()
        for (BookIssue bookIssue :bookIssueList) {
            BookIssueCO bookIssueCO = new BookIssueCO()
            bookIssueCO.bookName = fetchBookName(bookIssue.bookId)
            bookIssueCO.bookId= fetchBookUuid(bookIssue.bookId)
            bookIssueCO.rollNo=fetchStudentRollNo(bookIssue.studentId)
            bookIssueCO.issueDate=bookIssue.issueDate
            bookIssueCO.dueDate=bookIssue.dueDate
            bookIssueCOList.add(bookIssueCO)
        }
        println(bookIssueCOList)
        return bookIssueCOList
    }

    Boolean updateBookIssue(BookIssueCO bookIssueCO) {

      BookIssue bookIssue= BookIssue.findByUuid(bookIssueCO.uuid)
        Boolean isUpdate = false
        if (bookIssue) {
            bookIssue.bookId =bookIssueCO ?.bookId
            bookIssue.studentId = bookIssueCO?.rollNo
           bookIssue.issueDate = DateUtil.stringToDate(bookIssueCO?.issueDate)
            bookIssue.dueDate=DateUtil.stringToDate(bookIssueCO?.dueDate)
            return bookIssue.save()
            isUpdate = true
        }
        return isUpdate
    }
    String  insertAvailibiltyAndIssueCounts(){
        List<Book>bookList=Book.list()
        for (Book book:bookList){
            Integer totalBookCount=book.totalCount
            Integer issueBookCount=BookIssue.countByBookIdAndIsActive(book.id,Boolean.TRUE)
            Integer availableBookCount=totalBookCount-issueBookCount
            book.totalCount=totalBookCount
            book.issueCount=issueBookCount
            book.availableCount=availableBookCount
            book.save()
        }
    }

    List<Book> availableBooks(){
        List<Book> availableBookList=Book.createCriteria().list {
            ne('availableCount',0)
        }?:[]
        return availableBookList
    }

    Map<String,Date> fetchIssueAndDueDate(Long bookId, Long studentId){
        Map map=[:]
        List<Date> list= BookIssue.createCriteria().get {
            'eq'('bookId',bookId)
            'eq'('studentId',studentId)
            projections{
                property("issueDate")
                property("dueDate")
            }
            maxResults(1)
        }
        println(list)
        map.put('issueDate', DateUtil.dateToString(list?.get(0)))
        map.put('dueDate',   DateUtil.dateToString(list?.get(1)))
        return map
    }

    Boolean updateReturnBook(BookReturnDetailsCO bookReturnCO) {
        BookReturn bookReturn= BookReturn.findByUuid(bookReturnCO.uuid)
        Boolean isUpdate = false
        if (bookReturn) {
            bookReturn.bookId = Book.findByUuid(bookReturnCO.bookName)?.id
            bookReturn.studentId = Student.findByRollNo(bookReturnCO.rollNo)?.id
            bookReturn.issueDate =DateUtil.stringToDate(bookReturnCO?.issueDate)
            bookReturn.dueDate=DateUtil.stringToDate(bookReturnCO?.dueDate)
            return bookReturn.save()
            isUpdate = true
        }
        return isUpdate
    }

    List<BookReturnDetailsCO> fetchBookReturn() {

        List<BookReturnDetailsCO> bookReturnCOList = []
        List<BookReturn> bookReturnList = BookReturn.list()
        for (BookReturn bookReturn :bookReturnList) {
            BookReturnDetailsCO bookReturnDetailsCO = new BookReturnDetailsCO()
            bookReturnDetailsCO.bookName = fetchBookName(bookReturn.bookId)
            bookReturnDetailsCO.rollNo=fetchStudentRollNo(bookReturn.studentId)
            bookReturnDetailsCO.issueDate=bookReturn.issueDate
            bookReturnDetailsCO.dueDate=bookReturn.dueDate
            bookReturnDetailsCO.uuid=bookReturn.uuid
            bookReturnCOList.add(bookReturnDetailsCO)
        }
        return bookReturnCOList
    }
     def migrateIsActive(){
    List<BookIssue>bookIssueList=BookIssue.findAll()
    for (BookIssue bookIssue:bookIssueList){
        bookIssue.isActive=Boolean.TRUE
        bookIssue.save()
    }
     }

     void updateIsActive(Long bookId,Long studentId){
           BookIssue bookIssue=BookIssue.findByBookIdAndStudentId(bookId,studentId)
         if (bookIssue){
             bookIssue.isActive=Boolean.FALSE
             println(bookIssue)
             bookIssue.save()
         }
    }
}