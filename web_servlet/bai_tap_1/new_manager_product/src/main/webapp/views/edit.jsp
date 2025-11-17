<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/11/2025
  Time: 9:24 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<div>
    <form action="products?action=edit&id=${param.id_product}" method="post">
        <div class="mb-3">
            <label for="nameProductInput" class="form-label">Tên Sản phẩm</label>
            <input type="text" class="form-control" id="nameProductInput" name="name_product" value="${name_product}" required>
        </div>
        <div class="mb-3">
            <label for="priceInput" class="form-label">Giá</label>
            <input type="number" class="form-control" id="priceInput" name="price" step="0.01" min="0" value="${price}" required>
            <div id="priceHelp" class="form-text">Nhập giá sản phẩm (ví dụ: 19.99).</div>
        </div>
        <div class="mb-3">
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="id_category" >
                <option value="${id_category}">${name_category}</option>
                <c:forEach items="${category}" var="c" >
                    <option value="${c.getId_category()}">${c.getName_category()}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Lưu Sản phẩm</button>
    </form>
</div>
</body>
</html>
