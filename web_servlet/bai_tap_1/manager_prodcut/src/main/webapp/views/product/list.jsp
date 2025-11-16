<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/13/2025
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout/library_boostrap.jsp"/>
</head>
<body>
<div class="mt-5">
    <div>
        <a href="http://localhost:8080/products?action=add">Add</a>
    </div>
    <div class="container">
        <table class="table table-striped">
            <tr>
                <th>stt</th>
                <th>Ten</th>
                <th>Gia</th>
                <th colspan="2">action</th>
            </tr>
            <c:forEach items="${products}" var="product" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td><a href="http://localhost:8080/products?action=edit&id=${product.id}">Edit</a></td>
                    <td><a href="http://localhost:8080/products?action=delete&id=${product.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
