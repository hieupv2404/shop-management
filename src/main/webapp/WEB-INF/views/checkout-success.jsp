<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/29/2021
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <style>
        html, body, .wrapper {
            background: #f7f7f7;
        }

        .steps {
            margin-top: -41px;
            display: inline-block;
            float: right;
            font-size: 16px
        }

        .step {
            float: left;
            background: white;
            padding: 7px 13px;
            border-radius: 1px;
            text-align: center;
            width: 100px;
            position: relative
        }

        .step_line {
            margin: 0;
            width: 0;
            height: 0;
            border-left: 16px solid #fff;
            border-top: 16px solid transparent;
            border-bottom: 16px solid transparent;
            z-index: 1008;
            position: absolute;
            left: 99px;
            top: 1px
        }

        .step_line.backline {
            border-left: 20px solid #f7f7f7;
            border-top: 20px solid transparent;
            border-bottom: 20px solid transparent;
            z-index: 1006;
            position: absolute;
            left: 99px;
            top: -3px
        }

        .step_complete {
            background: #357ebd
        }

        .step_complete a.check-bc, .step_complete a.check-bc:hover, .afix-1, .afix-1:hover {
            color: #eee;
        }

        .step_line.step_complete {
            background: 0;
            border-left: 16px solid #357ebd
        }

        .step.check_step {
            margin-left: 5px;
        }

        .ch_pp {
            text-decoration: underline;
        }

        .ch_pp.sip {
            margin-left: 10px;
        }

        .check-bc,
        .check-bc:hover {
            color: #222;
        }

        .btn-xs {
            line-height: 28px;
        }

        /*login form*/
        .login-container {
            margin-top: 30px;
        }

        .login-container input[type=submit] {
            width: 100%;
            display: block;
            margin-bottom: 10px;
            position: relative;
        }

        .login-container input[type=text], input[type=password] {
            height: 44px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 10px;
            -webkit-appearance: none;
            background: #fff;
            border: 1px solid #d9d9d9;
            border-top: 1px solid #c0c0c0;
            /* border-radius: 2px; */
            padding: 0 8px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }

        .login-container input[type=text]:hover, input[type=password]:hover {
            border: 1px solid #b9b9b9;
            border-top: 1px solid #a0a0a0;
            -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .login-container-submit {
            /* border: 1px solid #3079ed; */
            border: 0px;
            color: #fff;
            text-shadow: 0 1px rgba(0, 0, 0, 0.1);
            background-color: #357ebd; /*#4d90fe;*/
            padding: 17px 0px;
            font-family: roboto;
            font-size: 14px;
            /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
        }

        .login-container-submit:hover {
            /* border: 1px solid #2f5bb7; */
            border: 0px;
            text-shadow: 0 1px rgba(0, 0, 0, 0.3);
            background-color: #357ae8;
            /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
        }

        .login-help {
            font-size: 12px;
        }


        /* images*/
        ol, ul {
            list-style: none;
        }

        .hand {
            cursor: pointer;
            cursor: pointer;
        }

        .cards {
            padding-left: 0;
        }

        .cards li {
            -webkit-transition: all .2s;
            -moz-transition: all .2s;
            -ms-transition: all .2s;
            -o-transition: all .2s;
            transition: all .2s;
            background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
            background-position: 0 0;
            float: left;
            height: 32px;
            margin-right: 8px;
            text-indent: -9999px;
            width: 51px;
        }

        .cards .mastercard {
            background-position: -51px 0;
        }

        .cards li {
            -webkit-transition: all .2s;
            -moz-transition: all .2s;
            -ms-transition: all .2s;
            -o-transition: all .2s;
            transition: all .2s;
            background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
            background-position: 0 0;
            float: left;
            height: 32px;
            margin-right: 8px;
            text-indent: -9999px;
            width: 51px;
        }

        .cards .amex {
            background-position: -102px 0;
        }

        .cards li {
            -webkit-transition: all .2s;
            -moz-transition: all .2s;
            -ms-transition: all .2s;
            -o-transition: all .2s;
            transition: all .2s;
            background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
            background-position: 0 0;
            float: left;
            height: 32px;
            margin-right: 8px;
            text-indent: -9999px;
            width: 51px;
        }

        .cards li:last-child {
            margin-right: 0;
        }

        /* images end */


        /*
         * BOOTSTRAP
         */
        .container {
            border: none;
        }

        .panel-footer {
            background: #fff;
        }

        .btn {
            border-radius: 1px;
        }

        .btn-sm, .btn-group-sm > .btn {
            border-radius: 1px;
        }

        .input-sm, .form-horizontal .form-group-sm .form-control {
            border-radius: 1px;
        }

        .panel-info {
            border-color: #999;
        }

        .panel-heading {
            border-top-left-radius: 1px;
            border-top-right-radius: 1px;
        }

        .panel {
            border-radius: 1px;
        }

        .panel-info > .panel-heading {
            color: #eee;
            border-color: #999;
        }

        .panel-info > .panel-heading {
            background-image: linear-gradient(to bottom, #555 0px, #888 100%);
        }


        .panel-footer {
            border-bottom-left-radius: 1px;
            border-bottom-right-radius: 1px;
            border-top: 1px solid #999;
        }

        .btn-link {
            color: #888;
        }

        hr {
            margin-bottom: 10px;
            margin-top: 10px;
        }

        /** MEDIA QUERIES **/
        @media only screen and (max-width: 989px) {
            .span1 {
                margin-bottom: 15px;
                clear: both;
            }
        }

        @media only screen and (max-width: 764px) {
            .inverse-1 {
                float: right;
            }
        }

        @media only screen and (max-width: 586px) {
            .cart-titles {
                display: none;
            }

            .panel {
                margin-bottom: 1px;
            }
        }

        .form-control {
            border-radius: 1px;
        }

        @media only screen and (max-width: 486px) {
            .col-xss-12 {
                width: 100%;
            }

            .cart-img-show {
                display: none;
            }

            .btn-submit-fix {
                width: 100%;
            }

        }

    </style>
</head>
<body>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container wrapper">
    <div class="row cart-head">
        <div class="container">
            <div class="row">
                <p></p>
            </div>
            <div class="row">
                <p></p>
            </div>
        </div>
    </div>
    <div class="row cart-body">
        <h3 style="text-align: center; color: #3c763d" >You have successfully placed your order</h3>
        <h4 style="padding-left: 17px">Payment invoice details </h4>
        <div class="form-horizontal">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                <!--REVIEW ORDER-->
                <div class="panel panel-info">
                    <div class="panel-heading"><h4 style="color: white">product information</h4></div>
                    <div class="panel-body">
                        <c:forEach items="${listOrderDetail}" var="orderDetail">
                            <div class="form-group">
                                <div class="col-sm-3 col-xs-3">
                                    <img src="/static/images/m1.jpg" alt="" class="pro-image-front" width="120" height="70" alt="" id="image">
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="col-xs-12"><small>Name: </small>${orderDetail.product.name}</div>
                                    <div class="col-xs-12"><small>Quantity: <span>${orderDetail.quantity}</span></small>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-xs-3 text-right">
                                    <small>Total: </small>${orderDetail.total}$
                                </div>
                            </div>
                        </c:forEach>
                        <hr/>
                        <div class="form-group m-0">
                            <div class="col-xs-12">
                                <strong>Order Total</strong>
                                <div class="pull-right"><span>${order.totalPrice}$</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--REVIEW ORDER END-->
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                <!--SHIPPING METHOD-->

                    <div class="panel panel-info">
                        <div class="panel-heading"><h4 style="color: white">User information</h4></div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-6 col-xs-12">
                                    <strong>First Name:</strong>
<%--                                    <input type="text" name="firstName" class="form-control" readonly value="${user.firstName}"/>--%>
                                    <p>${order.firstName}</p>
                                </div>
                                <div class="span1"></div>
                                <div class="col-md-6 col-xs-12">
                                    <strong>Last Name:</strong>
<%--                                    <input type="text" name="lastName" class="form-control" readonly value="${user.lastName}"/>--%>
                                    <p>${order.lastName}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Address:</strong></div>
                                <div class="col-md-12">
<%--                                    <input type="text" name="address" class="form-control" readonly value="${user.address}"/>--%>
                                    <p>${order.address}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Phone Number:</strong></div>
                                <div class="col-md-12">
<%--                                    <input type="text" name="phone" class="form-control" readonly value="${user.phone}"/>--%>
                                <p>${order.phone}</p>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </div>
    <a href="/"><button>Continue to buy</button></a>
</div>
</body>
</html>


