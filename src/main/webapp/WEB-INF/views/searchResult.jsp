<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 30-Aug-21
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Elite Shoppy an Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Single ::
        w3layouts</title>
    <!--/tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Elite Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //tags -->
    <link href="<%= request.getContextPath() %>/static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="<%= request.getContextPath() %>/static/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="<%= request.getContextPath() %>/static/css/font-awesome.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/static/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link href="<%= request.getContextPath() %>/static/css/flexslider.css" rel="stylesheet" type="text/css"
          media="screen"/>
    <link href="<%= request.getContextPath() %>/static/css/jquery-ui.css" rel="stylesheet" type="text/css"/>

    <!-- //for bootstrap working -->
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"/>"
          rel="stylesheet"/>
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic"/>"
          rel='stylesheet' type='text/css'/>
</head>
<style>
    .pagination {
        display: inline-block;
    }

    .pagination a, p {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }

    .pagination a.active {
        background-color: #2fdab8;
        color: white;
        border-radius: 5px;
    }

    .pagination a:hover:not(.active) {
        background-color: #ddd;
        border-radius: 5px;
    }
</style>
<body>
<!-- header -->
<div class="header" id="home">
    <div class="container">
        <ul>
            <li><a href="" data-toggle="modal" data-target="#myModal"><i class="fa fa-unlock-alt"
                                                                         aria-hidden="true"></i> Sign In </a></li>
            <li><a href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil-square-o"
                                                                           aria-hidden="true"></i> Sign Up </a></li>
            <li><i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898</li>
            <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a
                    href="mailto:info@example.com">info@example.com</a></li>
        </ul>
    </div>
</div>
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <div class="col-md-4 header-middle">
            <form action="/search/product/default" method="get">
                <input type="search" name="keySearch" placeholder="Search here..." required="">
                <input type="hidden" name="pageIndex" required="" value="1">
                <input type="hidden" name="size" required="" value="5">
                <input type="submit" value=" ">
                <div class="clearfix"></div>
            </form>
        </div>
        <!-- header-bot -->
        <div class="col-md-4 logo_agile">
            <h1><a href="/"><span>E</span>lite Shoppy <i class="fa fa-shopping-bag top_logo_agile_bag"
                                                         aria-hidden="true"></i></a></h1>
        </div>
        <!-- header-bot -->
        <div class="col-md-4 agileits-social top_content">
            <ul class="social-nav model-3d-0 footer-social w3_agile_social">
                <li class="share">Share On :</li>
                <li><a href="#" class="facebook">
                    <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                </a></li>
                <li><a href="#" class="twitter">
                    <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                </a></li>
                <li><a href="#" class="instagram">
                    <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                </a></li>
                <li><a href="#" class="pinterest">
                    <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                </a></li>
            </ul>


        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //header-bot -->
<!-- banner -->
<div class="ban-top">
    <div class="container">
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav menu__list">
                            <li class="active menu__item menu__item--current"><a class="menu__link" href="/">Home
                                <span class="sr-only">(current)</span></a></li>
                            <li class=" menu__item"><a class="menu__link" href="about.html">About</a></li>
                            <li class="dropdown menu__item">
                                <a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">Men's wear <span class="caret"></span></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-6 multi-gd-img1 multi-gd-text ">
                                            <a href="mens.htm"><img
                                                    src="<c:url value="/static/images/top2.jpg"/>"
                                                    alt=" "/></a>
                                        </div>
                                        <div class="col-sm-3 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li><a href="/search/category/default/men/clothing?pageIndex=1&size=7">Clothing</a>
                                                </li>
                                                <li><a href="/search/category/default/men/wallets?pageIndex=1&size=7">Wallets</a>
                                                </li>
                                                <li><a href="/search/category/default/men/footwear?pageIndex=1&size=7">Footwear</a>
                                                </li>
                                                <li><a href="/search/category/default/men/watches?pageIndex=1&size=7">Watches</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/accessories?pageIndex=1&size=7">Accessories</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/bag?pageIndex=1&size=7">Bags</a>
                                                </li>
                                                <li><a href="/search/category/default/men/caps&hats?pageIndex=1&size=7">Caps
                                                    & Hats</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li><a href="/search/category/default/men/jewellery?pageIndex=1&size=7">Jewellery</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/sunglasses?pageIndex=1&size=7">Sunglasses</a>
                                                </li>
                                                <li><a href="/search/category/default/men/perfumes?pageIndex=1&size=7">Perfumes</a>
                                                </li>
                                                <li><a href="/search/category/default/men/beauty?pageIndex=1&size=7">Beauty</a>
                                                </li>
                                                <li><a href="/search/category/default/men/shirts?pageIndex=1&size=7">Shirts</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/sunglasses?pageIndex=1&size=7">Sunglasses</a>
                                                </li>
                                                <li><a href="/search/category/default/men/swimwear?pageIndex=1&size=7">Swimwear</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown menu__item">
                                <a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">Women's wear <span
                                        class="caret"></span></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-3 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="/search/category/default/woman/swimwear?pageIndex=1&size=7">Clothing</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/wallets?pageIndex=1&size=7">Wallets</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/footwear?pageIndex=1&size=7">Footwear</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/watches?pageIndex=1&size=7">Watches</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/accessories?pageIndex=1&size=7">Accessories</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/bags?pageIndex=1&size=7">Bags</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/caps&hats?pageIndex=1&size=7">Caps
                                                        & Hats</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="/search/category/default/woman/jewellery?pageIndex=1&size=7">Jewellery</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/sunglasses?pageIndex=1&size=7">Sunglasses</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/perfumes?pageIndex=1&size=7">Perfumes</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/beauty?pageIndex=1&size=7">Beauty</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/shirts?pageIndex=1&size=7">Shirts</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/sunglasses?pageIndex=1&size=7">Sunglasses</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/swimwear?pageIndex=1&size=7">Swimwear</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-6 multi-gd-img multi-gd-text ">
                                            <a href="womens.html"><img src="<c:url value="/static/images/top1.jpg"/>"
                                                                       alt=" "/></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
