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

        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed fixed-top" style="height: 60px; " >
            <div class="container" > 
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <div class="navbar-nav mr-auto">
                        <!-- Image and text -->
                        <a class="navbar-brand" href="home">
                            <div style="display: flex;">
                                <a href="home">
                                    <img src="https://png.pngtree.com/element_our/png/20180917/food-logo-design.-knife-fork-and-spoon-logo.-png_98037.jpg" width="40px" height="40px" class="d-inline-block align-top" alt="">
                                </a>
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
                      <div style="margin-top: 10px;">
                        <c:if test="${sessionScope.role == null}">
                        <button type="button" id="btnlogin" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="background-color: #f8f9fa; padding: 6px; border: 0px;">
                            <svg width="20px" height="20px" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill="#555" d="M9.99296258,10.5729355 C12.478244,10.5729355 14.4929626,8.55821687 14.4929626,6.0729355 C14.4929626,3.58765413 12.478244,1.5729355 9.99296258,1.5729355 C7.5076812,1.5729355 5.49296258,3.58765413 5.49296258,6.0729355 C5.49296258,8.55821687 7.5076812,10.5729355 9.99296258,10.5729355 Z M10,0 C13.3137085,0 16,2.6862915 16,6 C16,8.20431134 14.8113051,10.1309881 13.0399615,11.173984 C16.7275333,12.2833441 19.4976819,15.3924771 19.9947005,19.2523727 C20.0418583,19.6186047 19.7690435,19.9519836 19.3853517,19.9969955 C19.0016598,20.0420074 18.6523872,19.7816071 18.6052294,19.4153751 C18.0656064,15.2246108 14.4363723,12.0699838 10.034634,12.0699838 C5.6099956,12.0699838 1.93381693,15.231487 1.39476476,19.4154211 C1.34758036,19.7816499 0.998288773,20.0420271 0.614600177,19.9969899 C0.230911582,19.9519526 -0.0418789616,19.6185555 0.00530544566,19.2523267 C0.500630192,15.4077896 3.28612316,12.3043229 6.97954305,11.1838052 C5.19718955,10.1447285 4,8.21217353 4,6 C4,2.6862915 6.6862915,0 10,0 Z"/>
                              </svg>
                        </button>
                    </c:if>
                        <c:if test="${sessionScope.role != null}">
                        <a href="account">
                            <svg width="30" height="30" viewBox="0 0 0.9 0.9" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.15.263A.037.037 0 0 1 .187.226h.525a.037.037 0 1 1 0 .075H.188A.037.037 0 0 1 .151.264zm0 .188A.037.037 0 0 1 .187.414h.525a.037.037 0 1 1 0 .075H.188A.037.037 0 0 1 .151.452zm0 .188A.037.037 0 0 1 .187.602h.525a.037.037 0 1 1 0 .075H.188A.037.037 0 0 1 .151.64z" fill="#0D0D0D"/></svg>
                          </a>
                    </c:if>
                      </div>
                    </div>
                </div>
            </nav>
    <!-- end header -->

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
                        <div class="w3-quarter session-product" style="height: 400px;">
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
                                    <input type="submit" name="add" value="Update" class="btn btn-addtocart">
                                    <a href="deleteproduct?pid=${item.productID}"><input type="button" name="delete" value="Delete" class="btn btn-addtocart"></a>
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
                        <div class="w3-quarter session-product" style="height: 400px;">
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
                                    <input type="submit" name="add" value="Update" class="btn btn-addtocart">
                                    <a href="deleteproduct?pid=${item.productID}"><input type="button" name="delete" value="Delete" class="btn btn-addtocart"></a>
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

            const deletemessage = "${deleteproductmessage}";
            if (deletemessage != "") {
                alert(deletemessage);
            }
        </script>

    </body>
</html>
