<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/13/2025
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="mt-5">
    <div>
        <form action="products?action=edit" method="post">
            <span>Id : </span>
            <input name="id" value="${product.getId()}" type="text">
            <br>
            <span>Name</span>
            <input name="name"  value="${product.getName()}" type="text">
            <br>
            <span>Price</span>
            <input name="price" value="${product.getPrice()}" type="text">
            <br>
            <div>
                <button type="submit">Edit</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
