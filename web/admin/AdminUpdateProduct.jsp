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

                    input[type="checkbox"]:not(:checked) {
                        background-color: white;
                    }
                </style>
                <title>Cart</title>
            </head>

            <body style="background-color: #FFEAE3; margin-top: 100px;">

                <form id="updateForm" action="cart" method="post">
                    <div class="container px-3 my-5 clearfix">
                        <!-- Shopping cart table -->
                        <div class="card">
                            <div class="card-header" style="background-color: #FF9EA2;">
                                <h2
                                    style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">
                                    All Product</h2>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <div class="content" style="margin-bottom: 30px; margin-top: 10px;">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroup-sizing-default"
                                                    style="width: 105px;">Image
                                                    URL</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${product.image}">
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"
                                                    id="inputGroup-sizing-default">Description</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${product.description}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"
                                                    id="inputGroup-sizing-default">Name</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${product.name}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroup-sizing-default"
                                                    style="width: 68px;">Price</span>
                                            </div>
                                            <input type="number" class="form-control" aria-label="Default"
                                                aria-describedby="inputGroup-sizing-default" value="${product.price}">
                                        </div>
                                        <div style="margin-left: 5px;">
                                            <label class="relative inline-flex items-center mr-5 cursor-pointer">
                                                <input type="checkbox" value="" class="sr-only peer" checked>
                                                <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-red-300 dark:peer-focus:ring-red-400 dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-red-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-red-400"
                                                    style="">
                                                </div>
                                                <span class="text-sm font-medium" style="margin-left: 10px;">Display
                                                    product</span>
                                            </label>
                                        </div>

                                    </div>


                                    <div class="float-left">
                                        <a href="home">
                                            <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3"
                                                style="background-color: #aeacab; border-color: #aeacab; color: white;">Cancel</button>
                                        </a>
                                    </div>

                                    <div class="float-right">
                                        <button type="button" name="updatecart" class="btn btn-lg btn-primary mt-2"
                                            style="background-color: #ff5b6a; border-color: #ff5b6a; margin-right: 5px;">Save</button>
                                        <a href="checkout">
                                            <button type="button" class="btn btn-lg btn-primary mt-2"
                                                style="background-color: #ff5b6a; border-color: #ff5b6a;">Checkout</button>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                </form>


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