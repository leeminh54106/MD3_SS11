<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2024
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>add</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<form action="/productcontroller" method="post">
<%--    b4-form-input--%>
    <div class="form-group">
        <label for="name">NAME</label>
        <input type="text" class="form-control" name="name" id="name" aria-describedby="helpId" placeholder="">
    </div>
    <div class="form-group">
        <label for="price">PRICE</label>
        <input type="text" class="form-control" name="price" id="price" aria-describedby="helpId" placeholder="">
    </div>
    <div class="form-group">
        <label for="description">DESCRIPTION</label>
        <textarea name="description" id="description" cols="30" rows="10"></textarea>
    </div>
    <div class="form-group">
        <label for="producer">PRODUCER</label>
        <input type="text" class="form-control" name="producer" id="producer" aria-describedby="helpId" placeholder="">
    </div>
    <div class="form-group">
        <label >STATUS</label>
        <input type="radio" name="status" id="true" value="true"> <label for="true">Đang bán</label>
        <input type="radio" name="status" id="false" value="false"> <label for="false">Hết hàng</label>
    </div>
    <input type="submit" value="HANDLEADD" name="action">
</form>
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