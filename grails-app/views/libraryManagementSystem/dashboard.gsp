<%@ page contentType="text/html;charset=UTF-8" %>
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

<body>
<div class="header">
    <a href="#default" class="logo">LibraryManagement</a>

    <div class="header-right">
        <a class="active" href="#" data-toggle="modal"
           data-target="#modal-studentRecord">New Student</a>
        <a href="#" data-toggle="modal"
        data-target="#modal-bookRecord">New Book</a>
        <a href="#Detail">Detail</a>
        <a href="#Issue Book">Issue Book</a>
        <a href="#Return Book">Return Book</a>
        <a href="#Logout">Logout</a>
    </div>
</div>
<g:render template="/libraryManagementSystem/createStudentModal"/>
<g:render template="/libraryManagementSystem/createBookModal"/>


<div id="mySidenav" class="sidenav">
    <a href="${createLink(controller: 'library', action: 'fetchStudentDetails')}" onclick="studentRecords()">students</a>
    <a href="${createLink(controller: 'library',action: 'fetchBookDetails')}" onclick="BookRecords">Books</a>
</div>
</body>
</html>
<script>

    function studentRecords(){
        $.ajax({
            url:"${createLink(controller: "library",action: "fetchStudentDetails")}",
            method:"POST",
            data:{},
            success:function (data){
                if (data.code==200){
                    $("#myTable").html(data.template);
                }
                else{
                    $.notify("Error","error");
                }
            }
        })
    }

    function BookRecords(){
        $.ajax({
            url:"${createLink(controller: "library",action: "fetchBookDetails")}",
            method:"POST",
            data:{},
            success:function (data){
                if (data.code==200){
                    $("#myBook").html(data.template);
                }
                else{
                    $.notify("Error","error");
                }
            }
        })
    }
</script>

