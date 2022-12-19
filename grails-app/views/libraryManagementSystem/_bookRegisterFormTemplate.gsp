<g:form  id="bookFormRecord" method="post">
%{--    <div class="form-group">--}%
%{--        <input type="hidden"  id="uuid" name="uuid"--}%
%{--               value="${uuid}">--}%
%{--    </div>--}%

    <div class="form-group">
        <label for="bookName"><g:message code="student.rollNo"/></label>
        <input type="text" class="form-control required-field" id="bookName" name="bookName"
               value="${bookCO?.bookName}">

        <div style="color: red ; font-weight: bold">
            <g:hasErrors   bean="${bookCO}">
                <g:fieldError  bean="${bookCO}" field="bookName"/>
            </g:hasErrors>
        </div>
    </div>

%{--    <div class="form-group">--}%
%{--        <label for="publisherName"><g:message code="publisher.Name"/></label>--}%
%{--        <input type="text" class="form-control" id="publisherName" name="publisherName" value="${publisherName}">--}%
%{--        <div style="color: red; font-weight: bold">--}%
%{--            <g:hasErrors bean="${bookCO}">--}%
%{--                <g:fieldError field="publisherName " bean="${bookCO}"/>--}%
%{--            </g:hasErrors>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="form-group">--}%
%{--        <label for="year"><g:message code="publisher.Year"/></label>--}%
%{--        <input type="text" class="form-control" id="year" name="year"--}%
%{--               value="${year}" required>--}%
%{--        <div style="color:red; font-weight: bold"></div>--}%
%{--        <g:hasErrors bean="${bookCO}">--}%
%{--            <g:fieldError field="year" bean="${bookCO}"/>--}%
%{--        </g:hasErrors>--}%
%{--    </div>--}%

%{--    <div class="form-group">--}%
%{--        <label for="writterName"><g:message code="writter.Name"/></label>--}%
%{--        <input type="text" class="form-control" id="writterName" name="writterName"--}%
%{--               value="${writterName}">--}%
%{--        <div style="color: red; font-weight: bold"></div>--}%
%{--        <g:hasErrors bean="${bookCO}">--}%
%{--            <g:fieldError field="writterName" bean="${bookCO}"/>--}%
%{--        </g:hasErrors>--}%
%{--    </div>--}%

%{--    <div class="form-group">--}%
%{--        <label for="totalCount"><g:message code="total.count"/></label>--}%
%{--        <input type="text" class="form-control" id="totalCount" name="totalCount"--}%
%{--               value="${totalCount}">--}%
%{--        <div style="color: red;font-weight: bold"></div>--}%
%{--        <g:hasErrors bean="${bookCO}">--}%
%{--            <g:fieldError field="totalCount" bean="${bookCO}"/>--}%
%{--        </g:hasErrors>--}%
%{--    </div>--}%

%{--    <div class="form-group">--}%
%{--        <label for="price"><g:message code="book.price"/></label>--}%
%{--        <input type="text" class="form-control" id="price" name="price"--}%
%{--               value="${price}">--}%
%{--        <div style="color: red; font-weight: bold"></div>--}%
%{--        <g:hasErrors bean="${bookCO}">--}%
%{--            <g:fieldError field="price" bean="${bookCO}"/>--}%
%{--        </g:hasErrors>--}%
%{--    </div>--}%

    <button type="button" onclick="createBook()">Submit</button>
    <button type="button" data-dismiss="modal">Close</button>
</g:form>