package library.management

import CO.BookCO
import CO.StudentCO
import com.security.Book
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
        Student student = Student.findByUuid(studentCO.uuid)
        Boolean isUpdate=false
        if (student) {
            student.name = studentCO?.name
            student.rollNo = studentCO?.rollNo
            student.fatherName = studentCO?.fatherName
            student.course = studentCO?.course
            student.stream = studentCO?.stream
            student.address = studentCO?.address
            return student.save()
            isUpdate=true
        }
        return  isUpdate
    }

    Boolean updateBook(BookCO bookCO){
        Book book = Book.findByUuid(bookCO.uuid)
        Boolean isUpdate = false
            if (book){
                book.bookName = bookCO.bookName
                book.publisherName = bookCO.publisherName
                book.year = bookCO.year
                book.writterName = bookCO.writterName
                book.totalCount= bookCO.totalCount
                book.price = bookCO.price
                return book.save()
                isUpdate =true
            }
         return isUpdate
    }
}