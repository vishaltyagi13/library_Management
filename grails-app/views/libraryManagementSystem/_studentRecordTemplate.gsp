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
<table id="myTable">
    <thead>
    <tr>
        <th style="text-align: center">Roll No</th>
        <th style="text-align: center">name</th>
        <th style="text-align: center">fatherName</th>
        <th style="text-align: center">course</th>
        <th style="text-align: center">stream</th>
        <th style="text-align: center">address</th>
        <th colspan="2" style="text-align: center">Action</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${studentList}" var="student">

        <tr id="myDiv_${student?.uuid}">

            <td name="rollNo" id="roll_no_${student?.uuid}">${student?.rollNo}</td>
            <td name="rollNo" id="name_${student?.uuid}">${student?.name}</td>
            <td name="phoneNo" id="fatherName_${student?.uuid}">${student?.fatherName}</td>
            <td name="rollNo" id="course_${student?.uuid}">${student?.course}</td>
            <td name="rollNo" id="stream_${student?.uuid}">${student?.stream}</td>
            <td name="address" id="address_${student?.uuid}">${student?.address}</td>

            <td><button id="btn2" data-toggle="modal"
                        data-target="#modal-studentRecord"
                        onclick="autoFillStudentRecord('${student?.uuid}')">Edit</button></td>
            <td><button id="btn1"  onclick='deleteMe("${student?.uuid}")'>Delete </button></td>
        </tr>
    </g:each>

    </tbody>
</table>
</html>
<script>
    function deleteMe(uuid) {

        $.ajax({
            url: "${createLink(controller:'library',action:'deleteStudentDetails')}",
            method: "POST",
            data: {'uuid':uuid},
            success: function (data) {
                if (data.code == 200) {
                    alert("Success");
                    $("#myTable").html(data.template);
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