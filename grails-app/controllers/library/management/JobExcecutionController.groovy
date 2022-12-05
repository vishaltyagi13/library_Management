package library.management

import CO.BookIssueCO
import com.security.Book
import com.security.BookIssue
import com.security.Student

class JobExcecutionController {

    JobExecutionService jobExecutionService
    LibraryService libraryService

    def index(){
       // String bookName
        libraryService.recentAddedBooks()
        render "ok"
    }

}