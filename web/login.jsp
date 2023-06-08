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
                    <div class="form-block"  style="padding: 30px; width:538px;">
                      <c:set var="cookie" value="${pageContext.request.cookies}" />
                        <div class="mb-4">
                        <h3>Sign In to <strong>NMD - SHOP</strong></h3>
                        <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
                      </div>
                      <form action="login" method="post">
                        <div class="form-group first">
                          <label for="username">Email</label>
                          <input type="text" name="email" class="form-control" id="username" value="${cookie.email.value}">
      
                        </div>
                        <div class="form-group last mb-4">
                          <label for="password">Password</label>
                          <input type="password" name="Password" class="form-control" id="password" value="${cookie.password.value}">
                          
                        </div>
                        
                        <div class="d-flex mb-5 align-items-center">
                          <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                            <input type="checkbox" name="remember" ${(cookie.email != null ? "checked" : "")}></input>
                            <div class="control__indicator"></div>
                          </label>
                          <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                        </div>
                        <c:if test="${loginmessage != null}">
                            <p style="color: red">${loginmessage}</p>
                        </c:if>
                        <input style="background-color: #ff5b6a; border: #ff5b6a;" type="submit" value="Log In" class="btn btn-pill text-white btn-block btn-primary">
                        <span class="d-block text-center my-4 text-muted"> or sign in with</span>
                        
                        <div class="social-login text-center">
                          <a href="#" class="facebook">
                            <span class="icon-facebook mr-3"></span> 
                          </a>
                          <a href="#" class="twitter">
                            <span class="icon-twitter mr-3"></span> 
                          </a>
                          <a href="#" class="google">
                            <span class="icon-google mr-3"></span> 
                          </a>
                        </div>
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
        </body>
</html>
