<%@ page %>
<div class="modal fade" id="modal-myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Return Book Details</h4>
            </div>

            <div class="modal-body">
                <div id="bookRecord">


                    <form id="updateReturnRecord" method="post">

                        <div class="form-group">
                            <input type="hidden"  id="uuid" name="uuid"
                                   value="${uuid}">
                        </div>

                        <div class="form-group">
                           <label for="returnBookName">Select a Book Name</label>
                            <g:select name="bookName" id="returnBookName" class="form-control" from="${bookList}"
                                      optionValue="bookName"
                                      noSelection="['null': '-- Select a Book --']"
                                      optionKey="uuid"/>
                        </div>

%{--                            <div class="form-group">--}%
%{--                                <label for="rollNo"><g:message code="roll.No"/></label>--}%
%{--                                <input type="text" class="form-control" id="bookId_12" name="bookId"--}%
%{--                                       required>--}%
%{--                            </div>--}%


                        <div class="form-group">
                            <label for="returnRollNo"><g:message code="roll.No"/></label>
                            <input type="text" class="form-control" id="returnRollNo" name="rollNo" value="${rollNo}"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="returnIssueDate"><g:message code="issue.Date"/></label>
                            <input type="text"  class="form-control" id="returnIssueDate" name="issueDate"
                                    readonly >
                        </div>

                        <div class="form-group">
                            <label for="returnDueDate"><g:message code="due.Date"/></label>
                            <input type="text" class="form-control" id="returnDueDate" name="dueDate"
                                   value="${dueDate}" readonly>
                        </div>

                        <button data-dismiss="modal" onclick="updateReturnBook()">Return</button>
                        <button data-dismiss="modal">Close</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

    function updateReturnBook() {
        var bookName= $("#returnBookName").val();
        var rollNo=$("#returnRollNo").val();
        var  issueDate=$("#returnIssueDate").val();
        var dueDate=$("#returnDueDate").val();
        var uuid = $("#uuid").val();

        $.ajax({
            url: "${createLink(controller:'library',action:'updateBookReturnDetails')}",
            method: "POST",
            data:{uuid:uuid,bookName:bookName,rollNo:rollNo,issueDate:issueDate,dueDate:dueDate},
            success: function (data) {
                if (data.code == 200) {
                    $("#returnBook").html(data.template)
                }
            }
        });
    }
</script>