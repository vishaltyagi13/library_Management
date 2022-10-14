package library.management

import CO.StudentCO
import com.security.Role
import com.security.Student
import com.security.User
import com.security.UserRole
import grails.transaction.Transactional

@Transactional
class LibraryService {

    def createAndAssignUseRoleDetails() {
        User user = new User(username: "admin@perfios.com", password: "admin@123")
        user.save()
        Role role = new Role(authority: "ROLE_ADMIN")
        role.save()
        UserRole userRole = new UserRole()
        userRole.user = user
        userRole.save()
        userRole.role = role
        userRole.save()
    }

    Boolean update(StudentCO studentCO) {
        Student student = Student.findByRollNo(studentCO.rollNo)
        if (student) {
            student.name = studentCO.name
            student.rollNo = studentCO.rollNo
            student.fatherName = studentCO.fatherName
            student.course = studentCO.course
            student.stream = studentCO.stream
            student.address = studentCO.address
        }
        return student.save() ? Boolean.TRUE : Boolean.FALSE
    }


}
