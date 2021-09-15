<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/27/2021
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Create Category</title>
</head>
<body>
<form:form action="addCategory" modelAttribute="category">
    <table border="1">
        <tr>
            <td>Category ID</td>
            <td><form:hidden path="id"></form:hidden></td>
        </tr>
        <tr>
            <td>Category Name</td>
            <td><form:input path="name"></form:input></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Create"></td>
        </tr>
    </table>
</form:form>
<a href="/admin/categories/getAll">
    <button>Back Category</button>
</a>
</body>
</html>
