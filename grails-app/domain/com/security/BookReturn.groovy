package com.security


import CO.BookReturnDetailsCO
import grails.util.Holders
import library.management.LibraryService
import util.DateUtil

class BookReturn implements Serializable {

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

    public BookReturn(BookReturnDetailsCO bookReturnCO){
        this.bookId= Book.findByUuid(bookReturnCO.bookId)?.id
        this.studentId=Student.findByRollNo(bookReturnCO.rollNo)?.id
        this.issueDate= DateUtil.stringToDate(bookReturnCO.issueDate)
        this.dueDate=DateUtil.stringToDate(bookReturnCO.dueDate)
    }

    def afterInsert(){
        try{
            Thread.start {
                Thread.sleep(6000)
                LibraryService libraryService = Holders.applicationContext.getBean('libraryService')
                println(bookId)
                println(studentId)
                libraryService.updateIsActive(bookId,studentId)
            }
            println(bookId)
            println(studentId)
        }catch(Exception e){
            e.printStackTrace()
        }
    }
}
