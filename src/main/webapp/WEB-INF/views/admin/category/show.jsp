<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/14/2021
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List category</title>
</head>
<body>
<table border="1">
    <thead>
    <th>Category Id</th>
    <th>Category Name</th>
    </thead>
    <tbody>
    <c:forEach items="${listCategory}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>
                <a href="/admin/categories/updateCategory/?id=${category.id}"><button>Update Category</button></a>
                <a href="/admin/categories/deleteCategory/?id=${category.id}"><button>Delete Category</button></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/admin/categories/addCategory">
    <button>Create Category</button>
</a>
</body>
</html>
