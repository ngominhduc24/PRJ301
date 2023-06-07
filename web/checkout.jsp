<%-- 
    Document   : purchaseOrder
    Created on : May 27, 2023, 11:49:48 PM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Check out</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- Font awesome -->
        <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css" type="text/css">

        <!-- Custom css - Các file css do chúng ta tự viết -->
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/styles/checkout.css"
            />
        <style>
            p{

                font-family: 'Poppins';
                font-style: normal;
                font-weight: 600;
                font-size: 16px;
                line-height: 24px;
                /* identical to box height */

                text-transform: capitalize;

                /* white */

                color: #FFFFFF;


                /* Inside auto layout */

                flex: none;
                order: 0;
                flex-grow: 0;
            }

            input{
                /* input */
                box-sizing: border-box;
                background: #FFFFFF;
                border: 1px solid #DFE1E3;
                border-radius: 4px;
            }

            h2{
                font-family: Roboto,Arial,sans-serif;
            }
            label {
                margin-top: 10px;
                margin-bottom: 3px;
            }
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body style="background-color: #FFEAE3;">
        <!-- header -->
             <!-- <%@include file="header.jsp"%>  -->
        <!-- end header -->

        <main role="main">
            <!-- Block content - Đục lỗ trên giao diện bố cục chung, đặt tên là `content` -->
            <div class="container mt-4">
                <form class="needs-validation" name="frmthanhtoan" method="post"
                      action="">
                    <input type="hidden" name="kh_tendangnhap" value="dnpcuong">

                    <div class="py-5 text-center">
                        <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                        <h2 >Thanh toán</h2>
                    </div>

                    <div class="row">
                        <div class="col-md-4 order-md-2 mb-4">
                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted">Giỏ hàng</span>
                                <span class="badge badge-secondary badge-pill" style="background-color: #ff5b6a;">${data.size()}</span>
                            </h4>
                            <ul class="list-group mb-3">
                                <c:forEach items="${data}" var="item">
                                    <c:set var="total" value="${total + item.price * item.quantity}" />
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                        <div>
                                            <h6 class="my-0">${item.name}</h6>
                                            <small class="text-muted">${item.price}.000 ₫ x ${item.quantity}</small>
                                        </div>
                                        <span class="text-muted">${item.price * item.quantity}.000 ₫</span>
                                    </li>
                                </c:forEach>
                                
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Tổng thành tiền</span>
                                    <input value="${total}" name="totalPrice" hidden></input>
                                    <strong>${total}.000 ₫</strong>
                                </li>
                            </ul>

                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Mã khuyến mãi">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-secondary" style="background-color: #ff5b6a;">Xác nhận</button>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-8 order-md-1">
                            <h4 class="mb-3">Thông tin khách hàng</h4>

                            <div class="row">
                                <div class="col-md-12">
                                    <label for="kh_ten">Họ tên</label>
                                    <input type="text" class="form-control" name="name" id="kh_ten"
                                           value="${user.name}" readonly="">
                                </div>
                                <div class="col-md-12">
                                    <label for="kh_diachi">Địa chỉ</label>
                                    <input type="text" class="form-control" name="address" id="kh_diachi" required=""
                                           value="${user.address}" >
                                </div>
                                <div class="col-md-12">
                                    <label for="kh_dienthoai">Điện thoại</label>
                                    <input type="text" class="form-control" name="phone" id="kh_dienthoai" required=""
                                           value="${user.phone}" >
                                </div>
                                <div class="col-md-12">
                                    <label for="kh_email">Email</label>
                                    <input type="text" class="form-control" name="email" id="kh_email"
                                           value="${user.email}" readonly="">
                                </div>
                            </div>

                            <div class="d-block my-3">
                                
                            </div>
                            <hr class="mb-4">
                            <button class="btn btn-secondary" type="submit" 
                            style="/* Auto layout */ border-color: #ff5b6a;  padding: 10px 20px; width: 270px; height: 40px; /* pink */ background: #ff5b6a; border-radius: 4px; display: flex; justify-content: center; align-items: center;">
                            <p style=" text-align: center; margin: 0;">Pay Now</p> 
                        </button>
                        
                        </div>
                    </div>
                </form>

            </div>
            <!-- End block content -->
        </main>




        
        <!-- footer -->
        <footer class="footer " style="display: grid; padding: 0; margin-top: 50px; background-color: #FFEAE3;">
            <div style="padding: 1px; background-color: black;"></div>
            <div class="container" style="padding: 35px; display: block; max-width: fit-content;">
                <div class="w3-third" style="width: inherit;" >
                    <h3 style="text-align: center;">ĐĂNG KÝ NHẬN THÔNG TIN KHUYẾN MÃI</h3>
                    <h6 style="text-align: center;">Đặc biệt hơn, NMD-Shop giao hàng MIỄN PHÍ khi bạn đặt hàng qua Website NMD-Shop hoặc gọi đến số 1900.1111.</h6>
                </div>
            </div>
            <div class="copyright" style="background-color: #FF9EA2; padding:0px; text-align: center; ">
                <h6 style="margin-top: 15px; color: white;">© 2023 NMD-Shop All Rights Reserved Site by LDCC</h6>
                
            </div>
        </footer>
        <!-- end footer -->

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/popperjs/popper.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Custom script - Các file js do mình tự viết -->
        <script src="../assets/js/app.js"></script>

        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
            }

            function testImageUrl(url) {
            return new Promise(function(resolve, reject) {
                var image = new Image();
                image.addEventListener('load', resolve);
                image.addEventListener('error', reject);
                image.src = url;
            });
            }

            let img = document.getElementsByClassName("img");
            for (let i = 0; i < img.length; i++) {
                testImageUrl(img[i].src).then(function imageLoaded(e) {
                    return img[i].src;
                })
                .catch(function imageFailed(e) {
                    return img[i].src = "https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/e/x/extra--534x374px_chicken-soup.png";
                });
            }
        </script>

    </body>
</html>
