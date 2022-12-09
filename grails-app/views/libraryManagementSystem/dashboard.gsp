<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="style.css"/>
%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">--}%
%{--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>--}%
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
    @media (min-width: 1000px) {
        .col-md-6 {
            padding-left: 0%;
        }
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
        <a  href="${createLink(controller: 'logout', action: 'index')}">Logout</a>
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
<div class="container " style=" width: 78%">
<div class="row">
<div class="   col-md-6 " >
    <div align="left" style="background-color: #dddddd; width: 782px" >
        <h3 style="margin-top: -19px ">Most Popular Writter</h3></div>
    <g:render template="/libraryManagementSystem/popularWritterRecordTable" model="['newBook': newBook]"/>
</div>

<div class="  col-md-6" style="padding-left: 9%";>
    <div align="left" style="background-color: #dddddd; width: 782px" >
        <h3 style="margin-top: -19px ">Most Popular Books</h3></div>
   <g:render template="/libraryManagementSystem/blockRecordBookTable" model="['listOfBooks': listOfBooks]"/>
</div>
</div>

<div class=" col-sm-3">
    <div align="left" style="background-color: #dddddd; width: 782px" >
        <h3 style="margin-top: -19px "> Recent Books</h3></div>
    <g:render template="/libraryManagementSystem/recentBookRecordTable" model="['newRecentBooks': newRecentBooks]"/>
</div>
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