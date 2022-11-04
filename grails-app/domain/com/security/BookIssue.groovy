package com.security

import CO.BookIssueCO
import util.DateUtil

class BookIssue implements Serializable {

    String uuid = UUID.randomUUID()
    Long bookId
    Long studentId
    Date issueDate
    Date dueDate

    static constraints = {

        bookId nullable: false
       studentId nullable: false
        issueDate nullable: false
        dueDate nullable: false
    }

    public BookIssue(BookIssueCO bookIssueCO){
        this.bookId= Book.findByUuid(bookIssueCO.bookId)?.id
        this.studentId=Student.findByRollNo(bookIssueCO.rollNo)?.id
        this.dueDate=DateUtil.stringToDate(bookIssueCO.dueDate)
        this.issueDate=DateUtil.stringToDate(bookIssueCO.issueDate)
    }
}