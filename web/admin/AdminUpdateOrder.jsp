<%-- Document : cart1 Created on : Jun 3, 2023, 10:41:52 PM Author : ASUS PC --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="https://cdn.tailwindcss.com"></script>
                <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                    crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/cart.css" />
                <style>
                    h3,
                    h4,
                    h5,
                    h6,
                    button {
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

                    * {
                        box-sizing: border-box;
                    }

                    input[type="checkbox"] {
                        -webkit-appearance: none;
                        -moz-appearance: none;
                        appearance: none;
                        -webkit-tap-highlight-color: transparent;
                        cursor: pointer;
                    }

                    input[type="checkbox"]:f ocus {
                        outline: 0;
                    }

                    .toggle {
                        height: 32px;
                        width: 52px;
                        border-radius: 16px;
                        display: inline-block;
                        position: relative;
                        margin: 0;
                        border: 2px solid #FF9EA2;
                        /* background: linear-gradient(180deg, #2D2F39 0%, #1F2027 100%); */
                        background: #FFFFFF;
                        transition: all .2s ease;
                    }

                    .toggle:after {
                        content: '';
                        position: absolute;
                        top: 2px;
                        left: 2px;
                        width: 24px;
                        height: 24px;
                        border-radius: 50%;
                        background: #ff5b6a;
                        box-shadow: 0 1px 2px rgba(44, 44, 44, .2);
                        transition: all .2s cubic-bezier(.5, .1, .75, 1.35);
                    }

                    .toggle:checked {
                        border-color: #ffffff;
                        background: #FF9EA2;
                    }

                    .toggle:checked:after {
                        transform: translateX(20px);
                    }
                </style>
                <title>Cart</title>
            </head>

            <body style="background-color: #FFEAE3; margin-top: 100px;">

                <div class="container px-3 my-5 clearfix" style="margin-top: 100px;">
                    <!-- Shopping cart table -->
                    <div class="card">
                        <form id="updateForm" action="updateorder" method="post">

                            <div class="card-header" style="background-color: #FF9EA2;">
                                <h2
                                    style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">
                                    Order</h2>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <input type="text" value="${order.orderID}" hidden name="orderID">
                                    <input type="text" value="${account.accountID}" hidden name="accountID">
                                    <div class="content" style="margin-bottom: 30px; margin-top: 10px;">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroup-sizing-default"
                                                    style="width: 105px;">Name</span>
                                            </div>
                                            <input type="text" class="form-control" name="name" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${account.name}">
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"
                                                    id="inputGroup-sizing-default">Email</span>
                                            </div>
                                            <input type="text" class="form-control" name="email" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${account.email}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"
                                                    id="inputGroup-sizing-default">Address</span>
                                            </div>
                                            <input type="text" class="form-control" name="address" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${account.address}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"
                                                    id="inputGroup-sizing-default">Phone</span>
                                            </div>
                                            <input type="text" class="form-control" name="phone" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${account.phone}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroup-sizing-default">Order
                                                    date</span>
                                            </div>
                                            <input type="date" class="form-control" name="orderdate"
                                                aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                                value="${order.orderDate}">
                                        </div>
                                        <div class="input-group mb-3" style="width: 99.9%;">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroup-sizing-default">Total
                                                    price</span>
                                            </div>
                                            <input type="number" class="form-control" name="totalprice"
                                                aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                                value="${order.totalPrice}">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroup-sizing-default">.000
                                                    ₫</span>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="float-left">
                                        <a href="order">
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
                                </div>
                            </div>
                        </form>

                        <form action="">
                            <!-- table -->
                            <table class="table table-bordered table-hover" style="margin-top: 30px;">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center;">Product ID</th>
                                        <th scope="col" style="text-align: center;">Product name</th>
                                        <th scope="col" style="text-align: center;">Quantity</th>
                                        <th scope="col" style="text-align: center;">Price</th>
                                        <th scope="col" style="text-align: center;">Total price</th>
                                        <th scope="col" style="text-align: center; width: 40px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listOrderDetails}" var="orderDetail">
                                        <tr>
                                            <td style="text-align: center;">${orderDetail.getProduct().productID}</td>
                                            <td style="text-align: center;">${orderDetail.getProduct().name}</td>
                                            <td style="text-align: center;"><input type="number"
                                                    style="width: 45px; text-align: center;" max="20" min="1"
                                                    value="${orderDetail.quantity}"></td>
                                            <td style="text-align: center;">${orderDetail.getProduct().price}</td>
                                            <td style="text-align: center;">${orderDetail.quantity *
                                                orderDetail.getProduct().price}.000 ₫</td>
                                            <td
                                                style="text-align: center; display: flex; justify-content: space-between;">
                                                <a
                                                    href="deleteorderdetail?orderID=${orderDetail.orderID}&productID=${orderDetail.product.productID}">
                                                    <button type="button" class="btn btn-block">Update</button>
                                                </a>
                                                <a
                                                    href="deleteorderdetail?orderID=${orderDetail.orderID}&productID=${orderDetail.product.productID}">
                                                    <button type="button" class="btn btn-block">Delete</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>


            </body>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
                integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
                crossorigin="anonymous"></script>
            <script>
            </script>

            </html>