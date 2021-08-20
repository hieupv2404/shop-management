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
    <form action="/initShowProduct.htm" method="post">
        <table border="1">
            <thead>
            <th>id</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Rate Average</th>
            </thead>
            <tbody>
            <c:forEach items="${productIterable}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.rateAverage}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    </tbody>
</body>
</html>
