<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="style.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="jquery-2.1.3.js"/>
</head>
<body>
<div >
    <form action="${'/library/view'}" method="POST" id="loginForm">
        <center><h1>Login</h1></center>
        <hr/>
        <div class="container">
            <div id="errorMessageBox">

            </div>
%{--            <h3 id="invalid" style="color: red; display: none; ">Invalid Username and Password</h3>--}%
            <label>Username</label>
            <input type="text" placeholder="Enter Username" id="username" name="username"  required>
            <label>Password</label>
            <input type="password" placeholder="Enter Password" id="password" name="password"  required>
            <button type="button"  onclick="submitLoginForm()">Login</button>
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
                   // document.getElementById("invalid").style.display="block";
                   // document.getElementById("username").value="";
                   // document.getElementById("password").value="";
                   $("#errorMessageBox").html(data.message);
               }
           }
       })
   }
</script>