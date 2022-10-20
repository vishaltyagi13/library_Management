package com.security

import CO.BookCO

class Book implements Serializable {

    String uuid = UUID.randomUUID()
    Integer bookId
    String bookName
    String publisherName
    Date publisherYear
    String writterName
    Integer bookPrice

    static constraints = {

    uuid nullable: false
        bookId nullable: false
        bookName nullable: false
        publisherName nullable: false
        publisherYear nullable: false
        writterName nullable: false
        bookPrice nullable: false
    }

    public Book(BookCO bookCO){

        this.uuid = bookCO.uuid
        this.bookId= bookCO.bookId
        this.bookName=bookCO.bookName
        this.publisherName=bookCO.publisherName
        this.publisherYear=bookCO.publisherYear
        this.writterName=bookCO.writterName
        this.bookPrice=bookCO.bookPrice
    }
}
