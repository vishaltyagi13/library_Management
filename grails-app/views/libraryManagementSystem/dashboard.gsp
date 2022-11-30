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
    <style>
    .modal-header, h4, .close {
        background-color: dodgerblue;
        color: #ffffff !important;
        text-align: center;
        font-size: 25px;
        padding: 12px;
    }

    th {
        padding: 10px !important;
        background-color: dodgerblue;
        color: #ffffff;
    }

    td {
        padding: 2px !important;
    }
    </style>

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
        <a href="#" data-toggle="modal" data-target="#modal-issueBook">Issue Book</a>
        <a href="#" data-toggle="modal" data-target="#modal-bookReturn">Return Book</a>
        <a href="#Logout">Logout</a>
    </div>
</div>
<g:render template="/libraryManagementSystem/createStudentModal"/>
<g:render template="/libraryManagementSystem/createBookModal"/>
<g:render template="/libraryManagementSystem/createIssueBookModal" model="[availableBookList:availableBookList]"/>
<g:render template="/libraryManagementSystem/createBookReturnModal" model="[bookList:bookList]"/>




<div id="mySidenav" class="sidenav">
    <a href="${createLink(controller: 'library', action: 'fetchStudentDetails')}" onclick="studentRecords()">Students</a>
    <a href="${createLink(controller: 'library',action: 'fetchBookDetails')}" onclick="BookRecords()">Books</a>
    <a href="${createLink(controller: 'library',action: 'fetchIssueBookDetails')}">Issue Books</a>
    <a href="${createLink(controller: 'library',action: 'fetchBookReturnDetals')}">Return Books</a>


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
    // function show() {
    //     $('#search').click(function() {
    //         $('#modal-bookReturn').modal('show');
    //     });
    //
    // }
</script>

