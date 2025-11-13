<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/13/2025
  Time: 4:40 PM
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
        <form action="products?action=add" method="post">
            <span>Id : </span>
            <input name="id" type="text">
            <br>
            <span>Name</span>
            <input name="name" type="text">
            <br>
            <span>Price</span>
            <input name="price" type="text">
            <br>
            <div>
                <button type="submit">Add</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
