<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="teacher/style.css" rel="stylesheet">
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
            padding: 20px 20px;
        }

        .card {
            margin: 40px auto;
            width: 500px;
            height: 70vh;
        }

        .form-center {
            margin: 40px auto;
            width: 500px;
            height: 70vh;
            background-color: white;
            text-align: center;
            padding: 30px 0;
        }

        .card-heading {
            display: inline-block;
            left: 0;
            font-size: 36px;
        }

        #card-list {
            padding-left: 0;
            list-style: none;
        }

        .card-item {
            display: flex;
            justify-content: space-between;
        }

        .card-text {
            font-size: 20px;
        }
        .input-create {
            margin: 30px;
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
            <c:forEach items="${teachers}" var="teacher">
        <tr>
            <td><c:out value="${teacher.id}"></c:out></td>
            <td><c:out value="${teacher.name}"></c:out></td>
            <td><c:out value="${teacher.address}"></c:out></td>
            <td>
                <button onclick="openView(${teacher.id})">VIEW</button>
            </td>

        </tr>
        </c:forEach>
        <c:forEach items="${teachers}" var="teacher">
            <div style="display: none" class="modal" id="<c:out value="${teacher.id}"></c:out>">

                <div class="modal__overlay" onclick="openView(${teacher.id})">

                </div>

                <div class="modal__body"  style="width: 500px;height: 70vh">

                    <div class="card" style="width: 30rem;">
                        <img class="card-img-top" style="width: 300px;height: 20vh;display: block;margin: 0 auto"
                             src="https://i.pinimg.com/236x/16/b2/e2/16b2e2579118bf6fba3b56523583117f.jpg"
                             alt="Avatar">
                        <div class="card-body" style="text-align: center">
                            <ul id="card-list">
                                <li class="card-item">
                                    <h1 class="card-heading">ID</h1>
                                    <span class="card-text"><c:out value="${teacher.id}"></c:out></span>
                                </li>
                                <li class="card-item">
                                    <h1 class="card-heading">NAME</h1>
                                    <span class="card-text">
                                        <c:out value="${teacher.name}"></c:out></span>
                                </li>
                                <li class="card-item">
                                    <h1 class="card-heading">EMAIL</h1>
                                    <span class="card-text">
                                        <c:out value="${teacher.email}"></c:out>
                                    </span>
                                </li>
                                <li class="card-item">
                                    <h1 class="card-heading">ADDRESS</h1>
                                    <span class="card-text">
                                        <c:out value="${teacher.address}"></c:out>
                                    </span>
                                </li>
                                <li class="card-item">
                                    <h1 class="card-heading">PHONE</h1>
                                    <span class="card-text">
                                        <c:out value="${teacher.phoneNumber}"></c:out>
                                </span>
                                </li>
                                <li class="card-item">
                                    <h1 class="card-heading">DATE</h1>
                                    <span class="card-text">
                                        <c:out value="${teacher.dateOfBirth}"></c:out>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </c:forEach>
    </table>
    <a>
        <button id="create" name="create" type="submit" onclick="openFormCreate(this.id)">
            ADD
        </button>
    </a>


    <div style="display: none" class="modal" id="form-create">

        <div class="modal__overlay" onclick="openView('form-create')">

        </div>

        <div class="modal__body"  style="width: 500px;height: 70vh">
            <form method="post" style="" action="/teachers?action=create"
                  class="form-center" >
                <h1>FORM CREATE</h1>
                <div class="input-create"><input name="name" type="text" placeholder="Name"></div>
                <div class="input-create"><input name="address" type="text" placeholder="Address"></div>
                <div class="input-create"><input name="email" type="email" placeholder="Email"></div>
                <div class="input-create"><input name="phoneNumber" type="number" placeholder="Phone Number"></div>
                <div class="input-create"><input name="dateOfBirth" type="text" placeholder="Date Of Birth"></div>
                <div class="input-create"><input id="input-url" name="urlImg" type="url" placeholder="IMG"></div>
                <button type="submit" onclick="setUrlImg()">ADD
                </button>
            </form>
        </div>
    </div>


    <form method="post" style="display: none" id="form-edit" action="/teachers?action=edit">
        <input name="name" type="text" placeholder="Name">
        <input name="address" type="text" placeholder="Address">
        <input name="email" type="email" placeholder="Email">
        <input name="phoneNumber" type="number" placeholder="Phone Number">
        <input name="dateOfBirth" type="text" placeholder="Date Of Birth">
        <input id="edit-url" name="urlImg" type="url" placeholder="IMG">
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

    function openView(id) {
        let status = document.getElementById(id).style.display
        if (status == "none") {
            document.getElementById(id).style.display = "block"
        } else {
            document.getElementById(id).style.display = "none"
        }
    }

    function setUrlImg() {
        let input = document.getElementById("input-url").value;
        if (input.length == 0) {
            document.getElementById("input-url").value = "https://i.pinimg.com/236x/16/b2/e2/16b2e2579118bf6fba3b56523583117f.jpg"
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>
</html>