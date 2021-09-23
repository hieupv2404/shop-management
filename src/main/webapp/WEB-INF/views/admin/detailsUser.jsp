<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 23-Sep-21
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Layout - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/static/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/static/assets/css/app.css">
    <link rel="shortcut icon" href="/static/assets/images/favicon.svg" type="image/x-icon">
</head>

<body>
<div id="app">
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="index.html"><img src="/static/assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">Menu</li>

                    <li class="sidebar-item  ">
                        <a href="/admin/get/dashboard" class='sidebar-link'>
                            <i class="bi bi-grid-fill"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li class="sidebar-item    has-sub">
                        <a href="#" class='sidebar-link'>
                            <i class="bi bi-stack"></i>
                            <span>Category</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="/admin/categories/addCategory">Create Category</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="/admin/categories/getAll">List Category</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item has-sub">
                        <a href="#" class='sidebar-link'>
                            <i class="bi bi-stack"></i>
                            <span>Product</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="/admin/products/addProduct">Create Product</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="/admin/products/getAll">List Product</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/admin/get/chatBox" class='sidebar-link'>
                            <i class="bi bi-chat-dots-fill"></i>
                            <span>Chat Application</span>
                        </a>
                    </li>

                    <li class="sidebar-item  active">
                        <a href="/admin/get/users" class='sidebar-link'>
                            <i class="bi-person-lines-fill"></i>
                            <span>Users</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/logout" class="sidebar-link">
                            <i class="bi-person-x-fill"></i>
                            <span>Log out</span>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>
    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Form Layout</h3>
                        <p class="text-subtitle text-muted">Multiple form layout you can use</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Form Layout</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Basic Horizontal form layout section start -->
            <!-- // Basic Horizontal form layout section end -->

            <!-- Basic Vertical form layout section start -->
            <!-- // Basic Vertical form layout section end -->


            <!-- // Basic multiple Column Form section start -->
            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Multiple Column</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
<%--                                    <form class="form">--%>
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">First Name</label>
                                                    <input id="first-name-column" class="form-control"
                                                           name="fname-column" value=" ${user.firstName}" readonly disabled
                                                           style="background-color: white">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column">Last Name</label>
                                                    <input type="text" id="last-name-column" class="form-control"
                                                           name="lname-column" value="${user.lastName}" readonly disabled
                                                           style="background-color: white">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="city-column">Birthday</label>
                                                    <input type="text" id="city-column" class="form-control"
                                                           name="city-column" value=" ${user.getBirthday(1)}" readonly disabled
                                                           style="background-color: white">

                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">Sex</label>
                                                    <input type="text" id="country-floating" class="form-control"
                                                           name="country-floating" readonly disabled
                                                           style="background-color: white" value=
                                                           <c:choose>
                                                           <c:when test="${user.sex=='true'}">
                                                                   "Nam"
                                                    </c:when>
                                                    <c:otherwise>
                                                        "Nu"
                                                    </c:otherwise>
                                                    </c:choose>>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="company-column">Phone</label>
                                                    <input type="text" id="company-column" class="form-control"
                                                           name="company-column" value="${user.phone}" readonly disabled
                                                           style="background-color: white">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">Address</label>
                                                    <input type="email" id="email-id-column" class="form-control"
                                                           name="email-id-column" value=" ${user.address}" readonly disabled
                                                           style="background-color: white">
                                                </div>
                                            </div>
                                            <%--                                            <div class="form-group col-12">--%>
                                            <%--                                                <div class='form-check'>--%>
                                            <%--                                                    <div class="checkbox">--%>
                                            <%--                                                        <input type="checkbox" id="checkbox5" class='form-check-input' checked>--%>
                                            <%--                                                        <label for="checkbox5">Remember Me</label>--%>
                                            <%--                                                    </div>--%>
                                            <%--                                                </div>--%>
                                            <%--                                            </div>--%>
                                            <div class="col-12 d-flex justify-content-end">
                                                    <c:choose>
                                                        <c:when test="${user.block=='false'}">
                                                            <a href="/admin/put/block/user?id=${user.id}" class="btn btn-dark me-1 mb-1"
                                                               role="button"
                                                               aria-pressed="true">Block</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="/admin/put/unblock/user?id=${user.id}" class="btn btn-primary me-1 mb-1"
                                                               role="button"
                                                               aria-pressed="true">Unblock</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <a href="/admin/get/users" class="btn btn-light-secondary me-1 mb-1"
                                                   role="button"
                                                   aria-pressed="true">Back</a>
                                            </div>
                                        </div>
<%--                                    </form>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- // Basic multiple Column Form section end -->
        </div>

        <footer>
            <div class="footer clearfix mb-0 text-muted">
                <div class="float-start">
                    <p>2021 &copy; Mazer</p>
                </div>
                <div class="float-end">
                    <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                            href="http://ahmadsaugi.com">A. Saugi</a></p>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="/static/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/static/assets/js/bootstrap.bundle.min.js"></script>

<script src="/static/assets/js/main.js"></script>
</body>

</html>

