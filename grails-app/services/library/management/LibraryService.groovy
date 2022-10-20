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
        if (student) {

            student.name = studentCO?.name
            student.rollNo = studentCO?.rollNo
            student.fatherName = studentCO?.fatherName
            student.course = studentCO?.course
            student.stream = studentCO?.stream
            student.address = studentCO?.address
        }
        return student?.save() ? Boolean.TRUE : Boolean.FALSE
    }

    Boolean updateBook(BookCO bookCO){
        Book book = Book.findByUuid(bookCO.uuid)
            if (book){
                book.bookId = bookCO.bookId
                book.bookName = bookCO.bookName
                book.publisherName = bookCO.publisherName
                book.publisherYear = bookCO.publisherYear
                book.writterName = bookCO.writterName
                book.bookPrice = bookCO.bookPrice
            }
         return book.save() ? Boolean.TRUE : Boolean.FALSE
    }
}