<%--                            <li class="menu__item dropdown">--%>
<%--                                <a class="menu__link dropdown-toggle" href="#" data-toggle="dropdown">Short--%>
<%--                                    Codes <b class="caret"></b></a>--%>
<%--                                <ul class="dropdown-menu agile_short_dropdown">--%>
<%--                                    <li><a href="icons.html">Web Icons</a></li>--%>
<%--                                    <li><a href="typography.html">Typography</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
                            <li class=" menu__item "><a class="menu__link" href="/get/chat">Chat with us</a></li>
                            <li class=" menu__item "><a class="menu__link" href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="top_nav_right">
            <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                <button class="w3view-cart" type="submit" name="submit" value="" data-toggle="modal"
                        data-target="#myModal">
                    <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                </button>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //banner-top -->
<!-- Modal1 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="col-md-8 modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">Sign In <span>Now</span></h3>
                    <form:form action="/auth/signIn" method="post" modelAttribute="userSignIn">
                        <div class="styled-input agile-styled-input-top">
                            <form:input type="text" name="Username" required="" path="username"/>
                            <label>Username</label>
                            <span></span>
                        </div>
                        <div class="styled-input">
                            <form:input type="password" name="Email" required="" path="password"/>
                            <label>Password</label>
                            <span></span>
                        </div>
                        <div>
                            <p style="color: red">${errorSignIn}</p>
                        </div>
                        <form:button>Sign In</form:button>
                    </form:form>
                    <ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
                        <li><a href="#" class="facebook">
                            <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                        </a></li>
                        <li><a href="#" class="twitter">
                            <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                        </a></li>
                        <li><a href="#" class="instagram">
                            <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                        </a></li>
                        <li><a href="#" class="pinterest">
                            <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                        </a></li>
                    </ul>
                    <div class="clearfix"></div>
                    <p><a href="#" data-toggle="modal" data-target="#myModal2"> Don't have an account?</a></p>

                </div>
                <div class="col-md-4 modal_body_right modal_body_right1">
                    <img src="/static/images/log_pic.jpg" alt=" "/>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<!-- //Modal1 -->
