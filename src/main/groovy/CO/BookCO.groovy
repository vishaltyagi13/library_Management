package CO

import grails.validation.Validateable

class BookCO implements Validateable {
    String uuid
    String identityNumber
    String bookName
    String publisherName
    String writterName
    Long year
    Integer totalCount
    Integer price

    static constraints ={

        uuid nullable: true
        identityNumber nullable: true
        bookName nullable: false
        publisherName nullable:false
        writterName nullable:false
         year nullable:false
        totalCount nullable: false
        price nullable:false
    }

}
