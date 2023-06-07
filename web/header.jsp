<%-- 
    Document   : header
    Created on : Jun 7, 2023, 11:58:18 AM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link
        rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/styles/home.css"
        />
        <title>JSP Page</title>
    </head>
    <body>
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
                                <span class='badge badge-warning' id='lblCartCount' style="border-radius: 60rem;">${countProduct}</span>
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
    </body>
</html>