<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="col-md-8 modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">Sign Up <span>Now</span></h3>
                    <form:form action="/auth/register" method="post" modelAttribute="user">
                        <div class="styled-input agile-styled-input-top">
                            <form:input type="text" name="Username" required="" path="username"
                                        value="${againUser.username}"/>
                            <label>Name</label>
                            <span></span>
                        </div>
                        <div>
                            <p style="color: red">${errorUsername}</p>
                        </div>
                        <div>
                            <p style="color: red">${existUsername}</p>
                        </div>
                        <div class="styled-input">
                            <form:input type="email" name="Email" required="" path="email" value="${againUser.email}"/>
                            <label>Email</label>
                            <span></span>
                        </div>
                        <div>
                            <p style="color: red">${errorEmail}</p>
                        </div>
                        <div>
                            <p style="color: red">${existEmail}</p>
                        </div>
                        <div class="styled-input">
                            <form:input type="text" name="password" required="" path="phone"
                                        value="${againUser.phone}"/>
                            <label>Phone number</label>
                            <span></span>
                        </div>
                        <div>
                            <p style="color: red">${errorPhone}</p>
                        </div>
                        <form:button>Submit</form:button>
                    </form:form>
                    <ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
                        <li><a href="#" class="facebook">
                            <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                        </a></li>
                        <li><a href="#" class="twitter">
                            <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                        </a></li>
                        <li><a href="#" class="instagram">
                            <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                        </a></li>
                        <li><a href="#" class="pinterest">
                            <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                        </a></li>
                    </ul>
                    <div class="clearfix"></div>
                    <p><a href="#">By clicking register, I agree to your terms</a></p>

                </div>
                <div class="col-md-4 modal_body_right modal_body_right1">
                    <img src="/static/images/log_pic.jpg" alt=" "/>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<%
    session.removeAttribute("againUser");
    session.removeAttribute("errorUsername");
    session.removeAttribute("errorEmail");
    session.removeAttribute("errorPhone");
    session.removeAttribute("existUsername");
    session.removeAttribute("existEmail");
%>
<!-- //Modal2 -->

<%--Modal3--%>
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="col-md-8 modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">Notification <span>Now</span></h3>
                    <h4>Sign up successful</h4><br>
                    <h5>Please check your email to get password and verify!</h5>
                    <br>
                    <a href="https://mail.google.com/mail/u/0/#inbox" class="close" data-dismiss="modal"
                       style="justify-items: center">Ok</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<%--//Model3--%>
<!--/single_page-->
<!-- /banner_bottom_agile_info -->
<div class="page-head_agile_info_w3l">
    <div class="container">
        <h3>Search <span>Product </span></h3>
        <!--/w3_short-->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">

                <ul class="w3_short">
                    <li><a href="/">Home</a><i>|</i></li>
                    <li>Search Product</li>
                </ul>
            </div>
        </div>
        <!--//w3_short-->
    </div>
</div>

<!-- banner-bootom-w3-agileits -->
<div>
    <h3>Search result for: ${keySearch}</h3>
</div>
<div class="banner-bootom-w3-agileits">
    <div class="container">
        <div class="col-md-4 products-left">
            <div class="filter-price">
                <h3>Filter By <span>Price</span></h3>
                <ul class="dropdown-menu6">
                    <li>
                        <div type="slider" id="slider-range"></div>
                        <input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;"/>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-8 products-right">
            <div style="display: flex;flex-direction:  row">
                <h5>Product <span>Compare(${totalProd})</span></h5>
                <div style="margin-left: 350px">
                    <button onclick="filterProd()">Apply</button>
                </div>
            </div>
            <div class="sort-grid">
                <div class="sorting">
                    <h6>Sort By</h6>
                    <select id="country1" onchange="change_country(this.value)" class="frm-field required sect" >
                        <option value="default">Default</option>
                        <option value="nameAsc">Name(A - Z)</option>
                        <option value="nameDesc">Name(Z - A)</option>
                        <option value="priceDesc">Price(High - Low)</option>
                        <option value="priceAsc">Price(Low - High)</option>
                    </select>
                    <div class="clearfix"></div>
                </div>
                <div class="sorting">
                    <h6>Showing</h6>
                    <select id="country2" onchange="change_country(this.value)" class="frm-field required sect" >
                        <option value="7">7</option>
                        <option value="14">14</option>
                        <option value="28">28</option>
                        <option value="35">35</option>
                    </select>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="single-pro">
            <c:forEach items="${list}" var="menProd">
                <div class="col-md-3 product-men">
                    <div class="men-pro-item simpleCart_shelfItem">
                        <div class="men-thumb-item">
                            <img src="/static/images/m1.jpg" alt="" class="pro-image-front">
                            <img src="/static/images/m1.jpg" alt="" class="pro-image-back">
                            <div class="men-cart-pro">
                                <div class="inner-men-cart-pro">
                                    <a href="/show/product?id=${menProd.id}" class="link-product-add-cart">Quick
                                        View</a>
                                </div>
                            </div>
                            <span class="product-new-top">New</span>

                        </div>
                        <div class="item-info-product ">
                            <h4><a href="single.html">${menProd.name}</a></h4>
                            <div class="info-product-price">
                                <span class="item_price">$${menProd.price}</span>
                                <del>$69.71</del>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                                <input type="submit" data-toggle="modal" data-target="#myModal" name="submit" value="Add to cart" class="button"/>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
        </div>
    </div>
    <div id="page" class="pagination"
         style="border-color: red;border-width: 3px; display: flex;justify-content: center"></div>
    <div id="totalPage" hidden>${totalPage}</div>
