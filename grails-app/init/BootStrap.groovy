import com.security.BookIssue
import library.management.LibraryService

class BootStrap {
    LibraryService libraryService
    def init = { servletContext ->
         // libraryService.createAndAssignUseRoleDetails()
//        List<BookIssue>bookIssueList=BookIssue.findAll()
//          for (BookIssue bookIssue:bookIssueList){
//              println(bookIssue.uuid)
//              println(bookIssue.bookId)
//             bookIssue.isActive=Boolean.TRUE
//              println(bookIssue.isActive)
//              bookIssue.save()
//          }
        libraryService.migrateIsActive()
  }
    def destroy = {
    }
}
