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
<a href="/student/view.jsp">
    <button id="view" name="view">View</button>
</a>
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
<<<<<<< HEAD
                <button type="button" class="btn btn-primary view" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        name="${student.id}" formmethod="get">
                    <a href="/students?action=view"></a>View
                </button>
                <button type="button" class="btn btn-primary editT" data-bs-toggle="modal" data-bs-target="#exampleModal"
=======
                <button id="submitUpdate" type="button" class="btn btn-primary editT" data-bs-toggle="modal" data-bs-target="#exampleModal"
>>>>>>> 6bb8eed6a11f1b8212d1feada83371eaeb01a31d
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
<<<<<<< HEAD
    <input name="email" type="email" placeholder="Email" value="${student.email}">
    <input name="phoneNumber" type="number" placeholder="Phone Number" value="${student.phoneNumber}">
    <input name="dateOfBirth" type="date" placeholder="Date Of Birth" value="${student.dOB}">
    <input name="classId" type="number" placeholder="Class Id" value="${student.classId}">
    <button>Update</button>
=======
    <input name="email" type="text" placeholder="Email" value="${student.email}">
    <input name="phoneNumber" type="text" placeholder="Phone Number" value="${student.phoneNumber}">
    <input name="dateOfBirth" type="text" placeholder="Date Of Birth" value="${student.dOB}">
    <select id ="classId">ClassId
        <c:forEach items="${classList}" var="Sclass">
        <option><c:out value="${Sclass.getValue}"></c:out>
        </option>
        </c:forEach>
    </select>
    <button onclick="submitUpdate()">Update</button>
>>>>>>> 6bb8eed6a11f1b8212d1feada83371eaeb01a31d
</form>


<%--// Form create--%>
<form method="post" style="display: none" id="form-create" action="/students?action=create">
    <input name="name" type="text" placeholder="Name">
    <input name="address" type="text" placeholder="Address">
<<<<<<< HEAD
    <input name="email" type="email" placeholder="Email">
    <input name="phoneNumber" type="number" placeholder="Phone Number">
    <input name="dateOfBirth" type="date" placeholder="Date Of Birth">
    <select name="classId">
=======
    <input name="email" type="text" placeholder="Email">
    <input name="phoneNumber" type="text" placeholder="Phone Number">
    <input name="dateOfBirth" type="text" placeholder="Date Of Birth">
    <select name="classId" >
>>>>>>> 6bb8eed6a11f1b8212d1feada83371eaeb01a31d
        <option selected disabled>ClassId</option>
        <c:forEach items="${classList}" var="Sclass">
            <option><c:out value="${Sclass}"></c:out> </option>
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
    function submitUpdate(){
        let status = document.getElementById("classId").value
        document.getElementById("form-edit").action = document.getElementById("form-edit")+"classId="+status
    }


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

</body>
</html>
