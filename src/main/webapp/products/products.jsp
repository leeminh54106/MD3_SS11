<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2024
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%--ko hieu--%>
<a href="/productcontroller?action=VIEWADD" class="btn btn-primary">thêm mới sản phẩm</a>
<form action="/productcontroller" method="post">
    <input type="text" name="search" placeholder="search...">
    <input type="submit" name="action" value="SEARCH">
</form>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>PRODUCER</th>
        <th>STATUS</th>
        <th colspan="2">ACTIONS</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="p">
        <tr>
            <td scope="row">${p.id}</td>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td>${p.producer}</td>
            <td>${p.status ? "Đang bán" : "Hết hàng"}</td>
            <td>
                <a href="/productcontroller?action=VIEWEDIT&id=${p.id}" class="btn btn-warning">EDIT</a>
            </td>
            <td>
                <a href="" class="btn btn-secondary">Detail</a>
            </td>
            <td>
                <a href="/productcontroller?action=DELETE&id=${p.id}" class="btn btn-danger">Delete</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>

