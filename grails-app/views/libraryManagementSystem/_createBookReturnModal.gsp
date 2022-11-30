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

                    <form id="bookReturnRecord" method="post">
                        <div class="form-group">
                            <label for="bookId">Select a Book Name</label>
                            <g:select name="bookId" id="bookName_1" class="form-control" from="${bookList}"
                                      optionValue="bookName"
                                      noSelection="['null': '-- Select a Book --']"
                                      optionKey="uuid"/>
                        </div>

                        <div class="form-group">
                            <label for="rollNo"><g:message code="roll.No"/></label>
                            <input type="text" class="form-control" id="rollNo" name="rollNo" value="${rollNo}"
                                   required>
                        </div>

                        <button id="searchBtnId" >search</button>

                        <div class="form-group">
                            <label for="issueDate"><g:message code="issue.Date"/></label>
                            <input type="text"  class="form-control first" id="issueDate" name="issueDate"
                                   value="${issueDate}" readonly>
                        </div>

                        <div class="form-group">
                            <label for="dueDate"><g:message code="due.Date"/></label>
                            <input type="text" class="form-control" id="dueDate" name="dueDate"
                                   value="${dueDate}" readonly>
                        </div>

                        <button data-dismiss="modal" onclick="createReturnBook()">Return</button>
                        <button data-dismiss="modal">Close</button>
                    </form>
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
                console.log( document.getElementById('issueDate').innerHTML);
                document.getElementById('issueDate').value=data.issueDate;
                document.getElementById('dueDate').value=data.dueDate;
            }
        })
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