<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/14/2025
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quản trị viên - CODEGYM</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css"/>
</head>
<body>


<!-- Admin Section -->
<section class="py-5 mt-5">
    <div class="container" style="margin-top: 50px">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card border-0 shadow">
                    <div class="card-body p-4 p-md-5">
                        <div class="text-center mb-4">
                            <i
                                    class="bi bi-person-gear text-black"
                                    style="font-size: 4rem"></i>
                            <h3 class="mt-3">Quản lý người dùng</h3>
                            <p class="text-muted">
                                Tạo tài khoản mới cho người dùng với các vai trò khác nhau
                            </p>
                        </div>

                        <!-- User List Table -->
                        <div class="mb-5">
                            <h4 class="mb-3">Danh sách người dùng</h4>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Số thứ tự</th>
                                        <th>Họ Và tên</th>
                                        <th>Mã Đất Nước</th>
                                        <th>Tên Đất Nươc</th>
                                        <th colspan="2">Thao Tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${users}" var="user" varStatus="status">
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>${user.getName()}</td>
                                            <td>${user.getCode_country()}</td>
                                            <td>${user.getName_country()}</td>
                                            <td>
                                                <a class="btn btn-sm btn-outline-primary me-1"
                                                   href="http://localhost:8080/users?action=edit&id=${user.id}">
                                                    <i class="bi bi-pencil"></i>
                                                </a>

                                                <a class="btn btn-sm btn-outline-danger"
                                                   href="http://localhost:8080/users?action=delete&id=${user.id}">
                                                    <i class="bi bi-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Create User Form -->
                        <div class="border-top pt-4">
                            <h4 class="mb-3">Tạo người dùng mới</h4>
                            <c:choose>
                                <c:when test="${param.action == 'list'}">
                                    <c:set var="formAction" value="users?action=add"/>
                                </c:when>

                                <c:when test="${param.action == 'edit'}">
                                    <c:set var="formAction" value="users?action=edit&id=${param.id}"/>
                                </c:when>
                            </c:choose>

                            <form action="${formAction}" method="post">

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="fullName" class="form-label"
                                        >Họ và tên</label
                                        >
                                        <div class="input-group">
                          <span class="input-group-text">
                            <i class="bi bi-person"></i>
                          </span>
                                            <input
                                                    name="name"
                                                    type="text"
                                                    class="form-control"
                                                    id="fullName"
                                                    value="${name}"
                                                    placeholder="Nhập họ và tên"
                                                    required/>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label for="role" class="form-label">Vai trò</label>
                                        <div class="input-group">
                          <span class="input-group-text">
                            <i class="bi bi-shield-check"></i>
                          </span>
                                            <select class="form-select" id="role" name="country" required>
                                                <c:choose>
                                                    <c:when test="${param.action == 'list'}">
                                                        <option selected disabled>
                                                            Chọn vai trò
                                                        </option>
                                                    </c:when>

                                                    <c:when test="${param.action == 'edit'}">
                                                        <option value="${id_country}">
                                                            Chọn vai trò
                                                        </option>
                                                    </c:when>
                                                </c:choose>

                                                <c:forEach items="${countrys}" var="c">
                                                    <option value="${c.getId()}">${c.getName_country()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>


                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="reset" class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-clockwise me-2"></i>Làm mới
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-person-plus me-2"></i>Tạo tài khoản
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>
</body>
</html>
