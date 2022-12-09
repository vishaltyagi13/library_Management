package library.management

import CO.BookIssueCO
import com.security.Book
import com.security.BookIssue
import com.security.Student
import grails.transaction.Transactional



@Transactional
class JobExecutionService {


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

    List<BookIssueCO> calculateFine() {
        Integer perDayCharge=10
        Integer fine=0
        List<BookIssueCO> bookIssueCOList = []
        Date returnDate = new Date()
        List<BookIssue> bookIssueList = BookIssue.findAll()
        for (BookIssue bookIssue : bookIssueList) {
            BookIssueCO bookIssueCO = new BookIssueCO()
            bookIssueCO.bookName = fetchBookName(bookIssue.bookId)
            bookIssueCO.rollNo = fetchStudentRollNo(bookIssue.studentId)
            bookIssueCO.issueDate = bookIssue.issueDate
            bookIssueCO.dueDate = bookIssue.dueDate
            bookIssueCO.isActive= bookIssue.isActive
            Integer noOfDays = returnDate - bookIssue.dueDate
            if (noOfDays > 0 && bookIssueCO.isActive ) {
                 fine = noOfDays * perDayCharge
                bookIssueCO.fine=fine
            }
            else{
                fine=0
                bookIssueCOList.add(bookIssueCO)
            }
            bookIssueCOList.add(bookIssueCO)
        }

        return bookIssueCOList
    }
}