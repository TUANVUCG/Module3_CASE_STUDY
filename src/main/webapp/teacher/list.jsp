<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="fontawesome/css/all.min.css" rel="stylesheet">
    <title>Hello, world!</title>
    <style>
        td, th {
            text-align: center;
        }
        .main {
            width: 1200px;
            margin: 0 auto;
        }

        button {
            width: 124px;
            background-color: rgb(40, 39, 129);
            color: white;
        }

        a {
            color: white;
            text-decoration: none;
        }

        .navbar {
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="main">
    <nav class="navbar navbar-dark bg-primary">
        <a href="/index.jsp">Trang chủ</a>
        <a href="/teachers">Danh sách giáo viên</a>
        <a href="/students">Danh sách học sinh</a>
        <form class="d-flex">
            <input name="find" type="search" placeholder="Name" class="form-control me-2" aria-label="Search">
            <button class="btn btn-outline-success" type="submit" style="background-color: white">
                SEARCH
            </button>
        </form>
    </nav>

    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>ADDRESS</th>
            <th>EMAIL</th>
            <th>PHONE NUMBER</th>
            <th>DATE OF BIRTH</th>

            <c:forEach items="${teachers}" var="teacher">
        <tr>
            <td><c:out value="${teacher.id}"></c:out></td>
            <td><c:out value="${teacher.name}"></c:out></td>
            <td><c:out value="${teacher.address}"></c:out></td>
            <td><c:out value="${teacher.email}"></c:out></td>
            <td><c:out value="${teacher.phoneNumber}"></c:out></td>
            <td><c:out value="${teacher.dateOfBirth}"></c:out></td>
            <td>
                <button class="editT" name="${teacher.id}" onclick="openFormEdit(this.className,this.name)">EDIT
                </button>
            </td>
            <td>
                <button><a href="/teachers?action=delete&id=${teacher.id}">DELETE</a></button>
            </td>
        </tr>
        </c:forEach>
    </table>
    <a>
        <button id="create" name="create" type="submit" onclick="openFormCreate(this.id)">
            ADD
        </button>
    </a>

    <form method="post" style="display: none" id="form-create" action="/teachers?action=create">
        <input name="name" type="text" placeholder="Name">
        <input name="address" type="text" placeholder="Address">
        <input name="email" type="email" placeholder="Email">
        <input name="phoneNumber" type="number" placeholder="Phone Number">
        <input name="dateOfBirth" type="text" placeholder="Date Of Birth">
        <button type="submit">
            ADD
        </button>
    </form>
    <form method="post" style="display: none" id="form-edit" action="/teachers?action=edit">
        <input name="name" type="text" placeholder="Name">
        <input name="address" type="text" placeholder="Address">
        <input name="email" type="email" placeholder="Email">
        <input name="phoneNumber" type="number" placeholder="Phone Number">
        <input name="dateOfBirth" type="text" placeholder="Date Of Birth">
        <a>
            <button type="submit">
                Edit
            </button>
        </a>

    </form>
</div>
<script>
    function openFormCreate(id) {
        let status = document.getElementById("form-create").style.display
        if (status == "none" && id == "create") {
            document.getElementById("form-create").style.display = "block"
        } else if (status == "none" && id == "editT") {
            document.getElementById("form-create").style.display = "block"
        } else {
            document.getElementById("form-create").style.display = "none"
        }

    }

    function openFormEdit(classname, name) {
        let status = document.getElementById("form-edit").style.display
        if (status == "none" && classname == "editT") {
            document.getElementById("form-edit").style.display = "block"
            document.getElementById("form-edit").action = "/teachers?action=edit&id=" + name
        } else {
            document.getElementById("form-edit").style.display = "none"
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>
</html>
