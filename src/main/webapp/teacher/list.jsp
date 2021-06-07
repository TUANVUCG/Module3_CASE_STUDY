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

        .input {
            width: 350px;
            padding-left: 30px;
            border-radius: 5px;
            outline: none;
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
            width: 600px;
            height: 80vh;
            padding: 30px 0;
        }

        .form-center {
            margin: 20px auto;
            width: 600px;
            height: 90vh;
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
            display: flex;
            justify-content: space-between;
        }

        .button {
            background-color: rgb(13, 110, 253);
            color: white;
            width: 124px;
        }
    </style>
</head>
<body>
<div>
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
        <button id="create" name="create" type="submit" onclick="openFormCreate(this.id)" class="button">
            ADD
        </button>
        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>ADDRESS</th>
                <th></th>
                <c:forEach items="${teachers}" var="teacher">
            <tr>
                <td onclick="openView(${teacher.id})"><c:out value="${teacher.id}"></c:out></td>
                <td onclick="openView(${teacher.id})"><c:out value="${teacher.name}"></c:out></td>
                <td onclick="openView(${teacher.id})"><c:out value="${teacher.address}"></c:out></td>
                <td>
                    <button name="id" class="button">
                        <a href="/teachers?action=delete&id=${teacher.id}">DELETE</a>
                    </button>
                </td>
            </tr>

            </c:forEach>
            <c:forEach items="${teachers}" var="teacher">
                <div style="display: none" class="modal" id="<c:out value="${teacher.id}"></c:out>">

                    <div class="modal__overlay" onclick="openView(${teacher.id})">

                    </div>

                    <div class="modal__body" style="width: 500px;height: 70vh">

                        <div class="card" style="width: 30rem;">
                            <img class="card-img-top" style="width: 300px;height: 20vh;display: block;margin: 0 auto"
                                 id="img-${teacher.id}"
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
                                        <span class="card-text" id="name-${teacher.id}">
                                        <c:out value="${teacher.name}"></c:out></span>
                                    </li>
                                    <li class="card-item">
                                        <h1 class="card-heading">EMAIL</h1>
                                        <span class="card-text" id="email-${teacher.id}">
                                        <c:out value="${teacher.email}"></c:out>
                                    </span>
                                    </li>
                                    <li class="card-item">
                                        <h1 class="card-heading">ADDRESS</h1>
                                        <span class="card-text" id="address-${teacher.id}">
                                        <c:out value="${teacher.address}"></c:out>
                                    </span>
                                    </li>
                                    <li class="card-item">
                                        <h1 class="card-heading">PHONE</h1>
                                        <span class="card-text" id="phone-${teacher.id}">
                                        <c:out value="${teacher.phoneNumber}"></c:out>
                                </span>
                                    </li>
                                    <li class="card-item">
                                        <h1 class="card-heading">DATE</h1>
                                        <span class="card-text" id="date-${teacher.id}">
                                        <c:out value="${teacher.dateOfBirth}"></c:out>
                                    </span>
                                    </li>
                                </ul>
                                <button type="submit" class="button" onclick="openFormEdit(${teacher.id})">
                                    Edit
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </table>
        <div style="display: none" class="modal" id="form-create">

            <div class="modal__overlay" onclick="openView('form-create')">

            </div>

            <div class="modal__body" style="width: 600px;height: 80vh">
                <form method="post" style="" action="/teachers?action=create"
                      class="form-center">
                    <h1>FORM CREATE</h1>
                    <div class="input-create">
                        <h1 class="card-heading">NAME</h1>
                        <input class="input" name="name" type="text" placeholder="Name">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">ADDRESS</h1>
                        <input class="input" name="address" type="text" placeholder="Address">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">EMAIL</h1>
                        <input class="input" name="email" type="email" placeholder="Email">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">PHONE</h1>
                        <input class="input" name="phoneNumber" type="number" placeholder="Phone Number">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">DATE</h1>
                        <input class="input" name="dateOfBirth" type="text" placeholder="Date Of Birth">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">URL IMG</h1>
                        <input class="input" id="input-url" name="urlImg" type="url" placeholder="IMG">
                    </div>
                    <button type="submit" onclick="setUrlImg()" class="button">ADD
                    </button>
                </form>
            </div>
        </div>


        <div style="display: none" class="modal" id="modal-edit">

            <div class="modal__overlay" onclick="openView('modal-edit')">

            </div>

            <div class="modal__body" style="width: 600px;height: 80vh">
                <form method="post" action="/teachers?action=edit" class="form-center" id="form-edit">
                    <h1>FORM EDIT</h1>
                    <div class="input-create">
                        <h1 class="card-heading">NAME</h1>
                        <input class="input" id="edit-name" name="name" type="text" placeholder="Name">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">ADDRESS</h1>
                        <input class="input" id="edit-address" name="address" type="text" placeholder="Address">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">EMAIL</h1>
                        <input class="input" id="edit-email" name="email" type="email" placeholder="Email">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">PHONE</h1>
                        <input class="input" id="edit-phone" name="phoneNumber" type="number"
                               placeholder="Phone Number">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">DATE</h1>
                        <input class="input" id="edit-date" name="dateOfBirth" type="text" placeholder="Date Of Birth">
                    </div>
                    <div class="input-create">
                        <h1 class="card-heading">URL IMG</h1>
                        <input class="input" id="edit-url" name="urlImg" type="url" placeholder="IMG">
                    </div>

                    <a>
                        <button type="submit" class="button">
                            Edit
                        </button>
                    </a>

                </form>
            </div>
        </div>


    </div>
</div>
<footer class="text-center text-white" style="background-color: #caced1; margin-top: 37vh;position: relative">

    <div class="container p-4">

        <section class="">
            <div class="row">
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbootstrap.com/img/new/fluid/city/113.jpg"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbootstrap.com/img/new/fluid/city/111.jpg"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbootstrap.com/img/new/fluid/city/112.jpg"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbootstrap.com/img/new/fluid/city/114.jpg"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbootstrap.com/img/new/fluid/city/115.jpg"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
                    <div
                            class="bg-image hover-overlay ripple shadow-1-strong rounded"
                            data-ripple-color="light"
                    >
                        <img
                                src="https://mdbootstrap.com/img/new/fluid/city/116.jpg"
                                class="w-100"
                        />
                        <a href="#!">
                            <div
                                    class="mask"
                                    style="background-color: rgba(251, 251, 251, 0.2);"
                            ></div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © Tran Trung Kien 2021:
        <a class="text-white" href="https://www.facebook.com/trungkien.tran.75098/">TrungKien.com</a>
    </div>
</footer>
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

    function openFormEdit(name) {
        let status = document.getElementById("modal-edit").style.display
        if (status == "none") {
            document.getElementById("modal-edit").style.display = "block"
            document.getElementById("form-edit").action = "/teachers?action=edit&id=" + name
            document.getElementById("edit-name").value = document.getElementById("name-" + name).innerText
            document.getElementById("edit-email").value = document.getElementById("email-" + name).innerText
            document.getElementById("edit-address").value = document.getElementById("address-" + name).innerText
            document.getElementById("edit-phone").value = document.getElementById("phone-" + name).innerText
            document.getElementById("edit-date").value = document.getElementById("date-" + name).innerText
            document.getElementById("edit-url").value = document.getElementById("img-" + name).src
        } else {
            document.getElementById("modal-edit").style.display = "none"
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