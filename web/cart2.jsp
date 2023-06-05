<%-- 
    Document   : cart
    Created on : Feb 28, 2023, 2:59:05 PM
    Author     : choip
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Cosmetic Store</title>
        <link rel="stylesheet" href="./css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <body>

        <header>
            <div class="header-title">
                <h1>Cart</h1>
                <h5>All the selected products in your cart</h5>
            </div>
        </header>
        <section class="store">
            <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2">
                        <table class="table table-sm">
                            <tbody>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                        <th style="text-align:right">
                                            <a href="checkout" class="btn checkout-btn"><button type="button" class="btn btn_back "><i  class="fa fa-shopping-cart"></i>Purchase Order</button></a>
                                        </th>
                                </tr>
                                <tr>
                                    <td>
                                        <h6>product</h6>
                                    </td>
                                    <td>
                                        <h6>Quantity</h6>
                                    </td>
                                    <td>
                                        <h6>Price</h6>
                                    </td>
                                    <td>
                                        <h6>Action</h6>
                                    </td>
                                </tr>
                                <c:forEach var="p" items="${data}">
                                    <c:set var="total" value="${total + p.price*p.quantity}" />
                                <form action="updatecart">

                                    <tr>
                                        <td>${p.name}</td>
                                        <td><label><input
                                                    type="number"
                                                    min="1"
                                                    max="20"
                                                    name="quantity"
                                                    data-id="makeshop-common-cart-quantity:000000000642-0-0-0-0"
                                                    value="${p.quantity}"
                                                    name="item-quantity"
                                                    /></label></td>
                                        <td><fmt:formatNumber type="number" pattern="#,###" value=""/> ${p.price * p.quantity}.000 ₫</td>
                                        <!-- <td>
                                            <a href="deletecart?pid=${p.productID}" class="a_remove">
                                                <div type="button" class="badge bg-danger text-wrap " style="width: 5rem;">
                                                    <i class="fa fa-times"></i> Remove
                                                </div>
                                            </a>
                                        </td> -->
                                        <td>
                                            <a href="#" onclick="confirmDelete('${p.productID}');" class="a_remove">
                                                <div type="button" class="badge bg-danger text-wrap" style="width: 5rem;">
                                                    <i class="fa fa-times"></i> Remove
                                                </div>
                                            </a>
                                        </td>
                                        <td>
                                            <input type="hidden" name="pid" value="${p.productID}" />
                                            <button type="submit" class="badge bg-danger text-wrap" style="width: 5rem;background-color: #30bb30!important">
                                                    <i class="fa fa-times"></i> Update
                                                </button>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            <tr style="border-bottom: #fff">
                                <td></td>
                                <td></td>
                                <th>Grand total</th>
                                <th><fmt:formatNumber type="number" pattern="#,###" value=""/>${total}.000 ₫</th>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                <br>
                <c:if test="${sessionScope.cart == null}">
                    your cart is empty
                </c:if>
                <div class="">
                    <a href="home"><button type="button" class="btn btn_back "><i class="fa fa-arrow-alt-circle-left"></i> Continue Shopping</button></a>
                </div>

            </div>
        </div>
    </section>
</body>

<script>
    function confirmDelete(productID) {
        if (confirm("Are you sure you want to remove this item?")) {
            window.location.href = "deletecart?pid=" + productID;
        } else {
            return false;
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
</script>

</html>
