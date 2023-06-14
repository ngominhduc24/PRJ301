<%-- 
    Document   : loginModal
    Created on : Jun 2, 2023, 2:52:42 PM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/fonts/icomoon/style.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/owl.carousel.min.css">
        <!-- Style -->
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/styles/loginModal.css"
            />
        <title>JSP Page</title>
    </head>
    <body>



        <!-- <div class="content"> -->
        <!-- <div class="container"> -->
        <!-- <div class="row justify-content-center"> -->
        <div class="col-md-6 contents">
            <div class="row justify-content-center">
                <div class="col-md-12" style="padding: 0px;">
                    <div class="form-block"  style="padding: 20px; width:538px;">
                        <c:set var="cookie" value="${pageContext.request.cookies}" />
                        <div class="mb-4">
                            <h3>Sign Up </h3>
                        </div>
                        <form action="signup" method="post">
                            <div class="form-group first">
                                <label for="username">Your Name</label>
                                <input type="text" name="signup_name" class="form-control" id="name" value="">
                            </div>
                            <div class="form-group first">
                                <label for="username">Your Email</label>
                                <input type="text" name="signup_email" class="form-control" id="email" value="">
                            </div>
                              
                            <div class="form-group first">
                                <label for="username">Your Phone</label>
                                <input type="text" name="signup_phone" class="form-control" id="phone" value="">
                            </div>
                            <div class="form-group first">
                                <label for="username">Your Address</label>
                                <input type="text" name="signup_address" class="form-control" id="address" value="">
                            </div>

                            <div class="form-group first row" style="display: flex; ">
                                <div class="col-md-6">
                                    <label for="password">Password</label>
                                    <input type="password" name="signup_password" class="form-control" id="password" value="">
                                </div>
                                <div class="col-md-6">
                                    <label for="password" >Repeat your password</label>
                                    <input type="password" name="signup_repassword" class="form-control" id="repassword" value="">
                                </div>
                              </div>

                            <% if(request.getAttribute("error") != null){ %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                            <div class="d-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-0"><span class="caption">I agree all statements in <a href="#!">Terms of service</a></span>
                                    <input type="checkbox" name="signup_checkbox" ></input>
                                    <div class="control__indicator"></div>
                                </label>
                            </div>
                            <c:if test="${signupmessage != null}">
                                <p style="color: red">${signupmessage}</p>
                            </c:if>
                                <input hidden value="" name="urlsignup" id="urlsignup">
                            <input style="background-color: #ff5b6a; border: #ff5b6a; margin-top: -10px;" type="submit" onclick="btnSignupSubmit();" value="Sign Up" class="btn btn-pill text-white btn-block btn-primary">

                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- </div> -->
        <!-- </div> -->
        <!-- </div> -->


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script>    
            function btnSignupSubmit() {
              const href = window.location.href;
              const url = href.split("/");
              document.getElementById("urlsignup").value = url[url.length - 1];
            }
          </script>
    </body>
</html>
