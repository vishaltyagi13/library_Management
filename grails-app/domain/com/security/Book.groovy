package com.security

import CO.BookCO


class Book implements Serializable {

    private static final long serialVersionUID = 2L

    String uuid = UUID.randomUUID()
    String identityNumber
    String bookName
    String publisherName
    String writterName
    Long year
    Integer totalCount
    Integer availableCount=0
    Integer issueCount=0
    Integer price

    static constraints = {

        identityNumber nullable: true
        bookName nullable: false , unique: true
        publisherName nullable: false
        writterName nullable: false
        year nullable: false
        totalCount nullable: false

        price nullable: false
    }

    public Book(BookCO bookCO) {

        this.identityNumber = bookCO.identityNumber
        this.bookName = bookCO.bookName
        this.publisherName = bookCO.publisherName
        this.writterName = bookCO.writterName
        this.year = bookCO.year
        this.totalCount=bookCO.totalCount
        this.price = bookCO.price
    }

    def afterInsert() {
        generateIdentityNumber()

    }

   def generateIdentityNumber() {
       if (this.id) {
            this.identityNumber = "BK" + id
       }
    }
}