<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/18/2021
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Test</h1>
    <form action="/updateUser.htm" method="post">
        <table border="1">
            <thead>
            <th>id</th>
            <th>username</th>
            <th>password</th>
            <th>active</th>
            <th>admin</th>
            <th>firstName</th>
            <th>lastName</th>
            <th>birthday</th>
            <th>sex</th>
            <th>address</th>
            <th>phone</th>
            </thead>
            <tbody>
            <c:forEach items="${userIterable}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.active}</td>
                    <td>${user.admin}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.birthday}</td>
                    <td>${user.sex}</td>
                    <td>${user.address}</td>
                    <td>${user.phone}</td>
                    <td> <button> <a href="initUpdateProfile.htm?id=${user.id}"> Update Profile </a></button></td>
                    <td> <button> <a href="initShowUser.htm?id=${user.id}"> Show Profile </a></button></td>
                    <td> <button> <a href="initChangePassword.htm?id=${user.id}"> Change Password </a></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    </tbody>
</body>
</html>
