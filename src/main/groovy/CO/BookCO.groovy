package CO

import grails.validation.Validateable

class BookCO implements Validateable {
    String uuid = UUID.randomUUID()
    String bookName
    String publisherName
    String writterName
    Long year
    Integer price

    static constraints ={

        uuid nullable: false
        bookName nullable: false
        publisherName nullable:false
        writterName nullable:false
         year nullable:false
        price nullable:false
    }

}
