<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/19/2021
  Time: 6:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    <%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>--%>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
    <style>
        body {
            background: rgb(154, 154, 147)
        }
        .error {
            color: red;
        }
        .disabled {
            background-color: #aeaeae !important;
            border-color: #aeaeae !important;
            color: #000 !important;
            pointer-events: none;
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
<!--Modal: modalCookie-->
<div class="modal fade top" id="modalCookie1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" data-backdrop="true">
    <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Body-->
            <div class="modal-body">
                <div class="row d-flex justify-content-center align-items-center">

                    <p class="pt-3 pr-2">Your account is not active, please change your's password to active! Before you
                        active, other feature of user is denied</p>

<%--                    <a type="button" class="btn btn-primary">Learn more <i class="fas fa-book ml-1"></i></a>--%>
                    <a type="button" class="btn btn-outline-primary waves-effect" data-dismiss="modal">Ok, thanks</a>
                </div>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!--Modal: modalCookie-->
<form:form action="/user/change/password.htm" modelAttribute="userChangePassword" method="post">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" src="https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80" width="50%" >
                    <span class="font-weight-bold">${userChangePassword.username}</span

                    <span> </span>
                </div>
            </div>
            <div class="col-md-7">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Change Password</h4>
                    </div>
                    <div class="row mt-3">
                        <input type="hidden" name="id" value="${userChangePassword.id}"/>
                        <div class="col-md-12"><label class="labels">Current Password<h7 style="color: red">(*)</h7></label>
                            <input type="password" class="form-control" value="" placeholder="Current Password" name="currentPass">
                                <%--                            <form:input path="oldPassword" readonly="readonly" class="form-control" ></form:input>--%>
                            <p id="errorOldPass" class="error">
                                <c:if test="${message != null}">Old password is incorrect </c:if>
<%--                                ${message}--%>
                            </p>
                        </div>
                        <div class="col-md-12"><label class="labels">New Password<h7 style="color: red">(*)</h7></label>
                            <input type="password" class="form-control" value="" placeholder="New Password" id="newPass" name="newPass" oninput="kiemtra(event)">
                                <%--                            <form:input path="password" readonly="readonly" class="form-control" ></form:input>--%>
                        </div>
                        <div class="col-md-12"><label class="labels">Confirm Password<h7 style="color: red">(*)</h7></label>
                            <input type="password" class="form-control" value="" placeholder="Confirm Password" id="confirmPass" name="confirmPass"
                                   oninput="kiemtra(event)">
                            <p id="errorMessage" class="error"></p>
                                <%--<form:input path="password" readonly="readonly" class="form-control" ></form:input>--%>
                        </div>

                    </div>
                    <div class="mt-5 text-center">
                        <button class="btn btn-light" type="submit" id="buttonSave"
                                style="height: 50px; width: 150px">Save
                        </button>
                        <a class="btn btn-danger danger-color-dark" style="height: 50px; width: 150px"
                           href="/user/show/profile?id=${userChangePassword.id}" type="submit"
                           id="buttonCancel" role="button"
                           aria-pressed="true">Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</form:form>
<script>
    function kiemtra(e) {
        var newPass = document.getElementById("newPass").value;
        var confirmPass = document.getElementById("confirmPass").value;
        if (newPass == confirmPass) {
            document.getElementById("errorMessage").innerHTML = "";
        } else {
            document.getElementById("errorMessage").innerHTML = "Mat khau khong khop. Vui long nhap lai!";
        }
    }

    document.getElementById("confirmPass").addEventListener("input", function () {
        var newPass = document.getElementById("newPass").value;
        var confirmPass = this.value;
        if (newPass == confirmPass) {
            document.getElementById("buttonSave").classList.remove("disabled");
        } else {
            document.getElementById("buttonSave").classList.add("disabled");
        }
    });

    document.getElementById("newPass").addEventListener("input", function () {
        var newPass = this.value;
        var confirmPass = document.getElementById("confirmPass").value
        if (newPass == confirmPass) {
            document.getElementById("buttonSave").classList.remove("disabled");
        } else {
            document.getElementById("buttonSave").classList.add("disabled");
        }
    });
</script>
<script>
    var Msg = "<%=session.getAttribute("notActive")%>";
    if (Msg != "null") {
        // function alertName() {
        //     $('#myModal3').modal("show");
        $(window).on('load', function () {
            $('#modalCookie1').modal('toggle');
            <%session.removeAttribute("notActive");%>
        });

    }
</script>
</body>
</html>