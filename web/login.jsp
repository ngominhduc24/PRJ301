<%-- Document : login Created on : May 18, 2023, 11:04:29 AM Author : ASUS PC
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <c:set var="cookie" value="${pageContext.request.cookies}" />
      <div class="container">
        <label for="uname"><b>email</b></label>
        <input type="text" name="email" value="${cookie.u_email.value}" required />

        <label for="psw"
          ><b><br />Password</b></label
        >
        <input type="password" name="Password" value="${cookie.u_password.value}" required />
        <input type="checkbox" name="remember" ${(cookie.u_email != null ? "checked" : "")}>Remember me</input>
        <c:if test="${requestScope.error != null}">
          <p style="color: red">${requestScope.error}</p>
        </c:if>

        <button type="submit" id="loginbtn">Login</button>
      </div>
    </form>
  </body>
</html>
