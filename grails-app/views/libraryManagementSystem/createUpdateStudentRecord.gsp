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
        <a href="#Issue Book">Issue Book</a>
        <a href="#Return Book">Return Book</a>
        <a href="#Logout">Logout</a>
    </div>
</div>
<g:render template="/libraryManagementSystem/createStudentModal"/>
<g:render template="/libraryManagementSystem/createBookModal"/>


<div id="mySidenav" class="sidenav">
    <a href="${createLink(controller: 'library', action: 'fetchStudentDetails')}" onclick="studentRecords()">Students</a>
    <a href="${createLink(controller: 'library',action: 'fetchBookDetails')}" onclick="BookRecords">Books</a>
    <a href="${createLink(controller: 'library',action: 'fetchIssueBookDetails')}">Issue Books</a>
</div>

<div id="studentTableRecord">
    <g:render template="/libraryManagementSystem/studentRecordTemplate" model="[studentList: studentList]"/>
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
           //TODO i will complete it later    $.notify("Error","error");
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
            //TODO i will complete it later   $.notify("Error","error");
                }
            }
        })
    }

    function deleteMe(uuid) {

        $.ajax({
            url: "${createLink(controller:'library',action:'deleteStudentDetails')}",
            method: "POST",
            data: {'uuid':uuid},
            success: function (data) {
                if (data.code == 200) {
                    alert("Success");
                    $("#studentTableRecord").html(data.template);
                }
            }
        })
    }

    function autoFillStudentRecord(uuid) {

        var rollNo = $("#roll_no_" + uuid).html();
        var name = $('#name_' + uuid).html();
        var fatherName = $("#fatherName_" + uuid).html();
        var address = $("#address_" + uuid).html();
        var course = $("#course_" + uuid).html();
        var stream = $("#stream_" + uuid).html();
        $("#rollNo").val(rollNo);
        $("#name").val(name);
        $("#fatherName").val(fatherName);
        $("#course").val(course);
        $("#stream").val(stream);
        $("#address").val(address);
        $("#isUpdate").val(1);
        $("#uuid").val(uuid);
    }
</script>