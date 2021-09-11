<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 27-Aug-21
  Time: 10:02 AM
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

    <!-- //for bootstrap working -->
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"/>"
          rel="stylesheet"/>
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic"/>"
          rel='stylesheet' type='text/css'/>
</head>
<style>
    .checked {
        color: #2fdab8;
    }

    .responsive-iframe {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 100%;
        border: none;
    }

    .container1 {
        position: relative;
        width: 100%;
        overflow: hidden;
        padding-top: 56.25%; /* 16:9 Aspect Ratio */
    }
</style>
<body>
<!-- header -->
<div class="header" id="home">
    <div class="container">
        <ul>
            <li><a href="/user/show/profile?id=${userId}"><i class="fa fa-unlock-alt" aria-hidden="true"></i> ${name}
            </a></li>
            <li><a href="/auth/logout"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Logout </a></li>
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
            <form action="/search/product/defautlt" method="get">
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
                                                <li><a href="/search/category/default/men/clothing?pageIndex=1&size=5">Clothing</a>
                                                </li>
                                                <li><a href="/search/category/default/men/wallets?pageIndex=1&size=5">Wallets</a>
                                                </li>
                                                <li><a href="/search/category/default/men/footwear?pageIndex=1&size=5">Footwear</a>
                                                </li>
                                                <li><a href="/search/category/default/men/watches?pageIndex=1&size=5">Watches</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/accessories?pageIndex=1&size=5">Accessories</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/bag?pageIndex=1&size=5">Bags</a>
                                                </li>
                                                <li><a href="/search/category/default/men/caps&hats?pageIndex=1&size=5">Caps
                                                    & Hats</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li><a href="/search/category/default/men/jewellery?pageIndex=1&size=5">Jewellery</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/sunglasses?pageIndex=1&size=5">Sunglasses</a>
                                                </li>
                                                <li><a href="/search/category/default/men/perfumes?pageIndex=1&size=5">Perfumes</a>
                                                </li>
                                                <li><a href="/search/category/default/men/beauty?pageIndex=1&size=5">Beauty</a>
                                                </li>
                                                <li><a href="/search/category/default/men/shirts?pageIndex=1&size=5">Shirts</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/men/sunglasses?pageIndex=1&size=5">Sunglasses</a>
                                                </li>
                                                <li><a href="/search/category/default/men/swimwear?pageIndex=1&size=5">Swimwear</a>
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
                                                    <a href="/search/category/default/woman/swimwear?pageIndex=1&size=5">Clothing</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/wallets?pageIndex=1&size=5">Wallets</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/footwear?pageIndex=1&size=5">Footwear</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/watches?pageIndex=1&size=5">Watches</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/accessories?pageIndex=1&size=5">Accessories</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/bags?pageIndex=1&size=5">Bags</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/caps&hats?pageIndex=1&size=5">Caps
                                                        & Hats</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="/search/category/default/woman/jewellery?pageIndex=1&size=5">Jewellery</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/sunglasses?pageIndex=1&size=5">Sunglasses</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/perfumes?pageIndex=1&size=5">Perfumes</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/beauty?pageIndex=1&size=5">Beauty</a>
                                                </li>
                                                <li><a href="/search/category/default/woman/shirts?pageIndex=1&size=5">Shirts</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/sunglasses?pageIndex=1&size=5">Sunglasses</a>
                                                </li>
                                                <li>
                                                    <a href="/search/category/default/woman/swimwear?pageIndex=1&size=5">Swimwear</a>
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
                            <li class="menu__item dropdown">
                                <a class="menu__link dropdown-toggle" href="#" data-toggle="dropdown">Short
                                    Codes <b class="caret"></b></a>
                                <ul class="dropdown-menu agile_short_dropdown">
                                    <li><a href="icons.html">Web Icons</a></li>
                                    <li><a href="typography.html">Typography</a></li>
                                </ul>
                            </li>
                            <li class=" menu__item "><a class="menu__link" href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="top_nav_right">
            <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                <form action="/showCart" method="get" class="last">
                    <button class="w3view-cart" type="submit" name="submit" value="">
                        <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                    </button>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //banner-top -->
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
                    <h5>${ratePermitsMsg}</h5>
                    <br>
                        <input type="submit"  data-dismiss="modal"
                               style="float: right" value="OK">
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<%--//Model3--%>
<%--Modal4--%>
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="col-md-8 modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">Rate <span>Now</span></h3>
                    <form action="/user/add/rate/${product.id}" method="post">
                    <div class="rating1">
						<span class="starRating">
							<input id="rating5" type="radio" name="rating" value="5" checked>
							<label for="rating5">5</label>
							<input id="rating4" type="radio" name="rating" value="4">
							<label for="rating4">4</label>
							<input id="rating3" type="radio" name="rating" value="3">
							<label for="rating3">3</label>
							<input id="rating2" type="radio" name="rating" value="2">
							<label for="rating2">2</label>
							<input id="rating1" type="radio" name="rating" value="1">
							<label for="rating1">1</label>
						</span>
                    </div>
                    <br>
                        <input hidden type="number" name="rating" value="" id="realStar">
                        <input type="submit" value="Submit"
                               style="float: right">
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<%--//Model4--%>

