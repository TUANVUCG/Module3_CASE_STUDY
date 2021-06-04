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
</style>
<body>
<h1>Student List</h1>
<a>
    <button id="create" name="create" onclick="openFormCreate(this.id)">Create new student</button>
</a>
<form>
    <input type="text" placeholder="Search" name="search">
    <button>Search</button>
</form>
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
                <button type="button" class="btn btn-primary editT" data-bs-toggle="modal" data-bs-target="#exampleModal"
                       name="${student.id}" onclick="openFormEdit(this.className,this.name)">
                    Update
                </button>

            <td><a href="/students?action=delete&id=${student.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>


<%--// Form update--%>
<form method="post" style="display: none" id="form-edit">
    <input name="name" type="text" placeholder="Name" value="${student.name}">
    <input name="address" type="text" placeholder="Address" value="${student.address}">
    <input name="email" type="text" placeholder="Email" value="${student.email}">
    <input name="phoneNumber" type="text" placeholder="Phone Number" value="${student.phoneNumber}">
    <input name="dateOfBirth" type="text" placeholder="Date Of Birth" value="${student.dOB}">
    <input name="classId" type="text" placeholder="Class Id" value="${student.classId}">
    <button>Update</button>
</form>


<%--// Form create--%>
<form method="post" style="display: none" id="form-create" action="/students?action=create">
    <input name="name" type="text" placeholder="Name">
    <input name="address" type="text" placeholder="Address">
    <input name="email" type="text" placeholder="Email">
    <input name="phoneNumber" type="text" placeholder="Phone Number">
    <input name="dateOfBirth" type="text" placeholder="Date Of Birth">
    <select name="classId">
        <option selected disabled>ClassId</option>
        <c:forEach items="${studentList}" var="student">
            <option>${student.classId}</option>
        </c:forEach>
    </select>
    <button>Create</button>
</form>
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
    function openFormEdit(classname,name) {
        let status = document.getElementById("form-edit").style.display
        if (status == "none" && classname == "btn btn-primary editT") {
            document.getElementById("form-edit").style.display = "block"
            document.getElementById("form-edit").action = "/students?action=update&id="+ name
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
