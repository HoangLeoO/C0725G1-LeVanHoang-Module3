<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/13/2025
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
<a href="calculators?action=1">a</a>
<div class="container mt-5">
    <div class="d-flex justify-content-center">
        <h1>Calculator</h1>
    </div>
    <div class="d-flex justify-content-center">
        <span>${error}</span>
        <form action="calculators" method="post">
            <div class="mb-2">
                <input name="num1" class="form-control " type="text">
            </div>
            <div class="mb-2">
                <select class="form-select" aria-label="Default select example" name="chon">
                    <option selected>Open this select menu</option>
                    <option value="cong">+</option>
                    <option value="tru">-</option>
                    <option value="nhan">*</option>
                    <option value="chia">/</option>
                </select>
            </div>
            <div class="mb-2">
                <input name="num2" class="form-control " type="text">
            </div>
            <div class="mb-2">
                <p>Ket Qua : </p>
                <input name="ket_qua" class="form-control" disabled type="text" value="${ket_qua}">
            </div>
            <button type="submit">CLICK ME</button>
        </form>
    </div>
</div>
</body>
</html>
