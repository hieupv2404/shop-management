<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 13-Sep-21
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/static/assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="/static/assets/vendors/simple-datatables/style.css">
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
                        <a href="/admin/dashboard" class='sidebar-link'>
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

                    <li class="sidebar-item active has-sub">
                        <a href="#" class='sidebar-link'>
                            <i class="bi bi-stack"></i>
                            <span>product</span>
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
                        <a href="/admin/get/chat" class='sidebar-link'>
                            <i class="bi bi-chat-dots-fill"></i>
                            <span>Chat Application</span>
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
                        <h3>Product</h3>
                        <%--                        <p class="text-subtitle text-muted">Create new product</p>--%>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <%--                            <ol class="breadcrumb">--%>
                            <%--                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>--%>
                            <%--                                <li class="breadcrumb-item active" aria-current="page">DataTable</li>--%>
                            <%--                            </ol>--%>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Create new product</h4>
                    </div>
                    <form:form action="updateProduct" modelAttribute="product" enctype="multipart/form-data" method="post">
                    <div class="card-body">
                        <form:hidden path="id" class="form-control" id="basicInput"></form:hidden>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="basicInput">Name</label>
                                    <td>
                                        <form:input path="name" class="form-control" id="basicInput"></form:input>
                                        <form:errors path="name" cssClass="error" cssStyle="color: red"/>
                                    </td>
                                </div>
                                <div class="form-group">
                                    <label for="helpInputTop">Price</label>
                                    <td><form:input path="price" class="form-control" id="helpInputTop"></form:input></td>
                                    <form:errors path="price" cssClass="error" cssStyle="color: red"/>

                                </div>
                                <div class="form-group">
                                    <label for="helpInputTop">RateAverage</label>
                                    <td><form:input path="rateAverage" class="form-control" id="helpInputTop"></form:input></td>
                                    <form:errors path="rateAverage" cssClass="error" cssStyle="color: red"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <img height="100px" width="100px" src="/static/images${product.image}"/>
                                        <form:hidden path="image"></form:hidden>
                                    </div>
                                    <label>Picture</label>
                                    <input type="file" value="${productUpdate.image}" name="img" class="form-control"
                                           placeholder="Select Image">
                                </div>
                                <div class="form-group">
                                    <td colspan="3"><input class="btn btn-success" type="submit" value="Update"></td>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="basicSelect">Category</label> <br>
                                    <td>
                                        <c:forEach items="${listCategory}" var="category">
                                            <input type="checkbox" name="category"
                                            <c:if test="${categoryOfProductList.contains(category)}"> checked </c:if>
                                                   value="${category.id}"> ${category.name} <br>
                                        </c:forEach>
                                    </td>
                                </div>
                            </div>
                        </div>
                        </form:form>
                    </div>
                </div>
            </section>
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

<script src="/static/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>

<script src="/static/assets/js/main.js"></script>
</body>

</html>