</div>
<div class="footer">
    <div class="footer_agile_inner_info_w3l">
        <div class="col-md-3 footer-left">
            <h2><a href="/"><span>E</span>lite Shoppy </a></h2>
            <p>Lorem ipsum quia dolor
                sit amet, consectetur, adipisci velit, sed quia non
                numquam eius modi tempora.</p>
            <ul class="social-nav model-3d-0 footer-social w3_agile_social two">
                <li><a href="#" class="facebook">
                    <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                </a></li>
                <li><a href="#" class="twitter">
                    <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                </a></li>
                <li><a href="#" class="instagram">
                    <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                </a></li>
                <li><a href="#" class="pinterest">
                    <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                    <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                </a></li>
            </ul>
        </div>
        <div class="col-md-9 footer-right">
            <div class="sign-grds">
                <div class="col-md-4 sign-gd">
                    <h4>Our <span>Information</span></h4>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="mens.html">Men's Wear</a></li>
                        <li><a href="womens.html">Women's wear</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="typography.html">Short Codes</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>

                <div class="col-md-5 sign-gd-two">
                    <h4>Store <span>Information</span></h4>
                    <div class="w3-address">
                        <div class="w3-address-grid">
                            <div class="w3-address-left">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                            </div>
                            <div class="w3-address-right">
                                <h6>Phone Number</h6>
                                <p>+1 234 567 8901</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="w3-address-grid">
                            <div class="w3-address-left">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </div>
                            <div class="w3-address-right">
                                <h6>Email Address</h6>
                                <p>Email :<a href="mailto:example@email.com"> mail@example.com</a></p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="w3-address-grid">
                            <div class="w3-address-left">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                            </div>
                            <div class="w3-address-right">
                                <h6>Location</h6>
                                <p>Broome St, NY 10002,California, USA.

                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 sign-gd flickr-post">
                    <h4>Flickr <span>Posts</span></h4>
                    <ul>
                        <li><a href="single.html"><img src="/static/images/t1.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t2.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t3.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t4.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t1.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t2.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t3.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t2.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                        <li><a href="single.html"><img src="/static/images/t4.jpg" alt=" " class="img-responsive"/></a>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="agile_newsletter_footer">
            <div class="col-sm-6 newsleft">
                <h3>SIGN UP FOR NEWSLETTER !</h3>
            </div>
            <div class="col-sm-6 newsright">
                <form action="#" method="post">
                    <input type="email" placeholder="Enter your email..." name="email" required="">
                    <input type="submit" value="Submit">
                </form>
            </div>

            <div class="clearfix"></div>
        </div>
        <p class="copy-right">&copy 2017 Elite shoppy. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a>
        </p>
    </div>
</div>

</body>
<!-- js -->
<script type="text/javascript" src="/static/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="/static/js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider3").responsiveSlides({
            auto: true,
            pager: true,
            nav: false,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });
    });
</script>
<script src="/static/js/modernizr.custom.js"></script>
<!-- Custom-JavaScript-File-Links -->
<!-- cart-js -->
<script src="/static/js/minicart.min.js"></script>
<%--<script>--%>
<%--    // Mini Cart--%>
<%--    paypal.minicart.render({--%>
<%--        action: '#'--%>
<%--    });--%>

<%--    if (~window.location.search.indexOf('reset=true')) {--%>
<%--        paypal.minicart.reset();--%>
<%--    }--%>
<%--</script>--%>

<!-- //cart-js -->
<!---->
<script type='text/javascript'>//<![CDATA[
$(window).load(function () {
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: 9000,
        values: [1000, 7000],
        slide: function (event, ui) {
            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

});//]]>

</script>
<script type="text/javascript" src="/static/js/jquery-ui.js"></script>
<!---->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/static/js/move-top.js"></script>
<script type="text/javascript" src="/static/js/jquery.easing.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
        });
    });
</script>
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<!-- //here ends scrolling icon -->

<!-- for bootstrap working -->
<script type="text/javascript" src="/static/js/bootstrap.js"></script>

<script>
    var Msg = "<%=session.getAttribute("signUpSuccess")%>";
    if (Msg == "true") {
        // function alertName() {
        //     $('#myModal3').modal("show");
        $(window).on('load', function () {
            $('#myModal3').modal('toggle');
            <%session.removeAttribute("signUpSuccess"); %>
        });

    }
