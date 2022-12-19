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

    <button id="searchBtnId">search</button>

    <div id="fn" hidden class="form-group">
        <label for="issueDate"><g:message code="issue.Date"/></label>
        <input type="text" class="form-control first" id="issueDate" name="issueDate"
               value="${issueDate}" readonly>
    </div>

    <div id="ln" hidden class="form-group">
        <label for="dueDate"><g:message code="due.Date"/></label>
        <input type="text" class="form-control" id="dueDate" name="dueDate"
               value="${dueDate}" readonly>
    </div>

    <div id="bookFine" hidden class="form-group">
        <label for="fine"><g:message code="book.fine"/></label>
        <input type="text" style="border-color: red" class="form-control" id="fine" name="fine"
               value="${fine}" readonly>
    </div>

    <button data-dismiss="modal" onclick="createReturnBook()">Return</button>
    <button data-dismiss="modal">Close</button>
</form>