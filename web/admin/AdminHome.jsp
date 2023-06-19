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
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
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

            .row-product {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-evenly;
            }
    
            .session-product {
                border: 1px;
                box-shadow: 0px 0px 2px 0px #533939;
                background: white;
                padding: 10px;
                border-radius: 10px;
                width: 265px;
                height: 340px;
            }

            .price-addtocart {
                position: relative;
                bottom: -5px;
            }

            .price-addtocart .text{
                font-family: Roboto,Arial,sans-serif;
                color: #ff5b6a; 
                font-weight: 700; 
                font-size: 25px; 
                line-height: 100%;
                 margin-bottom: 5px;
            }

            .btn-addtocart{
                background: #ff5b6a;
                border-color: #ff5b6a;
                margin-top: 10px;
                width: 100%;
                color: white;
            }
        </style>
    </head>
    <body style="background-color: #FFEAE3;">
        <!-- code -->
        <c:if test="${param.logout != null }">
                <c:remove var="role" scope="session"/>
        </c:if>

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
            <div class="w3-row-padding w3-padding-16 w3-center row-product" id="food">
                <!-- <div class="product w3-center" id="food"></div> -->
                <c:forEach items="${data}" var="item" varStatus="loop">
                    <c:if test="${loop.index < 4}">
                        <div class="w3-quarter session-product">
                            <img class="img" src="${item.image}" alt="Sandwich" style="width:100%">
                            <div>
                                <h3>${item.name}</h3>
                                <c:if test="${item.description == ''}">
                                    <p style="margin-top: 0px;">No description</p>
                                </c:if>
                                <p style="margin-top: 0px;"> ${item.description}</p>
                            </div>
                            <div class="price-addtocart">
                                <p class="text" >${item.price}.000 ₫</p>
                                <form action="addtocart" method="post">
                                    <input name="productID" hidden value="${item.productID}"></input>
                                    <input type="submit" name="add" value="Add to cart" class="btn btn-addtocart">
                                </form>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <!-- Second Photo Grid-->
            <div class="w3-row-padding w3-padding-16 w3-center row-product" id="food">
                <!-- <div class="product w3-center" id="food"></div> -->
                <c:forEach items="${data}" var="item" varStatus="loop">
                    <c:if test="${loop.index >= 4 && loop.index < 9}">
                        <div class="w3-quarter session-product">
                            <img class="img" src="${item.image}" alt="Sandwich" style="width:100%">
                            <div>
                                <h3>${item.name}</h3>
                                <c:if test="${item.description == ''}">
                                    <p style="margin-top: 0px;">No description</p>
                                </c:if>
                                <p style="margin-top: 0px;"> ${item.description}</p>
                            </div>
                            <div class="price-addtocart">
                                <p class="text">${item.price}.000 ₫</p>
                                <form action="addtocart" method="post">
                                    <input name="productID" hidden value="${item.productID}"></input>
                                    <input type="submit" name="add" value="Add to cart" class="btn btn-addtocart">
                                    <input type="submit" name="delete" value="delete" class="btn btn-addtocart" style="background-color: red;">
                                </form>
                            </div>
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
                <div class="container" style="padding: 35px; display: block; max-width: fit-content;">
                    <div class="w3-third" style="width: inherit;" >
                        <h3 style="text-align: center;">ĐĂNG KÝ NHẬN THÔNG TIN KHUYẾN MÃI</h3>
                        <p style="text-align: center;">Đặc biệt hơn, NMD-Shop giao hàng MIỄN PHÍ khi bạn đặt hàng qua Website NMD-Shop hoặc gọi đến số 1900.1111.</p>
                    </div>
                </div>
                <div class="copyright" style="background-color: #FF9EA2; padding:0px; text-align: center; ">
                    <p style="margin-top: 15px; color: white;">© 2023 NMD-Shop All Rights Reserved Site by LDCC</p>
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

    </body>
</html>
