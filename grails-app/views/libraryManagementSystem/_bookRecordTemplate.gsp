<html>
<head>
    <title></title>
    <div>
<table id="myBook" >
    <thead>
    <tr>
        <th style="text-align: center">Book Id</th>
        <th style="text-align: center">Book Name</th>
        <th style="text-align: center">Publisher Name</th>
        <th style="text-align: center">Publisher Year</th>
        <th style="text-align: center">Writter Name</th>
        <th style="text-align: center">Price</th>
        <th style="text-align: center">No. of copies</th>
        <th style="text-align: center">Available Copies</th>
        <th style="text-align: center">Issued Copies</th>
        <th colspan="2" style="text-align: center">Action</th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${bookList}" var="book">
        <tr id="myDiv_${book?.uuid}">
            <td name="identityNumber" id="identity_number_${book?.identityNumber}">${book?.identityNumber}</td>
            <td name="bookName" id="book_Name_${book?.uuid}">${book?.bookName}</td>
            <td name="publisherName" id="publisher_name_${book?.uuid}">${book?.publisherName}</td>
            <td name="year" id="year_${book?.uuid}">${book?.year}</td>
            <td name="writterName" id="writter_name_${book?.uuid}">${book?.writterName}</td>
            <td name="price" id="price_${book?.uuid}">${book?.price}</td>
            <td name="totalCount" id="total_Count_${book?.uuid}">${book?.totalCount}</td>
            <td name="availableCount" id="available_count_${book?.uuid}">${book?.availableCount}</td>
            <td name="issueCount" id="issue_count_${book?.uuid}">${book?.issueCount}</td>
            <td><button  data-toggle="modal"
                        data-target="#modal-updateBookRecord" id="btn2"
                         onclick='autoFillBookRecord("${book?.uuid}", "${book?.bookName}","${book?.publisherName}", "${book?.year}", "${book?.writterName}","${book?.totalCount}", "${book?.price}")'>Edit</button>
            <button id="btn1" onclick='bookDelete("${book?.uuid}")'>Delete </button></td>
        </tr>
    </g:each>
    </tbody>
</table>
</html>

<script>
    function autoFillBookRecord(uuid,bookName,publisherName, year, writterName, totalCount, price) {
        $("#bookName").val(bookName);
        $("#publisherName").val(publisherName);
        $("#year").val(year);
        $("#writterName").val(writterName);
        $("#totalCount").val(totalCount);
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