<!--/single_page-->
<!-- /banner_bottom_agile_info -->
<div class="page-head_agile_info_w3l">
    <div class="container">
        <h3>Single <span>Page </span></h3>
        <!--/w3_short-->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">

                <ul class="w3_short">
                    <li><a href="/">Home</a><i>|</i></li>
                    <li>Single Page</li>
                </ul>
            </div>
        </div>
        <!--//w3_short-->
    </div>
</div>

<!-- banner-bootom-w3-agileits -->
<div class="banner-bootom-w3-agileits">
    <div class="container">
        <div class="col-md-4 single-right-left ">
            <div class="grid images_3_of_2">
                <div class="flexslider">

                    <ul class="slides">
                        <li data-thumb="/static/images/d2.jpg">
                            <div class="thumb-image"><img src="/static/images/d2.jpg" data-imagezoom="true"
                                                          class="img-responsive"></div>
                        </li>
                        <li data-thumb="/static/images/d1.jpg">
                            <div class="thumb-image"><img src="/static/images/d1.jpg" data-imagezoom="true"
                                                          class="img-responsive"></div>
                        </li>
                        <li data-thumb="/static/images/d3.jpg">
                            <div class="thumb-image"><img src="/static/images/d3.jpg" data-imagezoom="true"
                                                          class="img-responsive"></div>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="col-md-8 single-right-left simpleCart_shelfItem">
            <h3>${product.name}</h3>
            <p><span class="item_price">$${product.price}</span>
                <del>- $900</del>
            </p>
            <div>
                <c:forEach var="i" begin="1" end="5">
                    <c:choose>
                        <c:when test="${i<=product.rateAverage+1}">
                            <span class="fa fa-star checked"></span>
                        </c:when>
                        <c:otherwise>
                            <span class="fa fa-star"></span>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <div class="occasion-cart">
                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                    <form action="#" method="post">
                        <form action="/addCart" method="post">
                            <fieldset>
                                <input type="hidden" name="productId" value="${product.id}"/>
                                <input type="hidden" name="userId" value="${userId}"/>
                                <input type="hidden" name="amount" value="1"/>
                                <input type="submit" name="submit" value="Add to cart" class="button"/>
                            </fieldset>
                        </form>
                    </form>
                </div>

                <div class="snipcart-details  hvr-outline-out button2">
                    <form action="/user/check/rate/${product.id}" method="get">
                        <input type="submit" name="submit" value="Rate" class="button">
                    </form>
                </div>
            </div>
            <ul class="social-nav model-3d-0 footer-social w3_agile_social single_page_w3ls">
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
        <!-- /new_arrivals -->
        <div class="responsive_tabs_agileits">
            <div id="horizontalTab">
                <ul class="resp-tabs-list">
                    <li>Description</li>
                    <li>Reviews</li>
                    <li>Information</li>
                </ul>
                <div class="resp-tabs-container">
                    <!--/tab_one-->
                    <div class="tab1">

                        <div class="single_page_agile_its_w3ls">
                            <h6>Lorem ipsum dolor sit amet</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elPellentesque vehicula augue eget
                                nisl ullamcorper, molestie blandit ipsum auctor. Mauris volutpat augue dolor.Consectetur
                                adipisicing elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua. Ut
                                enim ad minim veniam, quis nostrud exercitation ullamco. labore et dolore magna
                                aliqua.</p>
                            <p class="w3ls_para">Lorem ipsum dolor sit amet, consectetur adipisicing elPellentesque
                                vehicula augue eget nisl ullamcorper, molestie blandit ipsum auctor. Mauris volutpat
                                augue dolor.Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut lab ore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. labore
                                et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <!--//tab_one-->
                    <div class="tab2">

                        <div class="single_page_agile_its_w3ls">
                            <div class="bootstrap-tab-text-grids">
                                <div class="bootstrap-tab-text-grid container1">
                                    <iframe class="responsive-iframe"
                                            src="http://localhost:8080/review/${product.id}?pageIndex=1" width='1080'
                                            height='480'
                                            title="Review of another user">
                                    </iframe>
                                </div>
                                <div class="clearfix"></div>
                                <div class="add-review">
                                    <h4>add a review</h4>
                                    <form action="/user/add/review/${product.id}" method="post">
                                        <textarea name="comment" required=""></textarea>
                                        <input type="submit" value="SEND">
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tab3">

                        <div class="single_page_agile_its_w3ls">
                            <h6>Big Wing Sneakers (Navy)</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elPellentesque vehicula augue eget
                                nisl
                                ullamcorper, molestie blandit ipsum auctor. Mauris volutpat augue dolor.Consectetur
                                adipisicing
                                elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua. Ut enim ad
                                minim veniam,
                                quis nostrud exercitation ullamco. labore et dolore magna aliqua.</p>
                            <p class="w3ls_para">Lorem ipsum dolor sit amet, consectetur adipisicing elPellentesque
                                vehicula augue
                                eget nisl ullamcorper, molestie blandit ipsum auctor. Mauris volutpat augue
                                dolor.Consectetur
                                adipisicing elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua. Ut
                                enim ad
                                minim veniam, quis nostrud exercitation ullamco. labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //new_arrivals -->
        <!--/slider_owl-->

        <div class="w3_agile_latest_arrivals">
            <h3 class="wthree_text_info">Featured <span>Arrivals</span></h3>
            <div class="clearfix"></div>
            <!--//slider_owl-->
        </div>
    </div>
