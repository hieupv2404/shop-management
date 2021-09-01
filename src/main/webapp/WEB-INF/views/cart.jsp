<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/28/2021
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="	https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="	https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
    <link rel="stylesheet"
          href="	https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="	https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <style>
        body {
            background-color: #eeeeee
        }

        .footer-background {
            background-color: rgb(204, 199, 199)
        }

        table thead tr th {
            padding-bottom: 20px;
        }

        table tbody tr td {
            border-bottom: 1px solid gray;
            padding: 5px 0;
        }

        @media (max-width: 991px) {
            #heading {
                padding-left: 50px
            }

            #prc {
                margin-left: 70px;
                padding-left: 110px
            }

            #quantity {
                padding-left: 48px
            }

            #produc {
                padding-left: 40px
            }

            #total {
                padding-left: 54px
            }
        }

        @media (max-width: 767px) {
            .mobile {
                font-size: 10px
            }

            h5 {
                font-size: 14px
            }

            h6 {
                font-size: 9px
            }

            #mobile-font {
                font-size: 11px
            }

            #prc {
                font-weight: 700;
                margin-left: -45px;
                padding-left: 105px
            }

            #quantity {
                font-weight: 700;
                padding-left: 6px
            }

            #produc {
                font-weight: 700;
                padding-left: 0px
            }

            #total {
                font-weight: 700;
                padding-left: 9px
            }

            #image {
                width: 60px;
                height: 60px
            }

            .col {
                width: 100%
            }

            #zero-pad {
                padding: 2%;
                margin-left: 10px
            }

            #footer-font {
                font-size: 12px
            }

            #heading {
                padding-top: 15px
            }
        }
    </style>
</head>
<body>

<div class="container bg-white rounded-top mt-5" id="zero-pad">
    <div class="row d-flex justify-content-center pt-4">
        <table style="width: 80%">
            <thead class="pb-4">
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cart}" var="item">
                <form action="/editCart" method="post">
                    <input type="hidden" name="cartId" value="${cart.id}">
                    <tr>
                        <td>
                            <div class="d-flex flex-row align-items-center">
                                <div>
                                    <img src="https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
                                         width="50" height="50" alt="" id="image"></div>
                                <div class="d-flex flex-column pl-md-3 pl-1">
                                    <div>
                                        <h6>${item.value.product.name}</h6>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>${item.value.product.price}$</td>
                        <td>
                            <form action="/editCart" method="post">
                                <button name="amount1" value="${item.value.quantity-1}">-</button>
                                <input style="width: 50px; text-align: center" name="amount" value="${item.value.quantity}">
                                <button name="amount1" value="${item.value.quantity+1}">+</button>
                            </form>

                        </td>
                        <td>${item.value.product.price*item.value.quantity}</td>
                        <td>
                            <a href="/deleteCart?productId=${item.value.product.id}" class="close">&times;</a>
                        </td>
                    </tr>
                </form>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="container bg-light rounded-bottom py-4">
    <div class="row d-flex justify-content-center">
        <div class="col-lg-10 col-12">
            <div class="d-flex justify-content-between align-items-center">
                    <div><a href="/">
                        <button class="btn btn-sm bg-light border border-dark">GO BACK</button>
                    </a></div>
                <div class="px-md-0 px-1" id="footer-font"><b class="pl-md-4">SUBTOTAL:<span
                        class="pl-md-4"><%--${total}$--%></span></b></div>
                <div><a href="/checkoutCart">
                    <button class="btn btn-sm bg-dark text-white px-lg-5 px-3">CHECKOUT</button>
                </a></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

