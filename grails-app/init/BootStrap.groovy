import library.management.LibraryService

class BootStrap {
    LibraryService libraryService
    def init = { servletContext ->
        //  libraryService.createAndAssignUseRoleDetails()

    }
    def destroy = {
    }
}
