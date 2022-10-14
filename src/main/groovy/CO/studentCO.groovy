package CO

import grails.validation.Validateable

class StudentCO implements Validateable {

    Integer rollNo
    String name
    String fatherName
    String course
    String stream
    String address

    static constraints = {

        rollNo nullable: false
        name nullable: false
        fatherName nullable: false
        course nullable: false
        stream nullable: false
        address nullable: true

    }
}