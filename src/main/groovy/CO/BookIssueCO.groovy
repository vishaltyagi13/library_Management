package CO

import grails.validation.Validateable

class BookIssueCO implements Validateable {

    String uuid
    String bookId
    String rollNo
    String issueDate
    String dueDate

    static constraints={
         uuid nullable:true
        bookId nullable:false
        rollNo nullable:false
        issueDate nullable:false
        dueDate nullable:false
    }
}
