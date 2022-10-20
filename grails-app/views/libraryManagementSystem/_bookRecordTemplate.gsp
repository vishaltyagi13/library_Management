<table id="myBook" >
    <thead>
    <tr>
        <th style="text-align: center">bookId</th>
        <th style="text-align: center">bookName</th>
        <th style="text-align: center">publisherName</th>
        <th style="text-align: center">publisherYear</th>
        <th style="text-align: center">writterName</th>
        <th style="text-align: center">bookPrice</th>
        <th colspan="2" style="text-align: center">Action</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${bookList}" var="book">

        <tr id="myDiv_${book?.id}">

            <td name="boolId" id="book_Id_${book?.id}">${book?.bookId}</td>
            <td name="bookName" id="book_name_${book?.id}">${book?.bookName}</td>
            <td name="publisherName" id="publisher_name_${book?.id}">${book?.publisherName}</td>
            <td name="publisherYear" id="publisher_year_${book?.id}">${book?.publisherYear}</td>
            <td name="writterName" id="writter_name_${book?.id}">${book?.writterName}</td>
            <td name="bookPrice" id="book_price_${book?.id}">${book?.bookPrice}</td>

            <td><button>Edit</button></td>
            <td><button>Delete </button></td>
        </tr>
    </g:each>
    </tbody>
</table>