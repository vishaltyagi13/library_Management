package CO

import grails.validation.Validateable

class BookCO implements Validateable {

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
}
