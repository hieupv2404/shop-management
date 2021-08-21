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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

    <style>
        body {
            background: rgb(154, 154, 147)
        }
        #errorMessage {
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
<form:form action="changePassword.htm" modelAttribute="userChangePassword" method="post">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" src="https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80" width="50%">
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
                        <div class="col-md-12"><label class="labels">Current Password</label>
                            <input type="text" class="form-control" value="" placeholder="Current Password" name="currentPass">
<%--                            <form:input path="oldPassword" readonly="readonly" class="form-control" ></form:input>--%>
                        </div>
                        <div class="col-md-12"><label class="labels">New Password</label>
                            <input type="text" class="form-control" value="" placeholder="New Password" id="newPass" name="newPass">
<%--                            <form:input path="password" readonly="readonly" class="form-control" ></form:input>--%>
                        </div>
                        <div class="col-md-12"><label class="labels">Confirm Password</label>
                            <input type="text" class="form-control" value="" placeholder="Confirm Password" id="confirmPass" name="confirmPass"
                                   oninput="kiemtra(event)">
                            <p id="errorMessage"></p>
                                <%--<form:input path="password" readonly="readonly" class="form-control" ></form:input>--%>
                        </div>

                    </div>
                    <div class="mt-5 text-center">
                        <button class="btn btn-primary " type="submit" id="buttonSave">Save Password</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</form:form>
<%--<script>--%>
<%--    function kiemtra(e) {--%>
<%--        var newPass = document.getElementById("newPass").value;--%>
<%--        const confirmPass = e.target.value;--%>
<%--        console.log(newPass);--%>
<%--        console.log(confirmPass);--%>
<%--        if (newPass == confirmPass) {--%>
<%--            console.log("dung");--%>
<%--            document.getElementById("errorMessage").innerHTML= "";--%>
<%--            document.getElementById("buttonSave").classList.remove("disabled");--%>
<%--        } else {--%>
<%--            document.getElementById("errorMessage").innerHTML = "Mat khau khong trung khop voi mat khau moi";--%>
<%--            document.getElementById("buttonSave").classList.add("disabled");--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
