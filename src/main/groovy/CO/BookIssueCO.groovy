package CO

import com.security.Book
import com.security.Student
import grails.validation.Validateable
import util.DateUtil

class BookIssueCO implements Validateable {

    String uuid
    String bookName
    String bookId
    String rollNo
    String issueDate
    String dueDate
    Integer fine
    Boolean isActive

    static constraints={
         uuid nullable:true
        bookName (nullable: true , validator: { value , object ->
            if (!value){
              println("")
              println("")
              println("")
              println("")
              println("value of bookName :" + value)
                println("")
                println("")
                println("")
                println("in if part: " )
            }
        })
        bookId nullable:false
        rollNo nullable:false
        issueDate nullable:false
        dueDate nullable:false
        fine nullable: false
    }
}
