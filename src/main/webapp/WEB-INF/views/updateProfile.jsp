<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/24/2021
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update User</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

    <style>
        body {
            background: rgb(154, 154, 147)
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #9A9A93FF;
        }

        .profile-button {
            background: rgb(177, 174, 174);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background:  #9A9A93FF;
        }

        .profile-button:focus {
            background:  #9A9A93FF;
            box-shadow: none
        }

        .profile-button:active {
            background: #9A9A93FF;
            box-shadow: none
        }

        .back:hover {
            color: #9A9A93FF;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background:#9A9A93FF;
            color: #fff;
            cursor: pointer;
            border: solid 1px #9A9A93FF;
        }
    </style>
</head>
<body>

<form:form action="updateUser.htm" modelAttribute="userUpdate" method="post">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" src="https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80" width="50%">
                    <span class="font-weight-bold">${userUpdate.username}</span
                    <span class="text-black-50">lethanhdat210520@gmail.com</span>
                    <span> </span></div>
            </div>
            <div class="col-md-7">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-2">
                        <form:hidden path="id" readonly="readonly" class="form-control" ></form:hidden>
                        <div class="col-md-6"><label class="labels">First Name</label>
                            <form:input path="firstName"  class="form-control" ></form:input>
                            <form:errors path="firstName" cssClass="error"/>
                        </div>
                        <div class="col-md-6"><label class="labels">Last Name</label>
<%--                            <input type="text" class="form-control" value="" placeholder="lastName">--%>
                            <form:input path="lastName" readonly="readonly" class="form-control" ></form:input>
                            <form:errors path="lastName" cssClass="error"/>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Birthday</label>
                           <form:input path="birthday" readonly="readonly" class="form-control" ></form:input>
                            <form:errors path="birthday" cssClass="error"/>
                        </div>
                        <div class="col-md-12"><label class="labels">Sex</label>
<%--                            <form:input path="sex" readonly="readonly" class="form-control" ></form:input>--%>
                            <select class="form-control" name="sex">
                                <option value="true">--select--</option>
                                <option value="true" <c:if test="${userUpdate.sex == true}">selected</c:if>>Nam</option>
                                <option value="false"  <c:if test="${userUpdate.sex == false}">selected</c:if>>Nữ</option>
                            </select>
                        </div>
                        <div class="col-md-12"><label class="labels">Address</label>
                            <form:input path="address" readonly="readonly" class="form-control" ></form:input>
                            <form:errors path="address" cssClass="error"/>
                        </div>
                        <div class="col-md-12"><label class="labels">Phone</label>
                            <form:input path="phone" readonly="readonly" class="form-control" ></form:input>
                            <form:errors path="phone" cssClass="error"/>
                        </div>
                    </div>
                    <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>

</form:form>
</body>
</html>
