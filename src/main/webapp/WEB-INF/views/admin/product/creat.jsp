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
                        <h3>DataTable</h3>
                        <p class="text-subtitle text-muted">For user to check they list</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
<%--            <section class="section">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-header">--%>
<%--                        Simple Datatable--%>
<%--                    </div>--%>
<%--                    <div class="card-body">--%>
<%--                        <form:form action="addProduct" modelAttribute="product">--%>
<%--                            <table class="table table-striped" id="table1">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>Id</th>--%>
<%--                                    <th>Name</th>--%>
<%--                                    <th>Price</th>--%>
<%--                                    <th>Images</th>--%>
<%--                                    <th>Category</th>--%>
<%--                                    <th>Function</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <tr>--%>
<%--                                    <td><form:input path="id" cssStyle="width: 150px"></form:input></td>--%>
<%--                                    <td><form:input path="name" cssStyle="width: 150px"></form:input></td>--%>
<%--                                    <td><form:input path="price" cssStyle="width: 150px"></form:input></td>--%>
<%--                                    <td><form:input path="" cssStyle="width: 150px"></form:input></td>--%>
<%--                                    <td>--%>
<%--                                        <select class="form-select" id="basicSelect" name="category">--%>
<%--                                            <c:forEach items="${listCategory}" var="category">--%>
<%--                                                <option value="${category.id}">${category.name}</option>--%>
<%--                                            </c:forEach>--%>
<%--                                        </select>--%>
<%--                                    </td>--%>
<%--                                    <td colspan="2"><input type="submit" value="Create"></td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </form:form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </section>--%>

            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Basic Inputs</h4>
                    </div>
                    <form:form action="addProduct" modelAttribute="product">
                    <div class="card-body">
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
                                </div>
                                <div class="form-group">
                                    <label for="helpInputTop">RateAverage</label>
                                    <td><form:input path="rateAverage" class="form-control" id="helpInputTop"></form:input></td>
                                </div>
                                <div class="form-group">
                                    <label for="formFile">Images</label>
                                    <input class="form-control" type="file" id="formFile">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="basicSelect">Category</label>
                                    <select class="form-select" id="basicSelect" name="category"  multiple>
                                        <c:forEach items="${listCategory}" var="category">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <td colspan="3"><input type="submit" value="Create"></td>
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
