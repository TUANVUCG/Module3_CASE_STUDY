<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student List</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<body>
<h1>Student List</h1>
<a href="/students?action=create">Create New Student</a>
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
    </tr>
    <c:forEach items="${studentList}" var="student">
        <tr>
            <td><c:out value="${student.id}"/></td>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.address}"/></td>
            <td><c:out value="${student.email}"/></td>
            <td><c:out value="${student.phoneNumber}"/></td>
            <td><c:out value="${student.dOB}"/></td>
            <td><a href="/students?action=update&id=${student.id}">Update</a></td>
            <td><a href="/students?action=delete&id=${student.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<a>
    <button id="create" name="create" onclick="openFormCreate(this.id)">Create</button>
</a>
<form method="post" style="display: none" id="form-create" action="/students?action=create">
    <input name="name" type="text" placeholder="Name">
    <input name="address" type="text" placeholder="Address">
    <input name="email" type="text" placeholder="Email">
    <input name="phoneNumber" type="text" placeholder="Phone Number">
    <input name="dateOfBirth" type="text" placeholder="Date Of Birth">
    <input name="classId" type="number" placeholder="ClassId">
    <button>Create</button>
</form>
<script>
    function openFormCreate(id){
        let status = document.getElementById("form-create").style.display;
        if(status=="none"&&id=="create"){
            document.getElementById("form-create").style.display="block";
        }
        else {
            document.getElementById("form-create").style.display="none";
        }
    }
</script>
</body>
</html>
