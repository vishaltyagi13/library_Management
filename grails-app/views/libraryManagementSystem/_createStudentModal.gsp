<div class="modal fade" id="modal-studentRecord" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Student Details</h4>
            </div>

            <div class="modal-body">
                <div id="studentForm">
                    <div id="studentRegsiterFormId">
                        <g:render template="/libraryManagementSystem/studentRegisterFormTemplate"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#name').on('keypress', function (event) {
        var regex = new RegExp("^[a-zA-Z]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
    });
    $('#rollNo').on('keypress', function (event) {
        var regex = new RegExp("^[0-9]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
    });
    $('#fatherName').on('keypress',function (event) {
        var regex =new RegExp("^[a-zA-z]+$");
        var key=String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if(!regex.test(key)){
            event.preventDefault();
            return false;
        }
    });
    $('#address').on('keypress',function (event) {
        var regex = new RegExp("^[a-zA-z]+$");
        var key=String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)){
            event.preventDefault();
            return false;
        }
    });
    function createMe() {
        var rollNo = $("#rollNo").val();
        var name = $("#name").val();
        var fatherName = $("#fatherName").val();
        var course = $("#course").val();
        var stream = $("#stream").val();
        var address = $("#address").val();
        var isUpdate = $("#isUpdate").val();
        if (isUpdate == 0) {
            $.ajax({
                url: "${createLink(controller:'library',action:'createStudentDetails')}",
                method: "POST",
                data: {
                    name: name,
                    rollNo: rollNo,
                    fatherName: fatherName,
                    course: course,
                    stream: stream,
                    address: address
                },
                success: function (data) {
                    // alert("click");
                    // alert(data.code);
                    if (data.code == 200) {
                        console.log(data.code);
                        // alert("if Part");
                        $("#studentTableRecord").html(data.template);
                    } else if (data.code == "402") {
                        // alert("else Part");
                        $("#studentRegsiterFormId").html(data.template);
                    } else {
                        alert("vishal");
                    }
                }
            });

        } else {
            var uuid = $("#uuid").val();
            $.ajax({
                url: "${createLink(controller:'library',action:'updateStudentDetails')}",
                method: "POST",
                data: {
                    uuid: uuid,
                    name: name,
                    rollNo: rollNo,
                    fatherName: fatherName,
                    course: course,
                    stream: stream,
                    address: address
                },
                success: function (data) {
                    if (data.code == 200) {
                        $("#studentTableRecord").html(data.template);
                    }
                }
            });
        }
    }
</script>