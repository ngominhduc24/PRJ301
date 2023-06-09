<%-- 
    Document   : orderlist
    Created on : Jun 9, 2023, 8:51:58 AM
    Author     : ASUS PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

            .inline {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="card content-product">
            <div class="card-header" style="background-color: #FF9EA2;">
                <h2 style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">Change password</h2>
            </div>
            <form action="changepassword" method="post">
                <div class="orderlist" style="padding: 15px 20px;">
                    <div class="form-group first inline">
                        <div class="form-inline" style="margin-right: 15px;">
                            <label for="username">Old Password</label> 
                            <input type="text" name="old_Password" class="form-control" id="name" value="" style="width: 100%;  margin-top: 5px;">
                        </div>  
                    </div>
                    <div class="form-group first inline">
                        <div class="form-inline" style="margin-right: 15px;">
                            <label for="username">New Password</label> 
                            <input type="text" name="new_password" class="form-control" id="name" value="" style="width: 100%;  margin-top: 5px;">
                        </div>
                        <div class="form-inline" style="margin-left: 15px;">
                            <label for="username">Confirm New Password</label>
                            <input type="text" name="cf_new_password" class="form-control" id="phone" value="" style="width: 100%; margin-top: 5px;">
                        </div>
                    </div>
                    <c:if test="${cookie.successpass != null}">
                        <p style="color: rgb(3, 219, 39)" >Change password successfully!</p>
                    </c:if>
                    <c:if test="${cookie.errorpass != null}">
                        <p style="color: rgb(255, 0, 0)">Old password is incorrect!</p>
                    </c:if>
                    <c:if test="${cookie.cferror != null}">
                        <p style="color: rgb(255, 0, 0)">New password and confirm new password are not match!</p>
                    </c:if>
                    <div class="form-group first"></div>
                    <input style="background-color: #ff5b6a; border: #ff5b6a; margin-top: 30px;" type="submit" value="Save" class="btn btn-pill text-white btn-block btn-primary">
                </div>
            </form>
        </div>
    </body>
</html>
