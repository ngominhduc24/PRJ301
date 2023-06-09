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
        <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/styles/invoice.css"
            />
        <style>
            html {
                /* zoom: 0.9; */
                /* Giảm kích thước phần tử xuống 80% */
            }

            .orderlist p,
            h5 {
                margin-bottom: 5px ;
            }

            .menu h6 {
                margin-top: 17px;
            }

            .text p {
                display: inline;
            }

            .total {
                justify-content: flex-end;
            }
            .text .right {
                margin-left: 50px;
            }


        </style>
        <title>Cart</title>
    </head>

    <body style="background-color: #FFEAE3; margin-top: 80px; ">

        <!-- Header -->
        <!-- <%@include file="header.jsp"%>  -->
        <!-- end header -->


        <div class="row" style="width: 60%; height: auto; margin: 0 auto; ">
            <!-- menu -->
            <div class="col-md-3 menu" style="padding: 20px 30px; width: auto; height: 278px;">
                <h5>Account</h5>
                <h6>Contact information</h6>
                <h6>Change password</h6>
                <h6 class=" dropdown-toggle dropdown" onclick="dropdown();" style="user-select: none;" > Orders </h6>
                <div id="dropdown" style="display: none;">
                    <a>All Orders</a> <br>
                    <a>Processing</a> <br>
                    <a>Completed</a> <br>
                    <a>Cancelled</a>
                </div>
            </div>

            <div class="col-md-9">
                <!-- Shopping invove table -->
                <div class="card content-product">
                    <div class="card-header" style="background-color: #FF9EA2;">
                        <h2 style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">Shopping Cart</h2>
                    </div>
                    <div class="orderlist" style="padding: 15px 20px;">

                        <c:forEach items="${data}" var="bill" varStatus="loopStatus">

                            <c:forEach items="${bill}" var="products" varStatus="innerLoopStatus">
                                <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                                    <div class="col-md-8 product" style="padding: 0;">
                                        <div class="img">
                                            <img src="${products.image}" alt="">
                                        </div>
                                        <div class="content">
                                            <h5 class="mt-0">${products.name}</h5>
                                            <p>${products.description}</p>
                                            <p class="mb-0">product code: ${products.productID}</p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4 second-product total" style="padding: 0;">
                                        <div class="text">
                                            <div >
                                                <p >${products.quantity} Pcs</p> <p class="right">${products.price}.000 ₫</p><br>
                                            </div>
                                            <div  style="margin-top: 25px;">
                                                <p >total: </p> <p class="right">${bill.getTotalPrice()}.000 ₫</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${!innerLoopStatus.last}">
                                    <div style="background-color: rgb(226, 226, 226); margin-top: 20px; margin-bottom: 20px; padding: 0.3px 0px;"></div>
                                </c:if>
                                <c:if test="${innerLoopStatus.last}">
                                    <div style="background-color: rgb(226, 226, 226); margin-top: 20px; margin-bottom: 20px; padding: 0.1px 0px;"></div>
                                    <!-- total bill -->
                                    <div class="row" style="margin-top: 10px; margin-bottom: 10px;">
                                        <div class="col-md-8 product" style="padding: 0;">
                                            <div class="content">
                                                <p>Delivery Date: 27-2023</p>
                                            </div>
                                        </div>

                                        <div class="col-md-4 second-product total" style="padding: 0;">
                                            <div class="text">
                                                <div >
                                                    <p >Total:</p> <p class="right">${bill.getTotalPrice()}.000 ₫</p><br>
                                                </div>
                                                <div  style="margin-top:5px;">
                                                    <p style="padding-right: 37px;">Delivery:</p> <p class="right">0 ₫</p><br>
                                                </div>
                                                <div  style="margin-top:5px;">
                                                    <p style="margin-left: 30px;">Total: </p> <p class="right">${bill.getTotalPrice()}.000 ₫</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end total bill -->
                                </c:if>
                            </c:forEach>
                            <c:if test="${!loopStatus.last}">
                                <div style="background-color: rgb(121, 121, 121); margin-top: 20px; margin-bottom: 20px; padding: 0.3px 0px;"></div>
                            </c:if>
                        </c:forEach>

                    </div>
                    <!-- end invove -->

                </div>
            </div>
            <div class="container px-3 my-5 clearfix" >

            </div>
    </body>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
                    function dropdown() {
                        var x = document.getElementById("dropdown");
                        if (x.style.display === "none") {
                            x.style.display = "block";
                        } else {
                            x.style.display = "none";
                        }
                    }
    </script>
</html>
