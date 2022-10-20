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
                            <label for="bookId"><g:message code="bookId"/></label>
                            <input type="text" class="form-control" id="bookId" name="bookId" value="${bookId}">
                        </div>

                        <div class="form-group">
                            <label for="bookName"><g:message code="bookName"/></label>
                            <input type="text" class="form-control" id="bookName" name="bookName" value="${bookName}">
                        </div>

                        <div class="form-group">
                            <label for="publisherName"><g:message code="publisherName"/></label>
                            <input type="text" class="form-control" id="publisherName" name="publisherName" value="${publisherName}">
                        </div>

                        <div class="form-group">
                            <label for="publisherYear"><g:message code="publisherYear"/></label>
                            <input type="date" class="form-control" id="publisherYear" name="publisherYear"
                                   value="${publisherYear}">
                        </div>

                        <div class="form-group">
                            <label for="writterName"><g:message code="writterName"/></label>
                            <input type="text" class="form-control" id="writterName" name="writterName"
                                   value="${writterName}">
                        </div>

                        <div class="form-group">
                            <label for="bookPrice"><g:message code="bookprice"/></label>
                            <input type="text" class="form-control" id="bookPrice" name="bookPrice"
                                   value="${bookPrice}">
                        </div>

                        <button data-dismiss="modal" onclick="create()">Submit</button>
                        <button  data-dismiss="modal">Close</button>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script>
    function create() {
        alert("click");
        var bookId = $("#bookId").val();
        var bookName = $("#bookName").val();
        var publisherName = $("#publisherName").val();
        var publisherYear = $("#publisherYear").val()
        var writterName = $("#writterName").val()
        var bookPrice = $("#bookPrice").val();
        $.ajax({
            url: "${createLink(controller:'library',action:'createBookDetails')}",
            method: "POST",
            data: {
                bookId:bookId,
                bookName: bookName,
                publisherName: publisherName,
                publisherYear: publisherYear,
                writterName: writterName,
                bookPrice: bookPrice,
            },
            success: function (data) {
                if (data.code == 200) {
                    alert("Success");
                    $("#myBook").html(data.template);
                }
            }
        });
    }
</script>