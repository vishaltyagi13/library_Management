<%@ page %>
<div class="modal fade" id="modal-updateIssueBook" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Issue Book Details</h4>
            </div>

            <div class="modal-body">
                <div id="bookRecord">

                    <form id="updateBookFormRecord" method="post">

                        <div class="form-group">
                            <label for="issueBookName">Select a Book Name</label>
                            <g:select name="bookId" id="issueBookName" class="form-control" from="${availableBookList}"
                                      optionValue="bookName"
                                      noSelection="['null': '-- Select a Book --']"
                                      optionKey="uuid"/>
                        </div>

                            <div class="form-group">
                            <label for="issueRollNo"><g:message code="roll.No"/></label>
                            <input type="text" class="form-control" id="issueRollNo" name="rollNo"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="issueDate"><g:message code="issue.Date"/></label>
                            <input type="datetime-local" class="form-control" id="issueDate" name="issueDate"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="dueDate"><g:message code="due.Date"/></label>
                            <input type="datetime-local" class="form-control" id="dueDate" name="dueDate">

                        </div>

                        <button data-dismiss="modal" onclick="updateIssueBook()">Submit</button>
                        <button data-dismiss="modal">Close</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

    function updateIssueBook() {

        var bookName= $("#issueBookName").val();
        var rollNo=$("#issueRollNo").val();
        var  issueDate=$("#issueDate").val();
        var dueDate=$("#dueDate").val();
        var uuid = $("#uuid").val();
        $.ajax({
            url: "${createLink(controller:'library',action:'updateIssueBookDetails')}",
            method: "POST",
            data: data,
            success: function (data) {
                if (data.code == 200) {
                    $("#issueBookTableRecord").html(data.template)
                }
            }
        });
    }
</script>