</div>
<!--//single_page-->
<!--/grids-->
<div class="coupons">
    <div class="coupons-grids text-center">
        <div class="w3layouts_mail_grid">
            <div class="col-md-3 w3layouts_mail_grid_left">
                <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                    <i class="fa fa-truck" aria-hidden="true"></i>
                </div>
                <div class="w3layouts_mail_grid_left2">
                    <h3>FREE SHIPPING</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur</p>
                </div>
            </div>
            <div class="col-md-3 w3layouts_mail_grid_left">
                <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                    <i class="fa fa-headphones" aria-hidden="true"></i>
                </div>
                <div class="w3layouts_mail_grid_left2">
                    <h3>24/7 SUPPORT</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur</p>
                </div>
            </div>
            <div class="col-md-3 w3layouts_mail_grid_left">
                <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                    <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                </div>
                <div class="w3layouts_mail_grid_left2">
                    <h3>MONEY BACK GUARANTEE</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur</p>
                </div>
            </div>
            <div class="col-md-3 w3layouts_mail_grid_left">
                <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                    <i class="fa fa-gift" aria-hidden="true"></i>
                </div>
                <div class="w3layouts_mail_grid_left2">
                    <h3>FREE GIFT COUPONS</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur</p>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>
</div>
<!--grids-->
<!-- footer -->
<div class="footer">
    <div class="footer_agile_inner_info_w3l">
        <div class="col-md-3 footer-left">
            <h2><a href="index.html"><span>E</span>lite Shoppy </a></h2>
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
<!-- //footer -->
<!-- js -->
<script type="text/javascript" src="/static/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="/static/js/modernizr.custom.js"></script>
<!-- Custom-JavaScript-File-Links -->
<!-- cart-js -->
<script src="/static/js/minicart.min.js"></script>

<!-- //cart-js -->
<!-- single -->
<script src="/static/js/imagezoom.js"></script>
<!-- single -->
<!-- script for responsive tabs -->
<script src="/static/js/easy-responsive-tabs.js"></script>
<script>
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true,   // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
        $('#verticalTab').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true
        });
    });
</script>
<!-- FlexSlider -->
<script src="/static/js/jquery.flexslider.js"></script>
<script>
    // Can also be used with $(document).ready()
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
    });
</script>
<!-- //FlexSlider-->
<!-- //script for responsive tabs -->
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
    let Msg = "<%=session.getAttribute("ratePermitsMsg")%>";
    console.log(Msg);
    if (Msg !== "null") {
        if (Msg === "Can rate") {
            $(window).on('load', function () {
                $('#myModal4').modal('toggle');
                <%session.removeAttribute("ratePermitsMsg"); %>
            });
        } else
            $(window).on('load', function () {
                $('#myModal3').modal('toggle');
                <%session.removeAttribute("ratePermitsMsg"); %>
            });
    }
</script>
</body>
</html>

