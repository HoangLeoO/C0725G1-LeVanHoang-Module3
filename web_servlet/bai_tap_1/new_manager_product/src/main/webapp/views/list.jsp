<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 17/11/2025
  Time: 9:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<h1></h1>
<div>
    <a href="products?action=add">
        <button type="button">ADD</button>
    </a>
</div>
<form action="products?action=search" method="post">
    <div class="input-group mb-3">
        <select class="form-select" name="keyword1">
            <option selected value="">Chọn danh mục</option>
            <c:forEach items="${search_category}" var="s">
                <option value="${s.getName_category()}">${s.getName_category()}</option>
            </c:forEach>
        </select>

        <input type="text" class="form-control" name="keyword2" placeholder="Tên sản phẩm">
        <button type="submit" class="btn btn-primary">Tìm</button>
    </div>
</form>

<table class="table table-hover">
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Loại sản phẩm</th>
        <th colspan="2">Thao tác</th>
    </tr>
    <c:forEach items="${products}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getName_product()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getName_category()}</td>
            <td><a href="products?action=edit&id_product=${product.getId_product()}">Edit</a></td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"  onclick="delete_by_id(${product.getId_product()}, '${product.getName_product()}')">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<nav>
    <ul class="pagination">
        <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="page-item ${i == currentPage ? 'active' : ''}">
                <a class="page-link" href="products?action=${param.action}&page=${i}&keyword1=${param.keyword1}&keyword2=${param.keyword2}">${i}</a>
            </li>
        </c:forEach>
    </ul>
</nav>

<!-- Modal delete -->
<form action="products?action=delete" method="post">
    <input type="hidden" id="id_delete" name="id_product">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Bạn thực hiện thao tác xóa!</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <p>ID: <span id="id_product"></span></p>
                    <p>Tên: <span id="name_product"></span></p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    function delete_by_id(id,name){
        document.getElementById("id_product").innerText = id;  // hiện lên modal
        document.getElementById("name_product").innerText = name;
        document.getElementById("id_delete").value = id;
    }
</script>
</body>
</html>
