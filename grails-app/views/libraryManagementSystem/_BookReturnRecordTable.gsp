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
    <table id="returnBook">
        <thead>
        <tr>
            <th style="text-align: center">Book Name</th>
            <th style="text-align: center">Roll No</th>
            <th style="text-align: center">Issue Date</th>
            <th style="text-align: center">Due Date</th>
            <th colspan="2" style="text-align: center">Action</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${bookReturnList}" var="returnBook">
            <tr id="myDiv_${returnBook?.uuid}">
                <td name="bookName" id="bookName_${returnBook?.uuid}">${(returnBook?.bookName)}</td>
                <td name="rollNo" id="rollNo_${returnBook?.uuid}">${(returnBook?.rollNo)}</td>
                <td name="issueDate" id="issueDate_${returnBook?.uuid}">${returnBook?.issueDate}</td>
                <td name="dueDate" id="dueDate_${returnBook?.uuid}">${returnBook?.dueDate}</td>

                <td><button id="btn2" data-toggle="modal"
                            data-target="#modal-myModal" onclick='autoFillReturnBookRecord("${returnBook?.uuid}","${returnBook?.bookName}","${returnBook?.rollNo}","${returnBook?.issueDate}","${returnBook?.dueDate}")'>Edit</button>
                    <button id="btn1" onclick="bookReturnDelete('${returnBook?.uuid}')">Delete</button></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<g:render template="/libraryManagementSystem/updateBookReturnModal"/>
</html>
<script>

function autoFillReturnBookRecord(uuid,bookName,rollNo, issueDate, dueDate) {

    var e = document.getElementById("returnBookName");
    for (var i=0; i<e.options.length;i++) {
        if(e.options[i].text==bookName){
            e.options[i].selected=true;
            break ;
        }
    }
        $("#returnRollNo").val(rollNo);
        $("#returnIssueDate").val(issueDate);
        $("#returnDueDate").val(dueDate);
        $("#uuid").val(uuid);
    }

function bookReturnDelete(uuid) {
    $.ajax({
        url: "${createLink(controller:'library',action:'deleteBookReturnDetails')}",
        method: "POST",
        data: {'uuid':uuid},
        success: function (data) {
            if (data.code == 200) {
                alert("Success");
                $("#returnBookTableRecord").html(data.template);
            }
        }
    })
}


</script>