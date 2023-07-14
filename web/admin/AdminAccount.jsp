<%-- Document : cart1 Created on : Jun 3, 2023, 10:41:52 PM Author : ASUS PC --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                </style>
                <title>Cart</title>
            </head>

            <body style="background-color: #FFEAE3; margin-top: 100px;">
                <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark position-fixed fixed-top"
                    style="background-color: #fd7c80 !important; display: flex; justify-content: space-between; ">
                    <!-- Navbar-->
                    <a class="navbar-brand ps-3" href="logout">⇦ logout</a>
                    <a class="navbar-brand ps-3" href="home">Product</a>
                    <a class="navbar-brand ps-3" href="account">Account</a>
                    <a class="navbar-brand ps-3" href="order">Order</a>
                    <!-- Navbar Brand-->
                    <a class="navbar-brand ps-3" href="dashboard">Dashboard ⇨</a>
                </nav>
                <form id="updateForm" action="home" method="post">
                    <div class="container px-3 my-5 clearfix">
                        <!-- Shopping cart table -->
                        <div class="card">
                            <div class="card-header" style="background-color: #FF9EA2;">
                                <h2
                                    style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">
                                    All Account</h2>
                            </div>

                            <div class="table-responsive">
                                <c:if test="${data == null}">
                                    <h6 class="text-center">You have no account!</h6> <br>
                                </c:if>
                                <c:if test="${data != null}">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Email</th>
                                                <th scope="col"> Name</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Address</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${data}" var="item">
                                                <tr>
                                                    <td>${item.accountID}</td>
                                                    <td>${item.email}</td>
                                                    <td>${item.name}</td>
                                                    <td>${item.phone}</td>
                                                    <td>${item.address}</td>
                                                    <td>
                                                        <a href="updateaccount?id=${item.accountID}"><i
                                                                class="fas fa-edit"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
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
                function confirmDelete(productID) {
                    if (confirm("Are you sure you want to remove this product?")) {
                        window.location.href = "deleteproduct?pid=" + productID;
                    } else {
                        return false;
                    }
                }

                const message = '${deleteproductmessage}';
                if (message != '') {
                    alert(message);
                }
            </script>

            </html>