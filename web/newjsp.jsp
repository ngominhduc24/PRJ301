<%-- 
    Document   : cart1
    Created on : Jun 3, 2023, 10:41:52 PM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/styles/cart.css"
            />
        <style>
            h1, h3, h4, h5, h6, p, a, label, button {
                font-family: 'Poppins';
                font-style: normal;
                font-weight: 600;
                font-size: 16px;
                line-height: 24px;

                /* identical to box height */
                text-transform: capitalize;

                /* white */
                color: #FFFFFF;
            }
        </style>
        <title>Cart</title>
    </head>
    <body style="background-color: #FFEAE3;">
        
         <!-- Header -->
             <%@include file="header.jsp"%> 
        <!-- end header -->
        
            <!-- Shopping cart table -->
               

                    

          <input type="submit" name="updatecart"  style="background-color: #ff5b6a; border-color: #ff5b6a; margin-right: 5px;">Save</input>
                        

                            
         <!-- Modal -->
         <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document" >
              <div class="modal-content" style="width: 540px; margin-left: 180px;">
                <div class="modal-header">
                  <!-- <h5 class="modal-title" id="exampleModalLongTitle">Login</h5> -->
                  <div>
                    <button class="btn btn-secondary" id="modallogin" style="background-color: #ff5b6a; border: #ff5b6a; width: 100px; height: auto;">Log in</button>
                    <button class="btn btn-secondary" id="modalsignup" style="background-color: #ff5b6a; border: #ff5b6a; width: 100px; height: auto;">Sign up</button>
                  </div>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body" style="padding: 0px;">
                    <div id="divlogin" style=" margin-left: 0px; padding: 0px;  width: 538px;">
                        <%@include file="login.jsp"%>
                    </div>
                    <div id="divsignup" style=" margin-left: 0px; padding: 0px;  width: 538px;" hidden>
                      <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-12" style="padding: 0px;">
                                <div class="form-block"  style="padding: 20px; width:538px;">
                                    <c:set var="cookie" value="${pageContext.request.cookies}" />
                                    <div class="mb-4">
                                        <h3>Sign Up </h3>
                                    </div>
                                    <form action="login" method="post">
                                        <div class="form-group first">
                                            <label for="username">Your Name</label>
                                            <input type="text" name="name" class="form-control" id="name" value="">
                                        </div>
                                        <div class="form-group first">
                                            <label for="username">Your Email</label>
                                            <input type="text" name="email" class="form-control" id="email" value="">
                                        </div>
                                          
                                        <div class="form-group first">
                                            <label for="username">Your Phone</label>
                                            <input type="text" name="phone" class="form-control" id="phone" value="">
                                        </div>
                                        <div class="form-group first">
                                            <label for="username">Your Address</label>
                                            <input type="text" name="address" class="form-control" id="address" value="">
                                        </div>
            
                                        <div class="form-group first row" style="display: flex; ">
                                            <div class="col-md-6">
                                                <label for="password">Password</label>
                                                <input type="password" name="Password" class="form-control" id="password" value="">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="password" >Repeat your password</label>
                                                <input type="password" name="repassword" class="form-control" id="repassword" value="">
                                            </div>
                                          </div>
            
                                        <% if(request.getAttribute("error") != null){ %>
                                        <div class="alert alert-danger" role="alert">
                                            <%= request.getAttribute("error") %>
                                        </div>
                                        <% } %>
            
                                        <div class="d-flex mb-5 align-items-center">
                                            <label class="control control--checkbox mb-0"><span class="caption">I agree all statements in <a href="#!">Terms of service</a></span>
                                                <input type="checkbox" name="checkbox" ></input>
                                                <div class="control__indicator"></div>
                                            </label>
                                        </div>
                                        <c:if test="${loginmessage != null}">
                                            <p style="color: red">${loginmessage}</p>
                                        </c:if>
                                        <input style="background-color: #ff5b6a; border: #ff5b6a; margin-top: -10px;" type="submit" value="Sign Up" class="btn btn-pill text-white btn-block btn-primary">
            
                                    </form>
                                </div>
                            </div>
                        </div>
            
                    </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        <!-- end Modal -->
        
    </body>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
        function confirmDelete(productID) {
            if (confirm("Are you sure you want to remove this item?")) {
                window.location.href = "deletecart?pid=" + productID;
            } else {
                return false;
            }
        }

        var btn_update = document.getElementsByName("updatecart")[0];
        btn_update.onclick = () => {
        var cart = "";
        var temp = "${data.size()}";
        var cart_count = parseInt(temp);
        for (var i = 0; i <cart_count; i++) {
          try {
            var productid = document.getElementsByName("productid")[i].value;
            var quantity = document.getElementsByName("quantity")[i].value;
            if (productid != "" && productid != undefined && quantity != "" && quantity != undefined ) {
              cart += productid + ":" + quantity + "/";
            } else {
            break;
            }
          } catch (error) {
            break;
          }
        }
        var form = document.getElementById("updateForm");

        // Create a hidden input element
        var cartInput = document.createElement("input");
        cartInput.setAttribute("type", "hidden");
        cartInput.setAttribute("name", "cart");
        cartInput.setAttribute("value", cart.substring(0, cart.length - 1));
        form.appendChild(cartInput);

        form.submit();
      }
      
      // click if login fail
                var message = "${loginmessage}";
                if (message != null && message != "") {
                    document.getElementById("btnlogin").click();
                }

            // signup 
            var signup = document.getElementById("modalsignup");
            signup.addEventListener("click", function() {
                document.getElementById("divlogin").hidden = true;
                document.getElementById("divsignup").hidden = false;
            });

            // login
            var login = document.getElementById("modallogin");
            login.addEventListener("click", function() {
                document.getElementById("divlogin").hidden = false;
                document.getElementById("divsignup").hidden = true;
            });
    </script>
</html>
