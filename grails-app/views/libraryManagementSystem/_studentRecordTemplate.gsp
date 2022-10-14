<table>
    <thead>
    <tr>
        <th style="text-align: center">Roll No.</th>
        <th style="text-align: center">name.</th>
        <th style="text-align: center">fatherName</th>
        <th style="text-align: center">course</th>
        <th style="text-align: center">stream</th>
        <th style="text-align: center">address</th>
        <th colspan="2" style="text-align: center">Action</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${}" var="student">

        <tr id="myDiv_${student?.id}">

            <td name="rollNo" id="roll_no_${student?.id}">${student?.rollNo}</td>
            <td name="rollNo" id="name_${student?.id}">${student?.name}</td>
            <td name="phoneNo" id="fatherName_${student?.id}">${student?.fatherName}</td>
            <td name="rollNo" id="course_${student?.id}">${student?.course}</td>
            <td name="rollNo" id="stream_${student?.id}">${student?.stream}</td>
            <td name="address" id="address_${student?.id}">${student?.address}</td>

            <td><button type="button">Edit</button></td>
            <td><button type="button">Delete</button></td>
        </tr>
    </g:each>

    </tbody>
</table>