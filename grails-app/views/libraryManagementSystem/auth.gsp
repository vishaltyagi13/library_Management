<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="style.css"/>
</head>

<body>
<div class="form">
    <form action="${'/login/authenticate'}" method="POST" id="loginForm">
        <center><h1>Login</h1></center>
        <hr/>

        <div class="container">
            <label>Username</label>
            <input type="text" placeholder="Enter Username" name="username" value="${username}" required>
            <label>Password</label>
            <input type="password" placeholder="Enter Password" name="password" value="${password}" required>
            <button type="submit" onclick="$('#loginForm').submit();">Login</button>
        </div>
    </form>
</div>
</body>
</html>