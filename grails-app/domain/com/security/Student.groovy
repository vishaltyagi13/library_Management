package com.security

import CO.StudentCO


class Student implements Serializable {
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

    public Student(StudentCO studentCO) {
        this.rollNo = studentCO.rollNo
        this.name = studentCO.name
        this.fatherName = studentCO.fatherName
        this.course = studentCO.course
        this.stream = studentCO.stream
        this.address = studentCO.address
    }
}
