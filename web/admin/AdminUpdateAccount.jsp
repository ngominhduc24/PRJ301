<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%-- Document : AdminUpdateAccount Created on : Jul 12, 2023, 11:54:47 AM Author : ASUS PC --%>

        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
                <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                    crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/account.css" />
                <style>
                    html {
                        /* zoom: 0.9; */
                        /* Giảm kích thước phần tử xuống 80% */
                    }

                    .orderlist p,
                    h5 {
                        margin-bottom: 5px;
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
                <title>JSP Page</title>
            </head>

            <body style="background-color: #FFEAE3; margin-top: 100px;">

                <div class="card content-product" style="margin-top: 70px; ">
                    <div class="card-header" style="background-color: #FF9EA2;">
                        <h2 style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">
                            Contact information</h2>
                    </div>
                    <form action="updateaccount" method="post">
                        <div class="orderlist" style="padding: 15px 10px 70px 20px;">
                            <div class="form-group first">
                                <label for="username"> Email</label>
                                <input type="text" name="email" class="form-control" id="email" value="${account.email}"
                                    style="background-color: white;">
                            </div>
                            <div class="form-group first">
                                <label for="username">Your Name</label>
                                <input type="text" name="name" class="form-control" id="name" value="${account.name}">
                            </div>
                            <div class="form-group first">
                                <label for="username">Your Phone</label>
                                <input type="text" name="phone" class="form-control" id="phone"
                                    value="${account.phone}">
                            </div>
                            <div class="form-group first">
                                <label for="username">Your Address</label>
                                <input type="text" name="address" class="form-control" id="address"
                                    value="${account.address}">
                            </div>
                            <c:if test="${cookie.successinfo != null}">
                                <p style="color: rgb(3, 219, 39)">Update info successfully!</p>
                            </c:if>
                            <c:if test="${cookie.errorinfo != null}">
                                <p style="color: rgb(255, 0, 0)">Not valid!</p>
                            </c:if>

                            <div class="float-left">
                                <a href="account">
                                    <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3"
                                        style="background-color: #aeacab; border-color: #aeacab; color: white;">Back
                                        to home</button>
                                </a>
                            </div>

                            <div class="float-right">
                                <button type="button" name="updatecart" class="btn btn-lg btn-primary mt-2"
                                    style="background-color: #ff5b6a; border-color: #ff5b6a; margin-right: 5px;">Reload</button>
                                <button type="submit" class="btn btn-lg btn-primary mt-2"
                                    style="background-color: #ff5b6a; border-color: #ff5b6a;">Save</button>
                            </div>
                            <!-- <input style="background-color: #ff5b6a; border: #ff5b6a; margin-top: 30px;" type="submit"
                                value="Save" class="btn btn-pill text-white btn-block btn-primary"> -->
                        </div>
                    </form>
                </div>
            </body>

            </html>