</script>
<script>
    var Msg = "<%=session.getAttribute("errorSignUp")%>";
    if (Msg == "true") {
        // function alertName() {
        //     $('#myModal3').modal("show");
        $(window).on('load', function () {
            $('#myModal2').modal('toggle');
            <%session.removeAttribute("errorSignUp"); %>
        });

    }
</script>
<script>
    var Msg = "<%=session.getAttribute("errorSignIn")%>";
    if (Msg != "null") {
        $(window).on('load', function () {
            $('#myModal').modal('toggle');
            <%session.removeAttribute("errorSignIn"); %>
        });

    }
</script>
<script>
    let start = ${currentIndex};
    let limit = 1;
    let totalcount = document.getElementById("totalPage").textContent;

    function rebuildPagination(currentPage, totalcount) {

        let HTML = "";

        // If there are only 6 pages or less in total, just display all pages without "..."
        if (totalcount <= 6) {
            for (let i = 1; i <= totalcount; i++) {
                HTML += addButton(i, currentPage);
            }
        }
        // ELSE display with ...
        else {

            // Always print first page button
            HTML += addButton("1", currentPage);

            // Print "..." if currentPage is > 3
            if (currentPage > 3) {
                HTML += "<p >...</p>";
            }

            // special case where last page is selected...
            // Without this special case, only 2 buttons would be shown after ... if you were on last page
            if (currentPage == totalcount) {
                HTML += addButton(currentPage - 2, currentPage);
            }


            // Print previous number button if currentPage > 2
            if (currentPage > 2) {
                HTML += addButton(currentPage - 1, currentPage);
            }

            //Print current page number button as long as it not the first or last page
            if (currentPage != 1 && currentPage != totalcount) {
                HTML += addButton(currentPage, currentPage);
            }

            //print next page number button if currentPage < lastPage - 1
            if (currentPage < totalcount - 1) {
                HTML += addButton(currentPage + 1, currentPage);
            }

            // special case where first page is selected...
            // Without this special case, only 2 buttons would be shown before ... if you were on first page
            if (currentPage == 1) {
                HTML += addButton(currentPage + 2, currentPage);
            }

            //print "..." if currentPage is < lastPage -2
            if (currentPage < totalcount - 2) {
                HTML += " <p >...</p>";
            }

            //Always print last page button if there is more than 1 page
            if (totalcount > 1) {
                HTML += addButton(totalcount, currentPage);
            }
        }
        //
        // HTML variable contains all the above buttons,
        //
        document.getElementById("page").innerHTML = HTML;
    }

    //
    // We are going to create a button, the HTML is a string that is returned
    //
    function addButton(number, currentPage) {
        let HTML = "<a href='/search/product/${sort}?keySearch=${keySearch}&pageIndex=" + number + "&size=${size}'";

        //
        // If we are creating a button that is current page, then add yellow style
        //
        if (number == currentPage) {
            HTML += "  class='active' ";
        }

        //Add click event
        // HTML += " onclick=\"handlevent(" + number + ")\">";

        // Add button number
        HTML += ">" + number;

        // add closing button
        HTML += "</a>";

        // return string
        return HTML;
    }


    rebuildPagination(start, totalcount);

    //var i;
    //var text = "";
    //for (i = 1; i <= 12; i++) {
    //  text += "<button  onclick=\"handlevent(" + i + ")\">" + (i) + "</button>";
    //}
    //document.getElementById("page").innerHTML = text;

    function changePage(prev, dotted, next) {
        if (prev) {
            if (start > 1) {
                start--;
                // We have changed the start page, total rebuild the pagination
                rebuildPagination(start, totalcount);
            }
        }
        if (next) {
            if (start < totalcount) {
                start++;
                // We have changed the start page, total rebuild the pagination
                rebuildPagination(start, totalcount);
            }
        }
    }


    //
    // When the user click on button 1,2,3,4,5,etc... we end up calling this function
    // Value is the page number and rechange start and rebuild the pagination
    //
    function handlevent(value) {
        start = value;
        rebuildPagination(start, totalcount);
    }
</script>
<script>
    function filterProd() {
        //location.replace("")
        let href="/search/product/" + document.getElementById("country1").value + "?keySearch=${keySearch}&pageIndex=1" + "&size=" + document.getElementById("country2").value;
        console.log(href);
        location.href = href;
    }
</script>
<script>
    $('#country1').find('option').each(function(i,e){
        if($(e).val() == "${sort}"){
            $('#country1').prop('selectedIndex',i);
        }
    });
    $('#country2').find('option').each(function(i,e){
        if($(e).val() == "${size}"){
            $('#country2').prop('selectedIndex',i);
        }
    });
</script>
</html>
