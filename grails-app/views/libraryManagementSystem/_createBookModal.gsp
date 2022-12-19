<div class="modal fade" id="modal-bookRecord" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Book Details</h4>
            </div>
            <div class="modal-body">
                <div id="bookRegisterFormId">
                    <g:render template="/libraryManagementSystem/bookRegisterFormTemplate"/>
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
        var availableCount=$("#availableCount").val();
        var issueCount=$("#issueCount").val();
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
                availableCount:availableCount,
                issueCount:issueCount,
                price: price,
            },
            success: function (data) {
                alert(data.code);
                if (data.code == "200") {
                    alert("if part");
                    $("#bookTableRecord").html(data.template)
                }else if (data.code==402){
                    alert("else part");
                    $("#bookRegsiterFormId").html(data.template)
                }
            }
        });
    }
</script>