<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<style>
    a {
        text-decoration: none;
    }

    #delete {
        width: 70px;
        height: 40px;
        background: red;
        color: white;
        border-radius: 10px;
    }

    #delete:hover {
        color: red;
        background-color: black;
        font-weight: bold;
    }

    .container {
        border: 1px solid black;
        margin-right: 0;
        margin-left: 0;
    }

    .navbar {
        background: pink;
    }

    .container-fluid {
        margin-top: 0;
        margin-bottom: 0;
        background: pink;
        padding-top: 0;
        padding-bottom: 0;

    }

    .content {
        min-height: 450px;
        line-height: 2.5;
    }

    #navbar-over-logo {
        margin: 0;
        padding-top: 0;
        padding-bottom: 0;
    }

    #home-page {
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }

    #home-page:hover {
        border: 3px solid yellow;
    }

    .logo-footer {
        width: 20px;
        height: 20px;
    }

    #logo {
        margin-left: 100px;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        border: 3px solid black;
    }

    #logo:hover {
        border: 3px solid yellow;
    }

    #submitUpdate {
        background-color: pink;
        border: 3px solid black;
        box-shadow: purple;
        color: black;
    }

    #submitUpdate:hover {
        background-color: yellow;
        color: red;
        /*font-weight: bold;*/
    }

    .scu {
        background-color: pink;
        border: 3px solid black;
        box-shadow: purple;
        border-radius: 10px;
    }

    .scu:hover {
        background-color: black;
        border: 3px solid yellow;
        box-shadow: purple;
        color: white;
        font-weight: bold;
    }

    #create {
        border-radius: 10px;
        background: aquamarine;
        color: black;
        font-weight: bold;
        margin-left: 50px;
        margin-right: 70px;
        border: 3px solid black;
    }

    #create:hover {
        background-color: #ff253a;
        border: 3px solid yellow;
    }

    #view {
        background-color: aquamarine;
        color: #ff253a;
    }

    #view:hover {
        background-color: greenyellow;
        color: black;
    }

    .modal-create-update {
        height: 100%;
        width: 100%;
        background: rgba(0, 0, 0, 0.4);
        position: fixed;
        top: 0;
        left: 0;
    }

    .modal-create-content {
        width: 35%;
        margin: 10% auto;
        background: white;
        padding: 20px;
        box-shadow: 0 4px 8px black;
        border-radius: 20px;
    }

    #btn-update {
        background-color: aquamarine;
        color: black;
        border-radius: 10px;
    }

    #btn-update:hover {
        background-color: orange;
        color: black;
        font-weight: bold;
        border-radius: 10px;
        border: 3px solid black;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<body>
<c:if test="${message!=null}">
    <p style="color: red"><c:out value="${message}"></c:out></p>
