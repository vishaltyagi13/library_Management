package CO

import grails.validation.Validateable

class BookReturnDetailsCO implements Validateable {

    String uuid
    String bookName
    String bookId
    String rollNo
    String issueDate
    String dueDate

    static constraints={
        bookId (nullable: false , validator: { value,object ->

        })
        rollNo nullable: false
        issueDate nullable: false
        dueDate nullable: false
    }
}
