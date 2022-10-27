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
<table id="myBook" >
    <thead>
    <tr>
        <th style="text-align: center">bookName</th>
        <th style="text-align: center">publisherName</th>
        <th style="text-align: center">year</th>
        <th style="text-align: center">writterName</th>
        <th style="text-align: center">price</th>
        <th colspan="2" style="text-align: center">Action</th>
        <th colspan="2" style="text-align: center">Action</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${bookList}" var="book">
        <tr id="myDiv_${book?.uuid}">

            <td name="bookName" id="book_Name_${book?.uuid}">${book?.bookName}</td>
            <td name="publisherName" id="publisher_name_${book?.uuid}">${book?.publisherName}</td>
            <td name="year" id="year_${book?.uuid}">${book?.year}</td>
            <td name="writterName" id="writter_name_${book?.uuid}">${book?.writterName}</td>
            <td name="price" id="price_${book?.uuid}">${book?.price}</td>

            <td><button  data-toggle="modal"
                        data-target="#modal-updateRecord"
                         onclick='autoFillBookRecord("${book?.uuid}", "${book?.bookName}","${book?.publisherName}", "${book?.year}", "${book?.writterName}", "${book?.price}")'>Edit</button></td>
            <td><button onclick='bookDelete("${book?.uuid}")'>Delete </button></td>
        </tr>
    </g:each>
    </tbody>
</table>
</html>
<g:render template="/libraryManagementSystem/updateBookModal"/>
<script>
    function autoFillBookRecord(uuid,bookName,publisherName, year, writterName,price) {

        $("#bookName").val(bookName);
        $("#publisherName").val(publisherName);
        $("#year").val(year);
        $("#writterName").val(writterName);
        $("#price").val(price);
        $("#uuid").val(uuid);
    }

    function bookDelete(uuid) {
        $.ajax({
            url: "${createLink(controller:'library',action:'deleteBookDetails')}",
            method: "POST",
            data: {'uuid':uuid},
            success: function (data) {
                if (data.code == 200) {
                    alert("Success");
                    $("#myBook").html(data.template);
                }
            }
        })
    }
</script>