<g:form id="studentFormRecord" method="post">
    <div class="form-group">
%{--        ${studentCO?.name}--}%
        <label for="name"><g:message code="student.name"/></label>
        <input type="text" class="form-control required-field" id="name" name="name" value="${studentCO?.name}" ${studentCO?.name} >
        <div style="color: red ; font-weight: bold">
            <g:hasErrors bean="${studentCO}">
                <g:fieldError field="name" bean="${studentCO}"/>
            </g:hasErrors>
        </div>
    </div>
    <div class="form-group">
        <input type="hidden" id="uuid" name="uuid"
               value="${uuid}" required>
    </div>

    <div class="form-group">
        <label for="rollNo"><g:message code="student.rollNo"/></label>
        <input type="text" class="form-control required-field" id="rollNo" name="rollNo"
               value="${studentCO?.rollNo}">

        <div style="color: red ; font-weight: bold">
        <g:hasErrors   bean="${studentCO}">
            <g:fieldError  bean="${studentCO}" field="rollNo"/>
        </g:hasErrors>
        </div>
    </div>

    <div class="form-group">
        <label for="fatherName"><g:message code="fatherName"/></label>
        <input type="text" class="form-control required-field" id="fatherName" name="fatherName"
               value="${studentCO?.fatherName}">

        <div style="color: red">
            <g:hasErrors bean="${studentCO}">
                <g:fieldError field="fatherName" bean="${studentCO}"/>
            </g:hasErrors>
        </div>
    </div>

    <div class="form-group">
        <label for="course">Choose a Course Name</label>
        <g:select class="form-control" id="course" name="course" value="${studentCO?.course}"  from="${['Btech', 'Mtech', 'MCA']}">
        </g:select>
        <div style="color: red; font-weight: bold" >
          <g:hasErrors bean="${studentCO}">
              <g:fieldError field="course" bean="${studentCO}"/>
          </g:hasErrors>
        </div>
    </div>

    <div class="form-group">
        <label for="stream">Choose a Stream Name</label>
        <g:select class="form-control" id="stream" name="stream" value="${studentCO?.stream}"  from="${['CSE', 'ME', 'EE','CE','IT','MCA']}">
        </g:select>
        <div style="color: red ; font-weight: bold">
            <g:hasErrors bean="${studentCO}">
                <g:fieldError field="stream" bean="${studentCO}"/>
            </g:hasErrors>
        </div>
    </div>

    <div class="form-group">
%{--        <label for="address"><g:message code="address"/></label>--}%
        <input type="hidden" name="isUpdate" id="isUpdate" value="${0}">

    <div class="form-group">
    <label for="address"><g:message code="address"/></label>

        <input type="text" class="form-control" id="address" name="address"
                  value="${studentCO?.address}"/>
        <div style="color: red; font-weight: bold">
            <g:hasErrors bean="${studentCO}">
                <g:fieldError field="address" bean="${studentCO}"/>
            </g:hasErrors>
        </div>
    </div>
    <button type="button" onclick="createMe()">Submit</button>
    <button type="button" data-dismiss="modal">Close</button>
</g:form>