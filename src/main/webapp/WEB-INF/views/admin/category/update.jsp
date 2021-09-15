<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/28/2021
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Update Category</title>
</head>
<body>
<form:form action="admin/categories/updateCategory" modelAttribute="categoryUpdate" >
  <table border="1">
    <tr>
      <td>Category ID</td>
      <td><form:input path="id" readonly="true"></form:input></td>
    </tr>
    <tr>
      <td>Category Name</td>
      <td><form:input path="name"></form:input> </td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" value="Update"></td>
    </tr>
  </table>
</form:form>
</body>
</html>
