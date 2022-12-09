<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="style.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="jquery-2.1.3.js"/>
%{--    <link href="jquery.alert.css" rel="stylesheet" />--}%
%{--    <script src="/path/to/cdn/jquery.min.js"></script>--}%
%{--    <script src="jquery.alert.min.js"></script>--}%

</head>

<body>
<div class="form">
    <form action="${'/library/view'}" method="POST" id="loginForm">
        <center><h1>Login</h1></center>
        <hr/>

        <div class="container">
            <h3 id="invalid" style="color: red; display: none; ">Invalid Credentials</h3>
            <label>Username</label>
            <input type="text" placeholder="Enter Username" id="username" name="username"  required>
            <label>Password</label>
            <input type="password" placeholder="Enter Password" id="password" name="password"  required>
%{--            <button type="submit" onclick="$('#loginForm').submit();">Login</button>--}%
            <button type="button"  onclick="submitLoginForm()">Login</button>
%{--            <h3 id="invalid" style="color: red; display: none; ">Invalid Credentials</h3>--}%
        </div>
    </form>

</div>
</body>
</html>

<script>
   function submitLoginForm() {

       var username = $("#username").val();
       var password = $("#password").val();
       $.ajax({
           url: "${createLink(controller:'library',action:'validateCredentials')}",
           method: "POST",
           data: {username: username, password: password},
           success: function (data) {

               console.log(data);
               if (data.code==200) {
                   $("#loginForm").submit();
               }else {
                   document.getElementById("invalid").style.display="block";
                   document.getElementById("username").value="";
                   document.getElementById("password").value="";
               }
           }
       })
   }
</script>