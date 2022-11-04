<html>
<head>
    <title></title>
</head>
<div style="margin-left: 11%">
<table id="issueBook">
    <thead>
    <tr>
        <th style="text-align: center">Book Name</th>
        <th style="text-align: center">Roll No</th>
        <th style="text-align: center">Issue Date</th>
        <th style="text-align: center">Due Date</th>
        <th style="text-align: center">Fine</th>
        <th colspan="2" style="text-align: center">Action</th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${issueBookList}" var="issueBook">
        <tr id="myDiv_${issueBook?.uuid}">
            <td name="bookId" id="book_Id_${issueBook?.uuid}">${issueBook?.bookId}</td>
            <td name="studentId" id="student_Name_${issueBook?.uuid}">${issueBook?.studentId}</td>
            <td name="issueDate" id="issue_date_${issueBook?.uuid}">${issueBook?.issueDate}</td>
            <td name="dueDate" id="dueDate_${issueBook?.uuid}">${issueBook?.dueDate}</td>
            <td style="visibility: hidden" name="fine" id="fine_${issueBook?.uuid}"></td>


            <td><button id="btn2">Edit</button>
            <button id="btn1">Delete</button></td>
        </tr>
    </g:each>
    </tbody>
</table>
</html>