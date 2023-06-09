<%-- 
    Document   : orderlist
    Created on : Jun 9, 2023, 8:51:58 AM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/styles/account.css"
            />
        <style>
            html {
                /* zoom: 0.9; */
                /* Giảm kích thước phần tử xuống 80% */
            }

            .orderlist p,
            h5 {
                margin-bottom: 5px ;
            }

            .menu h6 {
                margin-top: 17px;
            }

            .text p {
                display: inline;
            }

            .total {
                justify-content: flex-end;
            }
            .text .right {
                margin-left: 50px;
            }


        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="card content-product">
            <div class="card-header" style="background-color: #FF9EA2;">
                <h2 style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">Contact information</h2>
            </div>
            <form action="#">
            <div class="orderlist" style="padding: 15px 20px;">
                <div class="form-group first">
                    <label for="username">Your Email</label>
                    <input type="text" name="email" class="form-control" id="email" value="">
                </div>
                <div class="form-group first">
                    <label for="username">Your Name</label>
                    <input type="text" name="name" class="form-control" id="name" value="">
                </div>
                <div class="form-group first">
                    <label for="username">Your Phone</label>
                    <input type="text" name="phone" class="form-control" id="phone" value="">
                </div>
                <div class="form-group first">
                    <label for="username">Your Address</label>
                    <input type="text" name="address" class="form-control" id="address" value="">
                </div>
                <input style="background-color: #ff5b6a; border: #ff5b6a; margin-top: 30px;" type="submit" value="Save" class="btn btn-pill text-white btn-block btn-primary">
            </form>
            </div>
        </div>
    </div>
    </body>
</html>
