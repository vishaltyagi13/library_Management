<div class="modal fade" id="modal-studentRecord" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Student Details</h4>
            </div>

            <div class="modal-body">
                <div id="studentForm">

                    <g:form controller="library" action="createStudentDetails" id="studentFormRecord" method="post"
                            enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="rollNo"><g:message code="rollNo"/></label>
                            <input type="text" class="form-control required-field" id="rollNo" name="rollNo"
                                   value="${rollNo}" required>
                        </div>

                        <div class="form-group">
                            <label for="name"><g:message code="name"/></label>
                            <input type="text" class="form-control required-field" id="name" name="name" value="${name}"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="fatherName"><g:message code="fatherName"/></label>
                            <input type="text" class="form-control required-field" id="fatherName" name="fatherName"
                                   value="${fatherName}" required>
                        </div>

                        <div class="form-group">
                            <label for="course">Choose a course</label>

                            <select name="" class="form-control" id="course" name="course" value="${course}" required>
                                <option value="b.Tech">b.Tech</option>
                                <option value="m.Tech">m.tech</option>
                                <option value="MCA">Mca</option>
                            </select>
                        </div>
                        <div class="form-group">
                        <label for="stream">Choose a stream</label>
                         <select name=""  class="form-control" id="stream" name="stream" value="${stream}" required>
                        <option value="CSE">CSE</option>
                        <option value="ME">ME</option>
                        <option value="EE">EE</option>
                        <option value="CE">CE</option>
                        <option value="IT">IT</option>
                        <option value="MCA">MCA</option>
                        </select>

                        <div class="form-group">
                            <label for="address"><g:message code="address"/></label>
                            <textarea type="text" class="form-control" id="address" name="address"
                                      value="${address}"></textarea>
                        </div>


                        <button type="submit" data-dismiss="modal" onclick="create()">Submit</button>
                        <button type="button" data-dismiss="modal">Close</button>
                    </g:form>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function create() {
        var rollNo = $("#rollNo").val();
        var name = $("#name").val();
        var fatherName = $("#fatherName").val();
        var course = $("#course").val()
        var stream = $("#stream").val()
        var address = $("#address").val();
        $.ajax({
            url: "${createLink(controller:'library',action:'createStudentDetails')}",
            method: "POST",
            data: {
                rollNo: rollNo,
                name: name,
                fatherName: fatherName,
                course: course,
                stream: stream,
                address: address,
            },


            success: function (data) {

                if (data.code == 200) {
                    alert("Success");
                    $("#studentForm").html(data.template);

                } else {
                    $.notify("Error", "error");
                }
            }
        });
    }
</script>