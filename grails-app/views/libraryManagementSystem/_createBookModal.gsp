<div class="modal fade" id="modal-bookRecord" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Book Details</h4>
            </div>

            <div class="modal-body">
                <div id="bookRecord">

                    <g:form  id="bookFormRecord" method="post">
                        <div class="form-group">
                            <input type="hidden"  id="uuid" name="uuid"
                                   value="${uuid}">
                        </div>

                        <div class="form-group">
                            <label for="bookName"><g:message code="book.Name"/></label>
                            <input type="text" class="form-control" id="bookName" name="bookName" value="${bookName}" required>
                        </div>

                        <div class="form-group">
                            <label for="publisherName"><g:message code="publisher.Name"/></label>
                            <input type="text" class="form-control" id="publisherName" name="publisherName" value="${publisherName}">
                        </div>

                        <div class="form-group">
                            <label for="year"><g:message code="publisher.Year"/></label>
                            <input type="text" class="form-control" id="year" name="year"
                                   value="${year}" required>
                        </div>

                        <div class="form-group">
                            <label for="writterName"><g:message code="writter.Name"/></label>
                            <input type="text" class="form-control" id="writterName" name="writterName"
                                   value="${writterName}">
                        </div>

                        <div class="form-group">
                            <label for="totalCount"><g:message code="total.count"/></label>
                            <input type="text" class="form-control" id="totalCount" name="totalCount"
                                   value="${totalCount}">
                        </div>

                        <div class="form-group">
                            <label for="price"><g:message code="book.price"/></label>
                            <input type="text" class="form-control" id="price" name="price"
                                   value="${price}">
                        </div>

                        <button data-dismiss="modal" onclick="createBook()">Submit</button>
                        <button  data-dismiss="modal">Close</button>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script>
    function createBook() {

         var bookName = $("#bookName").val();
        var publisherName= $("#publisherName").val();
         var year = $("#year").val();
        var writterName = $("#writterName").val();
        var totalCount = $("#totalCount").val();
        var price = $("#price").val();
        $.ajax({
            url: "${createLink(controller:'library',action:'createBookDetails')}",
            method: "POST",
            data: {
                 bookName: bookName,
                publisherName: publisherName,
                year: year,
                writterName: writterName,
                totalCount:totalCount,
                price: price,
            },
            success: function (data) {
                if (data.code == 200) {
                    $("#myBook").html(data.template)
                }
            }
        });
    }
</script>