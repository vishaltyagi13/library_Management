<%@ page%>
<html>
<head>
    <title></title>
    <asset:stylesheet src="style.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400"
          rel="stylesheet"
          type="text/css">
    <asset:javascript src="application.js"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
        <th style="text-align: center">Status</th>
        <th colspan="2" style="text-align: center">Action</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${bookIssueList}" var="issueBook">
        <tr id="myDiv_${issueBook?.uuid}">
            <td name="bookName" id="book_Name_${issueBook?.uuid}">${(issueBook.bookName)}</td>
            <td name="studentId" id="student_Name_${issueBook?.uuid}">${(issueBook.rollNo)}</td>
            <td name="issueDate" id="issue_date_${issueBook?.uuid}">${issueBook?.issueDate}</td>
            <td name="dueDate" id="dueDate_${issueBook?.uuid}">${issueBook?.dueDate}</td>
            <td name="fine" id="fine_${issueBook?.uuid}">${issueBook?.fine}</td>
            <g:if test="${issueBook?.isActive}">
              <td style="color: red">Issued</td>
            </g:if>
            <g:else>
                <td style="color: green">Available</td>
            </g:else>

            <td><button id="btn2" data-toggle="modal"
                        data-target="#modal-updateIssueBook"
                        onclick='autoFillIssueBookRecord("${issueBook?.uuid}", "${issueBook?.bookName}","${issueBook?.rollNo}", "${issueBook?.issueDate}", "${issueBook?.dueDate}")'>Edit</button>
            <button id="btn1" onclick='issueBookDelete("${issueBook?.uuid}")'>Delete</button></td>
        </tr>
    </g:each>
    </tbody>
</table>
    <g:render template="/libraryManagementSystem/updateBookIssueModal"/>

</html>
<script>
    function autoFillIssueBookRecord(uuid,bookName,rollNo, issueDate, dueDate) {
        alert(bookName);
        var e = document.getElementById("issueBookName");
        for (var i=0; i<e.options.length;i++) {
            if(e.options[i].text==bookName){
                e.options[i].selected=true;
                break ;
            }
        }
        $("#issueRollNo").val(rollNo);
        $("#issueDate").val(issueDate);
        $("#dueDate").val(dueDate);
        $("#uuid").val(uuid);
    }

    function issueBookDelete(uuid) {
        $.ajax({
            url: "${createLink(controller:'library',action:'deleteIssueBookDetails')}",
            method: "POST",
            data: {'uuid':uuid},
            success: function (data) {
                if (data.code == 200) {
                    alert("Success");
                    $("#issueBook").html(data.template);
                }
            }
        })
    }
</script>