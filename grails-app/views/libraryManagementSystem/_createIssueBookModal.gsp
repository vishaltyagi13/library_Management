<%@ page %>
<div class="modal fade" id="modal-issueBook" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Issue Book Details</h4>
            </div>

            <div class="modal-body">
                <div id="bookRecord">

                    <form id="bookFormRecord" method="post">

                        <div class="form-group">
                            <label for="bookId">Select a Book Name</label>
                            <g:select name="bookId" id="bookId" class="form-control" from="${availableBookList}"
                                      optionValue="bookName"
                                      noSelection="['null': '-- Select a Book --']"
                                      optionKey="uuid"/>
                        </div>

                        <div class="form-group">
                            <label for="roll No"><g:message code="roll.No"/></label>
                            <input type="text" class="form-control" id="roll No" name="rollNo" value="${rollNo}"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="issue Date"><g:message code="issue.Date"/></label>
                            <input type="date" class="form-control" id="issue Date" name="issueDate"
                                   value="${issueDate}" required>
                        </div>

                        <div class="form-group">
                            <label for="due Date"><g:message code="due.Date"/></label>
                            <input type="date" class="form-control" id="due Date" name="dueDate"
                                   value="${dueDate}">
                        </div>

                        <button data-dismiss="modal" onclick="createIssueBook()">Submit</button>
                        <button data-dismiss="modal">Close</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script>

    function createIssueBook() {

        var data = $("#bookFormRecord").serialize();
        $.ajax({
            url: "${createLink(controller:'library',action:'createIssueBookDetails')}",
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