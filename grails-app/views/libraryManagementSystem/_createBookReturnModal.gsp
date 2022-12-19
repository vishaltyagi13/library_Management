<%@ page %>
<div class="modal fade" id="modal-bookReturn" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Return Book Details</h4>
            </div>
            <div class="modal-body">
                <div id="bookRecord">
                   <div id="bookReturnFormId">
                       <g:render template="/libraryManagementSystem/bookReturnRegisterFormTemplate"/>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

    $("#searchBtnId").click(function (e) {
        e.preventDefault();
        var data = $("#bookReturnRecord").serialize();
        $.ajax({
            url: "${createLink(controller:'library',action:'searchReturnBookDetails')}",
            method: "GET",
            data: data,
            success: function (data) {
                console.log(data);
                $("#issueDate").val(data.issueDate);
                $("#dueDate").val(data.dueDate);
                $("#fine").val(data.fineDetails.fine);
            }
        })
    });

    $("#searchBtnId").click(function () {
        $("#fn").show();
        $("#ln").show();
        $("#bookFine").show();
    });

    function createReturnBook() {
        var data = $("#bookReturnRecord").serialize();
        $.ajax({
            url: "${createLink(controller:'library',action:'createBookReturnDetails')}",
            method: "POST",
            data: data,
            success: function (data) {
                if (data.code == 200) {
                    $("#returnBook").html(data.template)
                }
            }
        });
    }
</script>