</c:if>
<div class="container">
    <div class="navbar">
        <nav id="navbar-over-logo" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a href="http://localhost:8080/"><img id="home-page"
                                                      src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd_3afwgUKrJzrFnkvKrPM_EbJPybl8NxD5vB-LaWjzY9uSefesphz-GBF02V1VQv7A4w&usqp=CAU">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a>
                                <button id="create" name="create" onclick="openFormCreate(this.id)">Create new student
                                </button>
                            </a>
                        </li>
                        <li class="nav-item">
                            <form>
                                <input style="border-radius: 10px" type="text" placeholder="Search" name="search">
                                <button class="scu">Search</button>
                            </form>
                        </li>
                    </ul>
                </div>
                <a class="navbar-brand" href="/students"><img id="logo"
                                                              src="https://thue.today/media/images/section/post/thumbnail/1537022290_ky-nang-lam-viec-nhom-hieu-qua.jpg"></a>
            </div>
        </nav>
    </div>
    <div class="content">
        <table class="table table-striped">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Date Of Birth</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach items="${studentList}" var="student">
                <tr>
                    <td><c:out value="${student.id}"/></td>
                    <td><c:out value="${student.name}"/></td>
                    <td><c:out value="${student.address}"/></td>
                    <td><c:out value="${student.email}"/></td>
                    <td><c:out value="${student.phoneNumber}"/></td>
                    <td><c:out value="${student.dOB}"/></td>
                    <td>
                        <button id="view" type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                            <a href="/students?action=view&id=${student.id}" style="text-decoration: none"
                            >View</a>
                        </button>
                    </td>
                    <td>
                        <button id="submitUpdate" type="button" class="btn btn-primary editT"
                                name="${student.id}" onclick="openFormEdit(this.className,this.name)">
                            Update
                        </button>
                    </td>
                    <td>
                        <button id="delete"><a style="color: white; text-decoration: none"
                                               href="/students?action=delete&id=${student.id}">Delete</a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <%--// Form update--%>
        <form method="post" style="display: none" id="form-edit">
            <div class="modal-create-update">
                <div class="modal-create-content">
                    <table>
                        <tr>
                            <th>Name</th>
                            <td><input name="name" type="text" placeholder="Name" value="${studentUpdate.name}"></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><input name="address" type="text" placeholder="Address"
                                       value="${studentUpdate.address}"></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><input name="email" type="email" placeholder="Email" value="${studentUpdate.email}">
                            </td>
                        </tr>
                        <tr>
                            <th>Phone Number</th>
                            <td><input name="phoneNumber" type="number" placeholder="Phone Number"
                                value="${studentUpdate.phoneNumber}">
                            </td>
                        </tr>
                        <tr>
                            <th>Date Of Birth</th>
                            <td><input name="dateOfBirth" type="date" placeholder="Date Of Birth"
                                       value="${studentUpdate.dOB}"></td>
                        </tr>
                        <tr>
                            <th>Class Id</th>
                            <td>
                                <select name="classId">
                                    <c:forEach items="${classesList}" var="classS">
                                        <option
                                                value="${classS.classId}"
                                        >
                                            <c:out value="${classS.className}"></c:out>
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Image</th>
                            <td><input name="image" type="text" placeholder="Image" value="${studentUpdate.getImage()}"></td>
                        </tr>
                        <tr>
                            <th>Practice</th>
                            <td><input name="practice" type="number" placeholder="Practice" value="${studentUpdate.getPractice()}">
                                <c:out value="${student.practice}"></c:out>
                            </td>
                        </tr>
                        <tr>
                            <th>Theory</th>
                            <td><input name="theory" type="number" placeholder="Theory" value="${studentUpdate.theory}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button id="btn-update" onclick="submitUpdate()">Update</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>

        <%--// Form create--%>
        <form method="post" style="display: none" id="form-create" action="/students?action=create">
            <div class="modal-create-update">
                <div class="modal-create-content">
                    <table>
                        <tr>
                            <th>Name</th>
                            <td><input name="name" type="text" placeholder="Name"></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><input name="address" type="text" placeholder="Address"></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><input name="email" type="email" placeholder="Email"></td>
                        </tr>
                        <tr>
                            <th>Phone Number</th>
                            <td><input name="phoneNumber" type="number" placeholder="Phone Number"
                            ></td>
                        </tr>
                        <tr>
                            <th>Date Of Birth</th>
                            <td><input name="dateOfBirth" type="date" placeholder="Date Of Birth"
                            ></td>
                        </tr>
                        <tr>
                            <th>Class Id</th>
                            <td>
                                <select name="classId">
                                    <c:forEach items="${classesList}" var="classS">
                                        <option
                                                value="${classS.classId}"
                                        >
                                            <c:out value="${classS.className}"></c:out>
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Image</th>
                            <td><input name="image" type="text" placeholder="Image"></td>
                        </tr>
                        <tr>
                            <th>Practice</th>
                            <td><input name="practice" type="number" placeholder="Practice">
                            </td>
                        </tr>
                        <tr>
                            <th>Theory</th>
                            <td><input name="theory" type="number" placeholder="Theory"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button class="scu">Create</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </div>
    <div class="footer">
        <footer class="bg-dark text-center text-white">
            <div class="container p-4 pb-0">
                <section class="mb-4">
                    <a target="_blank" class="btn btn-outline-light btn-floating m-1"
                       href="https://www.facebook.com/nguyentuanvu444/"
                       role="button"
                    >
                        <img class="logo-footer"
                             src="data:image/png;base64,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"><i
                            class="fab fa-facebook-f"></i
                    ></a>
                    <a target="_blank" class="btn btn-outline-light btn-floating m-1"
                       href="https://github.com/TUANVUCG/Module3_CASE_STUDY" role="button"
                    ><img class="logo-footer"
                          src="data:image/png;base64,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"><i
                            class="fab fa-github"></i
                    ></a>
                </section>
            </div>

            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                CASE STUDY :
                <a class="text-white">Team nâu hốp</a>
            </div>
        </footer>
    </div>
</div>
<script>
    function openFormCreate(id) {
        let status = document.getElementById("form-create").style.display;
        if (status == "none" && id == "create") {
            document.getElementById("form-create").style.display = "block";
        } else {
            document.getElementById("form-create").style.display = "none";
        }
    }
</script>
<script>
    function openFormEdit(classname, name) {
        let status = document.getElementById("form-edit").style.display
        if (status == "none" && classname == "btn btn-primary editT") {
            document.getElementById("form-edit").style.display = "block"
            document.getElementById("form-edit").action = "/students?action=update&id=" + name
        } else {
            document.getElementById("form-edit").style.display = "none"
        }

    }

    function submitUpdate() {
        let status = document.getElementById("classId").value
        document.getElementById("form-edit").action = document.getElementById("form-edit") + "classId=" + status
    }
</script>
<script>
    var myModal = document.getElementById('myModal')
    var myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
    })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossOrigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
</body>
</html>
