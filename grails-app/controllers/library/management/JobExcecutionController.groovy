package library.management

import CO.BookIssueCO
import com.security.Book
import com.security.BookIssue
import com.security.Student

class JobExcecutionController {

    JobExecutionService jobExecutionService

    def method() {
        List<BookIssueCO> bookIssueList = jobExecutionService.calculateFine()
        println(bookIssueList)
        render "ok"

//        Book book=Book.findByUuid(params.bookId)
//        println(book)
//        BookIssue bookIssue=BookIssue.findByBookIdAndStudentId(book?.id,student?.id)
//        Map<String,Date> stringDateMap=jobExecutionService.calculateFine(bookIssue.bookId, bookIssue.studentId)
//        render "ok"
//        return stringDateMap

    }
}
//Student student=Student.findByRollNo(params.rollNo)
//BookIssue bookIssue=BookIssue.findByBookIdAndStudentId(bookId,student?.id)
