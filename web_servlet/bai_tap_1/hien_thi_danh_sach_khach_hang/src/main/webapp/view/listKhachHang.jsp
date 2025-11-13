<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/13/2025
  Time: 2:25 PM
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
<div class="container">
    <div class="d-flex justify-content-center">
        <h2>Danh Sach Khach Hang</h2>
    </div>

    <table  class="table table-hover">
        <tr>
            <th>Ten</th>
            <th>Ngay Sinh</th>
            <th>Dia Chi</th>
            <th>Anh</th>
        </tr>
        <c:forEach var="item" items="${listKhachHang}" varStatus="status">
            <tr>
                <td>${item.getTen_khach_hang()}</td>
                <td>${item.getNgay_sinh()}</td>
                <td>${item.getDia_chi()}</td>
                <td>
                    <div class="card" style="width: 18rem;">
                        <img src="${pageContext.request.contextPath}/anh_demo/test2.jpg" class="card-img-top" alt="...">
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
