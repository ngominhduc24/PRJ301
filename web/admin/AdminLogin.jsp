<%-- 
    Document   : AdminLogin
    Created on : Jun 18, 2023, 11:38:38 PM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body >
        <c:set var="cookie" value="${pageContext.request.cookies}" />
        <form action="login" method="post">
            <div class="container" style="width: 400px; height: 420px; margin-top: 100px; border: 1px; padding: 20px;
            border: 2px solid #000000;
            border-radius: 4px;
            ">

                <h2 style="text-align: center; margin-bottom: 10px;">Admin Login</h2>
                <!-- Email input -->
                <div class="form-outline mb-4">
                    <input type="text" id="form2Example1" class="form-control" name="email" value="${cookie.email.value}" />
                    <label class="form-label" for="form2Example1">Email address</label>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <input type="password" id="form2Example2" class="form-control" name="Password" value="${cookie.password.value}" />
                    <label class="form-label" for="form2Example2">Password</label>
                </div>

                <!-- 2 column grid layout for inline styling -->
                <div class="row mb-4">
                    <div class="col d-flex justify-content-center">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" name="remember" type="checkbox" value="" id="form2Example31" ${(cookie.email != null ? "checked" : "")} />
                            <label class="form-check-label" for="form2Example31"> Remember me </label>
                        </div>
                    </div>

                    <div class="col">
                        <!-- Simple link -->
                        <a href="#!">Forgot password?</a>
                    </div>
                </div>
                <c:if test="${loginmessage != null}">
                    <p style="color: red">${loginmessage}</p>
                </c:if>

                <!-- Submit button -->
                <input style="background-color: #ff5b6a; border: #ff5b6a;" type="submit" value="Log In" onclick="btnSubmit();" class="btn btn-pill text-white btn-block btn-primary">

                <!-- Register buttons -->
                <div class="text-center">
                    <p>Not a member? <a href="#!">Register</a></p>
                </div>
            </div>
        </form>
    </body>

    <script>
        function btnSubmit() {
          const href = window.location.href;
          const url = href.split("/")
          document.getElementsByName("url")[0].value = url[url.length - 1];
        }
      </script>
</html>
