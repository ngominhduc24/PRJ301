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
            body,h1,h2,h3,h4,h5,h6 {
                font-family: "Karma", sans-serif
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
                                    <img src="https://getbootstrap.com/docs/4.6/assets/brand/bootstrap-solid.svg" width="40px" height="40px" class="d-inline-block align-top" alt="">
                                    <p style="margin-top: 10px; margin-left: 5px; font-family:'Courier New', Courier, monospace ">NMĐ-Shop</p> 
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
        <div class="container category">
            <div class="row">
                <c:forEach items="${listCategory}" var="category">
                    <div class="col-sm">
                        <a href="home?category=${category.categoryID}">
                            <div class="img">
                                <img src="${category.image}" class="card-img-top" alt="...">
                            </div>
                            <span class="txt">${category.name}</span>
                        </a>
                    </div>
                </c:forEach>
            </div>
          </div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

            <!-- First Photo Grid-->
            <div class="w3-row-padding w3-padding-16 w3-center" id="food">
                <c:forEach items="${data}" var="item" varStatus="loop">
                    <c:if test="${loop.index < 4}">
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
                                <input type="submit" name="add" value="Add to cart" class="w3-button w3-black w3-margin-bottom">
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
                                <input type="submit" name="add" value="Add to cart" class="w3-button w3-black w3-margin-bottom">
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

            <hr id="about">

            <!-- About Section -->
            <div class="w3-container w3-padding-32 w3-center">  
                <h3>About Me, The Food Man</h3><br>
                <img src="/w3images/chef.jpg" alt="Me" class="w3-image" style="display:block;margin:auto" width="800" height="533">
                <div class="w3-padding-32">
                    <h4><b>I am Who I Am!</b></h4>
                    <h6><i>With Passion For Real, Good Food</i></h6>
                    <p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                </div>
            </div>
            <hr>

            <!-- Footer -->
            <footer class="w3-row-padding w3-padding-32">
                <div class="w3-third">
                    <h3>FOOTER</h3>
                    <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                    <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
                </div>

                <div class="w3-third">
                    <h3>BLOG POSTS</h3>
                    <ul class="w3-ul w3-hoverable">
                        <li class="w3-padding-16">
                            <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
                            <span class="w3-large">Lorem</span><br>
                            <span>Sed mattis nunc</span>
                        </li>
                        <li class="w3-padding-16">
                            <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
                            <span class="w3-large">Ipsum</span><br>
                            <span>Praes tinci sed</span>
                        </li> 
                    </ul>
                </div>

                <div class="w3-third w3-serif">
                    <h3>POPULAR TAGS</h3>
                    <p>
                        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dinner</span>
                        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Salmon</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">France</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Drinks</span>
                        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Flavors</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Cuisine</span>
                        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Chicken</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dressing</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fried</span>
                        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fish</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Duck</span>
                    </p>
                </div>
            </footer>

            <!-- End page content -->
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
