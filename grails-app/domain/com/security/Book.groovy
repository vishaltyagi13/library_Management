package com.security

import CO.BookCO

class Book implements Serializable {

    String uuid = UUID.randomUUID()
    String bookName
    String publisherName
    String writterName
    Long   year
    Integer price

    static constraints = {

        uuid nullable: false
        bookName nullable: false
        publisherName nullable: false
        writterName nullable: false
        year nullable: false
        price nullable: false
    }

    public Book(BookCO bookCO){

        this.uuid=  bookCO.uuid
        this.bookName=bookCO.bookName
        this.publisherName=bookCO.publisherName
        this.writterName=bookCO.writterName
        this.year=bookCO.year
        this.price=bookCO.price
    }
}
