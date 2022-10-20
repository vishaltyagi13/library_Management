package com.security

import CO.StudentCO


class Student implements Serializable {
    String uuid = UUID.randomUUID()
    Integer rollNo
    String name
    String fatherName
    String course
    String stream
    String address

    static constraints = {
        uuid nullable: false
        rollNo nullable: false
        name nullable: false
        fatherName nullable: false
        course nullable: false
        stream nullable: false
        address nullable: true

    }

    public Student(StudentCO studentCO) {
        this.uuid=  studentCO.uuid
        this.rollNo = studentCO.rollNo
        this.name = studentCO.name
        this.fatherName = studentCO.fatherName
        this.course = studentCO.course
        this.stream = studentCO.stream
        this.address = studentCO.address
    }
}
