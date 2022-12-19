package CO

import com.security.Book
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
    Date dateAdded

    static constraints = {

        uuid nullable: true
        identityNumber nullable: true
        bookName(nullable: true, validator: { value, object ->
            println "Value   :   " + value
            if (!value){
                return "book.name.is.mandatory"
            }
            else {
                 println("")
                 println("")
                 println("")
                 println("")
                 println("value of bookName in else part:" + value)
             }
        })
        publisherName(nullable: true, validator: { value, object ->
//            if (!value) {
//                println("")
//                println("")
//                println("")
//                println("")
//                println("")
//                println("")
//                println(" value of roll No : " + value)
//                println(" ")
//                println(" ")
//                println(" ")
//                println("********* publisherName cannot null ********")
//                println("")
//                println("")
//                println("")
//                return "publisher.name.is.mandatory"
//            }
//            else {
//                println("")
//                println("")
//                println("")
//                println("")
//                println("")
//                println("")
//                println(" value of publisherName in else part :" + value)
//            }

        })
        writterName(nullable: true, validator: { value, object ->
//              if (!value){
//                  println (" ")
//                  println (" ")
//                  println (" ")
//                  println (" ")
//                  println (" ")
//                  println (" value of writterName :" + value )
//                  println (" ")
//                  println (" ")
//                  println (" ")
//                  println (" ################# publisherName cannot null ###########")
//                  println " "
//                  println " "
//                  println " "
//                  println " "
//                  return "writter.name.is.mandatory"
//              }else {
//                  println("")
//                  println("")
//                  println("")
//                  println("")
//                  println(" value of writterName in else part :" + value)
//              }
        })
        year (nullable:true , validator: { value , object ->
//            if (!value){
//                println (" ")
//                println (" ")
//                println (" ")
//                println (" ")
//                println (" ")
//                println ("value of Year :" + value)
//                println ( " ")
//                println ( " ")
//                println ( " ")
//                println ("@@@@@@@@@ Year not Null @@@@@@@@@")
//                println (" ")
//                println (" ")
//                println (" ")
//                return "book.year.is.mandatory"
//            }else {
//                println("")
//                println("")
//                println("")
//                println("")
//                println("")
//                println(" value of year in else part :" + value)
//            }
        })
        totalCount (nullable:  true , validator: {  value , object ->
//            if (!value){
//                 println("")
//                 println("")
//                 println("")
//                 println("")
//                 println("")
//                 println("value of totalCount:" + value)
//                 println("")
//                 println("")
//                 println("")
//                 println("TotalCount not null")
//                 println("")
//                 println("")
//                 println("")
//                 println("")
//                return "total.count.is.mandatory"
//            }else {
//                println("")
//                println("")
//                println("")
//                println("")
//                println("value of totalCount in else part :" + value)
//            }
        })
        price (nullable:true , validator: { value , object ->
//            if (!value){
//                println("")
//                println("")
//                println("")
//                println("")
//                println("value of price :" + value)
//                println("")
//                println("")
//                println("")
//                println(" price is not null")
//                println("")
//                println("")
//                println("")
//                return "book.price.is.mandatory"
//            }

        })
         dateAdded nullable: true

}
}