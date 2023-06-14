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
             h3, h4, h5, h6, button {
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
    <body style="background-color: #FFEAE3; margin-top: 100px;">
        
         <!-- Header -->
             <!-- <%@include file="header.jsp"%>  -->
        <!-- end header -->
        
      <form id="updateForm" action="cart" method="post">
        <div class="container px-3 my-5 clearfix" >
            <!-- Shopping cart table -->
            <div class="card">
                <div class="card-header" style="background-color: #FF9EA2;">
                    <h2 style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">Shopping Cart</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <c:if test="${data == null}">
                            <h6 class="text-center">You have no items in your shopping cart!</h6> <br>
                        </c:if>
                        <c:if test="${data != null}">
                        <table class="table table-bordered m-0">
                            <thead>
                                <tr>
                                    <!-- Set columns width -->
                                    <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                    <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                    <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                                </tr>
                            </thead>
                            <tbody>
                                  <!-- for Item -->
                                  <c:forEach var="item" items="${data}" varStatus="loop">
                                      <c:set var="total" value="${total + item.price*item.quantity}" />
                                      <tr>
                                          <td class="p-4">
                                              <div class="media align-items-center">
                                                  <div class="media-body">
                                                      <h6 class="d-block text-dark" style="font-size: 18px;">${item.name}</h6>
                                                      <small>
                                                          <span class="text-muted">${item.description}</span>
                                                      </small>
                                                  </div>
                                              </div>
                                          </td>

                                          <td class="text-right font-weight-semibold align-middle p-4">${item.price}</td>
                                          <input type="hidden" name="productid" value="${item.productID}"></input>
                                          <td class="align-middle p-4"><input type="number" min="1" max="20" class="form-control text-center" name="quantity" value="${item.quantity}"></td>
                                          <td class="text-right font-weight-semibold align-middle p-4">${item.price * item.quantity}</td>
                                          <td class="text-center align-middle px-0" >
                                              <button type="button" onclick="confirmDelete('${item.productID}');" style="border: 0px; padding: 0px; background-color: white; " id="" class="" >
                                                  <svg width="20" height="20" viewBox="0 0 128 128" fill="#ff5b6a" class="icon" xmlns="http://www.w3.org/2000/svg"><path d="M4 30.2c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5l117.5.2c1.4 0 2.5 1.1 2.5 2.5s-1.1 2.5-2.5 2.5L4 30.2zm19.3 5.1c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5v86.1l73.2-.8V36.2c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5v89.6l-83.3.9V35.3z"/><path d="M85.3 108.4c-1.4 0-2.5-1.1-2.5-2.5V46.5c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5v59.4c.1 1.4-1.1 2.5-2.5 2.5zm-39.4 0c-1.4 0-2.5-1.1-2.5-2.5V46.5c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5v59.4c.1 1.4-1.1 2.5-2.5 2.5zm19.7 0c-1.4 0-2.5-1.1-2.5-2.5V46.5c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5v59.4c.1 1.4-1.1 2.5-2.5 2.5zm16.3-81.7v-6.1c0-2.2-1.8-4-4-4H52.3c-2.3 0-4 1.8-4 4.1V26h-5v-5.3c0-5 4.1-9.1 9.1-9.1H78c5 0 9.1 4.1 9.1 9.1v6.1h-5.2z" fill="ff5b6a"/></svg>
                                              </button>
                                          </td>
                                      </tr>
                              </c:forEach>
                              <!-- end for -->
                            </tbody>
                        </table>
                    </div>
                    <!-- / Shopping cart table -->

                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                        <div class="mt-4">
                        </div>
                        <div class="d-flex">
                            <div class="text-right mt-4">
                                <label class="text-muted font-weight-normal m-0">Total price</label>
                                <div class="text-large"><strong>${total}.000 ₫</strong></div>
                            </div>
                        </div>
                    </div>
                </c:if>

                    <div class="float-left">
                        <a href="home">         
                            <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" style="background-color: #aeacab; border-color: #aeacab;">Back to shopping</button>
                        </a>
                    </div>

                    <div class="float-right">
                        <button type="button" name="updatecart" class="btn btn-lg btn-primary mt-2" style="background-color: #ff5b6a; border-color: #ff5b6a; margin-right: 5px;">Save</button>
                        <a href="checkout">
                            <button type="button" class="btn btn-lg btn-primary mt-2" style="background-color: #ff5b6a; border-color: #ff5b6a;">Checkout</button>
                        </a> 
                    </div>

                </div>
            </div>
        </div>
      </form>
                           
      <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document" >
              <div class="modal-content" style="width: 540px; margin-left: 180px;">
                <div class="modal-header">
                  <!-- <h5 class="modal-title" id="exampleModalLongTitle">Login</h5> -->
                  <div>
                    <button class="btn btn-secondary" id="modal_login" style="background-color: #ff5b6a; border: #ff5b6a; width: 100px; height: auto;">Log in</button>
                    <button class="btn btn-secondary" id="modal_signup" style="background-color: #ff5b6a; border: #ff5b6a; width: 100px; height: auto;">Sign up</button> 
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
                        <%@include file="signup.jsp"%>
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
      
        // signup 
        var signup = document.getElementById("modal_signup");
        signup.addEventListener("click", function() {
            document.getElementById("divlogin").hidden = true;
            document.getElementById("divsignup").hidden = false;
        });

        // login
        var login = document.getElementById("modal_login");
        login.addEventListener("click", function() {
            document.getElementById("divlogin").hidden = false;
            document.getElementById("divsignup").hidden = true;
        });

        var btnmodal = document.getElementById("btnlogin");
        // click if login fail
        var loginmessage = "${loginmessage}";
        if (loginmessage != null && loginmessage != "") {
            btnmodal.click();
            login.click();
        }

        // click if signup fail
        var signupmessage = "${signupmessage}";
        if (signupmessage != null && signupmessage != "") {
            btnmodal.click();
            signup.click();
        }
    </script>
</html>
