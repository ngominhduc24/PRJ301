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
    </head>
    <body>
        <!-- header -->
        <nav class="navbar navbar-expand-md navbar-dark sticky-top bg-dark">
            <div class="container">
                <a class="navbar-brand" href="https://nentang.vn">Nền tảng</a>
                <div class="navbar-collapse collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="../index.html">Trang chủ <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://nentang.vn">Quản trị</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products.html">Sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">Giới thiệu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html">Liên hệ</a>
                        </li>
                    </ul>
                    <form class="form-inline mt-2 mt-md-0" method="get" action="search.html">
                        <input class="form-control mr-sm-2" type="text" placeholder="Tìm kiếm" aria-label="Search"
                               name="keyword_tensanpham">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
                    </form>
                </div>
                <ul class="navbar-nav px-3">
                    <li class="nav-item text-nowrap">
                        <a class="nav-link" href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
                    </li>
                    <li class="nav-item text-nowrap">
                        <!-- Nếu chưa đăng nhập thì hiển thị nút Đăng nhập -->
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    </li>
                </ul>
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
                        <h2>Thanh toán</h2>
                        <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
                    </div>

                    <div class="row">
                        <div class="col-md-4 order-md-2 mb-4">
                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted">Giỏ hàng</span>
                                <span class="badge badge-secondary badge-pill">${data.size()}</span>
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
                                    <button type="submit" class="btn btn-secondary">Xác nhận</button>
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

                            <h4 class="mb-3">Hình thức thanh toán</h4>

                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required=""
                                           value="1">
                                    <label class="custom-control-label" for="httt-1">Tiền mặt</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""
                                           value="2">
                                    <label class="custom-control-label" for="httt-2">Chuyển khoản</label>
                                </div>
                            </div>
                            <hr class="mb-4">
                            <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang">Đặt
                                hàng</button>
                        </div>
                    </div>
                </form>

            </div>
            <!-- End block content -->
        </main>

        <!-- footer -->
        <footer class="footer mt-auto py-3">
            <div class="container">
                <span>Bản quyền © bởi NMD-Shop - <script>document.write(new Date().getFullYear());</script>.</span>
                <span class="text-muted">Hành trang tới Tương lai</span>

                <p class="float-right">
                    <a href="#">Về đầu trang</a>
                </p>
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