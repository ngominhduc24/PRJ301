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
        </style>
    </head>
    <body>
        <!-- header -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed fixed-top" style="height: 60px; " >
            <div class="container" > 
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <div class="navbar-nav mr-auto">
                        <!-- Image and text -->
                        <a class="navbar-brand" href="#">
                            <div style="display: flex;">
                                <img src="https://png.pngtree.com/element_our/png/20180917/food-logo-design.-knife-fork-and-spoon-logo.-png_98037.jpg" width="40px" height="40px" class="d-inline-block align-top" alt="">
                                <h3 style="margin-top: 10px; margin-left: 5px;  ">NMD-Shop</h3> 
                            </div>
                        </a>
                      </div>
                      <div class="navbar-nav mr-auto">
                        <form class="form-inline my-2 my-lg-0" action="home">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                          </form>
                      </div>
                      <div>
                        <a href="cart">
                            <svg width="30px" height="30px" viewBox="0 0 96 96" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g id="cart" clip-path="url(#clip-cart)">
                                <g id="pills" transform="translate(0 -116)">
                                    <g id="Group_154" data-name="Group 154">
                                    <path id="Path_188" data-name="Path 188" d="M92,132H84.619a8.361,8.361,0,0,0-7.956,5.47L63.712,174.53A8.364,8.364,0,0,1,55.755,180H21.321a8.4,8.4,0,0,1-7.773-4.994l-8.925-21C2.387,148.746,6.445,143,12.4,143H57" fill="none" stroke="#58595b" stroke-linecap="round" stroke-linejoin="round" stroke-width="4"/>
                                    <circle id="Ellipse_335" data-name="Ellipse 335" cx="4.5" cy="4.5" r="4.5" transform="translate(20 187)" fill="none" stroke="#58595b" stroke-linecap="round" stroke-linejoin="round" stroke-width="4"/>
                                    <circle id="Ellipse_336" data-name="Ellipse 336" cx="4.5" cy="4.5" r="4.5" transform="translate(49 187)" fill="none" stroke="#58595b" stroke-linecap="round" stroke-linejoin="round" stroke-width="4"/>
                                    </g>
                                </g>
                                </g>
                            </svg>
                            <span class='badge badge-warning' id='lblCartCount' style="background-color: #ec3443; border-radius: 9px; padding: 1px 4px;">${data.size()}</span>
                        </a>
                        <c:if test="${sessionScope.role == null}">
                        <!-- <button href="login"> -->
                        <button type="button" id="btnlogin" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="background-color: #f8f9fa; padding: 6px; border: 0px;">
                            <svg width="20px" height="20px" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill="#555" d="M9.99296258,10.5729355 C12.478244,10.5729355 14.4929626,8.55821687 14.4929626,6.0729355 C14.4929626,3.58765413 12.478244,1.5729355 9.99296258,1.5729355 C7.5076812,1.5729355 5.49296258,3.58765413 5.49296258,6.0729355 C5.49296258,8.55821687 7.5076812,10.5729355 9.99296258,10.5729355 Z M10,0 C13.3137085,0 16,2.6862915 16,6 C16,8.20431134 14.8113051,10.1309881 13.0399615,11.173984 C16.7275333,12.2833441 19.4976819,15.3924771 19.9947005,19.2523727 C20.0418583,19.6186047 19.7690435,19.9519836 19.3853517,19.9969955 C19.0016598,20.0420074 18.6523872,19.7816071 18.6052294,19.4153751 C18.0656064,15.2246108 14.4363723,12.0699838 10.034634,12.0699838 C5.6099956,12.0699838 1.93381693,15.231487 1.39476476,19.4154211 C1.34758036,19.7816499 0.998288773,20.0420271 0.614600177,19.9969899 C0.230911582,19.9519526 -0.0418789616,19.6185555 0.00530544566,19.2523267 C0.500630192,15.4077896 3.28612316,12.3043229 6.97954305,11.1838052 C5.19718955,10.1447285 4,8.21217353 4,6 C4,2.6862915 6.6862915,0 10,0 Z"/>
                              </svg>
                        </button>
                    </c:if>
                        <c:if test="${sessionScope.role != null}">
                        <a href="logout">
                            <svg fill="#000000" width="30px" height="30px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <g id="Login">
                                  <g>
                                    <path  d="M20.944,18.432a2.577,2.577,0,0,1-2.729,2.5c-2.153.012-4.307,0-6.46,0a.5.5,0,0,1,0-1c2.2,0,4.4.032,6.6,0,1.107-.016,1.589-.848,1.589-1.838V5.63a1.545,1.545,0,0,0-.969-1.471,3.027,3.027,0,0,0-1.061-.095H11.755a.5.5,0,0,1,0-1c2.225,0,4.465-.085,6.688,0a2.566,2.566,0,0,1,2.5,2.67Z"/>
                                    <path  d="M15.794,12.354a.459.459,0,0,0,.138-.312A.3.3,0,0,0,15.938,12a.29.29,0,0,0-.006-.041.455.455,0,0,0-.138-.313L12.125,7.978a.5.5,0,0,0-.707.707L14.234,11.5H3.492a.5.5,0,0,0,0,1H14.234l-2.816,2.815a.5.5,0,0,0,.707.707Z"/>
                                  </g>
                                </g>
                              </svg>
                        </a>
                    </c:if>
                      </div>
                    </div>
                </div>
            </nav>
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

    </body>
</html>
