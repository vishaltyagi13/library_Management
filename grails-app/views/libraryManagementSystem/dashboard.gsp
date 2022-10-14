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
        <a class="active" href="#" onclick="openModal()">New Student</a>
        <a href="#New Book">New Book</a>
        <a href="#Detail">Detail</a>
        <a href="#Issue Book">Issue Book</a>
        <a href="#Return Book">Return Book</a>
        <a href="#Logout">Logout</a>
    </div>
</div>
<g:render template="/libraryManagementSystem/createStudentModal"/>

<div id="mySidenav" class="sidenav">
    <a href="#">studentRecord</a>
    <a href="#">bookRecords</a>
</div>
</body>
</html>
<script>
    function openModal() {
        $('#modal-studentRecord').show();
    }
</script>