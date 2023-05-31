<%-- 
    Document   : Home
    Created on : May 24, 2023, 10:35:52 PM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link
        rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/styles/home.css"
        />
        <style>
            body,h1,h2,h3,h4,h5,h6, p {
                font-family: Roboto,Arial,sans-serif;
            }
            .w3-bar-block .w3-bar-item {
                padding:20px
            }
        </style>
    </head>
    <body>
        <!-- code -->
        <c:if test="${param.logout != null }">
                <c:remove var="role" scope="session"/>
        </c:if>

        <!-- Header -->
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
                                <span class='badge badge-warning' id='lblCartCount'>${countProduct}</span>
                            </a>
                            <c:if test="${sessionScope.role == null}">
                            <a href="login">
                                <svg width="20px" height="20px" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill="#555" d="M9.99296258,10.5729355 C12.478244,10.5729355 14.4929626,8.55821687 14.4929626,6.0729355 C14.4929626,3.58765413 12.478244,1.5729355 9.99296258,1.5729355 C7.5076812,1.5729355 5.49296258,3.58765413 5.49296258,6.0729355 C5.49296258,8.55821687 7.5076812,10.5729355 9.99296258,10.5729355 Z M10,0 C13.3137085,0 16,2.6862915 16,6 C16,8.20431134 14.8113051,10.1309881 13.0399615,11.173984 C16.7275333,12.2833441 19.4976819,15.3924771 19.9947005,19.2523727 C20.0418583,19.6186047 19.7690435,19.9519836 19.3853517,19.9969955 C19.0016598,20.0420074 18.6523872,19.7816071 18.6052294,19.4153751 C18.0656064,15.2246108 14.4363723,12.0699838 10.034634,12.0699838 C5.6099956,12.0699838 1.93381693,15.231487 1.39476476,19.4154211 C1.34758036,19.7816499 0.998288773,20.0420271 0.614600177,19.9969899 C0.230911582,19.9519526 -0.0418789616,19.6185555 0.00530544566,19.2523267 C0.500630192,15.4077896 3.28612316,12.3043229 6.97954305,11.1838052 C5.19718955,10.1447285 4,8.21217353 4,6 C4,2.6862915 6.6862915,0 10,0 Z"/>
                                  </svg>
                            </a>
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
        

        <!-- category -->
        <!-- <div class="container category">
            <div class="row">
                <c:forEach items="${listCategory}" var="category">
                    <div class="col-sm">
                        <a href="home?category=${category.categoryID}">
                            <div class="img">
                                <img src="${category.image}" class="card-img-top" alt="...">
                            </div>
                            <p class="txt">${category.name}</p>
                        </a>
                    </div>
                </c:forEach>
            </div>
          </div> -->

        <!-- !PAGE CONTENT! -->
        <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

            <!-- First Photo Grid-->
            <div class="w3-row-padding w3-padding-16 w3-center " id="food">
                <!-- <div class="product w3-center" id="food"></div> -->
                <c:forEach items="${data}" var="item" varStatus="loop">
                    <c:if test="${loop.index < 4}">
                        <div class="w3-quarter ">
                            <img src="${item.image}" alt="Sandwich" style="width:100%">
                            <div>
                                <h3>${item.name}</h3>
                                <c:if test="${item.description == ''}">
                                    <p style="margin-top: 0px;">No description</p>
                                </c:if>
                                <p style="margin-top: 0px;"> ${item.description}</p>
                            </div>
                            <p style="color: #ef4242; font-weight: 700; font-size: 25px; line-height: 100%; margin-bottom: 5px;">${item.price}.000 ₫</p>
                            <form action="addtocart" method="post">
                                <input name="productID" hidden value="${item.productID}"></input>
                                <input type="submit" name="add" value="Add to cart" class="btn btn-secondary">
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <!-- Second Photo Grid-->
            <div class="w3-row-padding w3-padding-16 w3-center">
                <c:forEach items="${data}" var="item" varStatus="loop">
                    <c:if test="${loop.index >= 4 && loop.index < 9}">
                        <div class="w3-quarter">
                            <img src="${item.image}" alt="Sandwich" style="width:100%">
                            <div>
                                <h3>${item.name}</h3>
                                <c:if test="${item.description == ''}">
                                    <p style="margin-top: 0px;">No description</p>
                                </c:if>
                                <p style="margin-top: 0px;"> ${item.description}</p>
                            </div>
                            <p style="color: #ef4242; font-weight: 700; font-size: 25px; line-height: 100%; margin-bottom: 5px;">${item.price}.000 ₫</p>
                            <form action="addtocart" method="post">
                                <input name="productID" hidden value="${item.productID}"></input>
                                <input type="submit" name="add" value="Add to cart" class="btn btn-secondary">
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <!-- Pagination -->
            <div class="w3-center w3-padding-32">
                <div class="w3-bar">
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
                    <a href="home?page=1" class="w3-bar-item w3-black w3-button">1</a>
                    <a href="home?page=2" class="w3-bar-item w3-button w3-hover-black">2</a>
                    <a href="home?page=3" class="w3-bar-item w3-button w3-hover-black">3</a>
                    <a href="home?page=4" class="w3-bar-item w3-button w3-hover-black">4</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
                </div>
            </div>

        <!-- End page content -->
        </div>

            <hr id="about">

            <!-- slide -->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="https://dscnnwjxnwl3f.cloudfront.net/media/banner/b/a/banner_web-01_2.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="	https://dscnnwjxnwl3f.cloudfront.net/media/banner/b/a/banner-dli-01_2.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="https://dscnnwjxnwl3f.cloudfront.net/media/banner/b/a/banner_web_vxmm-01_vx.jpg" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button style="padding: 0; opacity: 0;" class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev" >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </button>
                <button style="padding: 0; opacity: 0;"  class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </button>
              </div>
              
            <!-- Footer -->
            <footer class="footer " style="display: grid; padding: 0; margin-top: 0; background-color: #FFEAE3;">
                <div class="container" style="padding: 50px; display: block; max-width: fit-content;">
                    <div class="w3-third" style="width: inherit;" >
                        <h3 style="text-align: center;">ĐĂNG KÝ NHẬN THÔNG TIN KHUYẾN MÃI</h3>
                        <p style="text-align: center;">Đặc biệt hơn, NMD-Shop giao hàng MIỄN PHÍ khi bạn đặt hàng qua Website NMD-Shop hoặc gọi đến số 1900.1111.</p>
                    </div>
                </div>
                <div class="copyright" style="background-color: #FF9EA2; padding:0px; text-align: center; ">
                    <p style="margin-top: 15px;">© 2022 NMD-Shop All Rights Reserved Site by LDCC</p>
                    
                </div>
            </footer>

            

          

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
            }
        </script>

    </body>
</html>
