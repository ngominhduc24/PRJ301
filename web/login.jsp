<%-- Document : login Created on : May 18, 2023, 11:04:29 AM Author : ASUS PC
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/styles/login.css"
    />
    <title>Login Page</title>
  </head>
  <body>
    <form action="login" method="post">
      <div class="container">
        <label for="uname"><b>email</b></label>
        <input type="text" name="email" required />

        <label for="psw"
          ><b><br />Password</b></label
        >
        <input type="password" name="Password" required />

        <button type="submit" id="loginbtn">Login</button>
      </div>
    </form>
  </body>
  <script>
    var element = document.getElementById("loginbtn");
    var msg = '<%= request.getAttribute("error") %>';
    if (msg != "null") {
      alert(msg);
    }
  </script>
</html>
