<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/27/2021
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Show Blog</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js	">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <style>

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            font-size: 14px
        }

        body {
            background-color: #e2e8f0;
            padding: 20px
        }

        .breadcrumb {
            background-color: #c5cee4
        }


        .text-muted {
            min-width: 174.4px;
        }


        .breadcrumb a {
            text-decoration: none
        }

        .container {
            max-width: 1000px;
            padding: 0
        }

        p {
            margin: 0
        }

        .d-flex a {
            text-decoration: none;
            color: #686868
        }

        img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover
        }

        .fab.fa-twitter {
            color: #8ab7f1
        }

        .fab.fa-instagram {
            color: #E1306C
        }

        .fab.fa-facebook-f {
            color: #5999ec
        }

    </style>
</head>
<body>
<form:form action="initShowUser.htm" modelAttribute="showUser" method="post">
    <div class="container">
        <div class="row">
            <div class="col-12 p-0">
                <nav aria-label="breadcrumb ">
                    <ol class="breadcrumb py-3 px-3">
                        <li class="breadcrumb-item"><a href="http://localhost:8080/user/getAll.htm">Home</a></li>
<%--                        <li class="breadcrumb-item"><a href="http://localhost:8080/user/getAll.htm">Library</a></li>--%>
                        <li class="breadcrumb-item active" aria-current="page">Data</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-12 bg-white p-0 px-3 py-3 mb-3">
                        <div class="d-flex flex-column align-items-center"> <img class="photo" src="https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80" alt="">
                            <p class="fw-bold h4 mt-4">${showUser.get().username}</p>
                            <p class="text-muted">Full Stack Developer</p>
                            <span class="text-black-50">lethanhdat210520@gmail.com</span>

                        </div>
                    </div>
                    <div class="col-12 bg-white p-0 px-2 pb-3 mb-3">
                        <div class="d-flex justify-content-between border-bottom py-2 px-3">
                            <p><span class="fas fa-globe me-2"></span>Website</p> <a href="https://www.facebook.com/letthanhdat210520/">https://www.facebook.com/letthanhdat210520/</a>
                        </div>
                        <div class="d-flex justify-content-between border-bottom py-2 px-3">
                            <p><span class="fab fa-github-alt me-2"></span>Github</p> <a href="https://github.com/lethanhdat215/mvc">https://www.facebook.com/letthanhdat210520/</a>
                        </div>
                        <div class="d-flex justify-content-between border-bottom py-2 px-3">
                            <p><span class="fab fa-twitter me-2"></span>Twitter</p> <a href="https://www.facebook.com/letthanhdat210520/">https://www.facebook.com/letthanhdat210520/</a>
                        </div>
                        <div class="d-flex justify-content-between border-bottom py-2 px-3">
                            <p><span class="fab fa-instagram me-2"></span>Instagram</p> <a href="https://www.facebook.com/letthanhdat210520/">https://www.facebook.com/letthanhdat210520/</a>
                        </div>
                        <div class="d-flex justify-content-between py-2 px-3">
                            <p><span class="fab fa-facebook-f me-2"></span>facebook</p> <a href="https://www.facebook.com/letthanhdat210520/">https://www.facebook.com/letthanhdat210520/</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 ps-md-4">
                <div class="row">
                    <div class="col-12 bg-white px-3 mb-3 pb-3">
                        <div class="d-flex align-items-center justify-content-between border-bottom">
                            <p class="py-2">First Name</p>
                            <p class="py-2 text-muted">
                                ${showUser.get().firstName}
                            </p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between border-bottom">
                            <p class="py-2">Last Name</p>
                            <p class="py-2 text-muted">
        <%--                                <form:input path="lastName" cssStyle="border: 0; background: white" disabled="true"></form:input>--%>
                                ${showUser.get().lastName}
                            </p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between border-bottom">
                            <p class="py-2">Birthday</p>
                            <p class="py-2 text-muted">
                                <fmt:formatDate pattern = "dd/MM/yyyy" value = "${showUser.get().birthday}" /></p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between border-bottom">
                            <p class="py-2">Sex</p>
                            <p class="py-2 text-muted">
                                <c:if test="${showUser.get().sex == true}">Nam</c:if>
                                <c:if test="${showUser.get().sex == false}">Nữ</c:if>
                            </p>
<%--                            <p class="py-2 text-muted"><form:input path="sex" cssStyle="border: 0; background: white" disabled="true"></form:input></p>--%>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="py-2">Address</p>
                            <p class="py-2 text-muted">
                                ${showUser.get().address}
                            </p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between border-bottom">
                            <p class="py-2">Phone</p>
                            <p class="py-2 text-muted">
                                ${showUser.get().phone}
                            </p>
                        </div>
                    </div>
                    <div class="col-12 bg-white px-3 pb-4">
                        <h8 class="d-flex align-items-center mb-3 fw-bold py-3"><i class="text-info me-2">assignment</i>Project Status</h8> <small>Web Design</small>
                        <div class="progress mb-3" style="height: 5px">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                        </div> <small>One Page</small>
                        <div class="progress mb-3" style="height: 5px">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                        </div> <small>Mobile Template</small>
                        <div class="progress mb-3" style="height: 5px">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form:form>
<td> <button> <a href="initUpdateProfile.htm?id=${userId}"> Update Profile </a></button></td>
<td> <button> <a href="initChangePassword.htm?id=${userId}"> Change Password </a></button></td>
</body>
</html>
