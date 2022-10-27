<div class="modal fade" id="modal-updateRecord" role="dialog">
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
                            <label for="publisherName"><g:message code="publisherName"/></label>
                            <input type="text" class="form-control" id="publisherName" name="publisherName" value="${publisherName}">
                        </div>

                        <div class="form-group">
                            <label for="year"><g:message code="publisher.Year"/></label>
                            <input type="text" class="form-control" id="year" name="year"
                                   value="${year}" required>
                        </div>

                        <div class="form-group">
                            <label for="writterName"><g:message code="writterName"/></label>
                            <input type="text" class="form-control" id="writterName" name="writterName"
                                   value="${writterName}">
                        </div>

                        <div class="form-group">
                            <label for="price"><g:message code="book.price"/></label>
                            <input type="text" class="form-control" id="price" name="price"
                                   value="${price}">
                        </div>

                        <button data-dismiss="modal" onclick="updateBook()">Submit</button>
                        <button  data-dismiss="modal">Close</button>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script>
    function updateBook() {

        var bookName= $("#bookName").val();
        var  publisherName = $("#publisherName").val();
        var year = $("#year").val();
        var writterName = $("#writterName").val();
        var price = $("#price").val();
        var uuid = $("#uuid").val();
        $.ajax({
            url:"${createLink(controller: 'library',action: 'updateBookDetials')}",
            method:"POST",
            data:{
                uuid:uuid,
                bookName: bookName,
                publisherName: publisherName,
                year: year,
                writterName: writterName,
                price: price,
            },
            success:function (data) {
                if (data.code==200){
                    $("#myBook").html(data.template)
                }
            }

        });
    }
</script>