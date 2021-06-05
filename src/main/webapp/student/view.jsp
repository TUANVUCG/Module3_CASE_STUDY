<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2021
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<h1>Update student</h1>
<a href="/students">Student List</a>
<form method="post">
    <table>
        <tr>
            <td></td>
            <td><input type="hidden" name="name" value="${student.id}"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${student.name}"></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><input type="text" name="address" value="${student.address}"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="${student.email}"></td>
        </tr>
        <tr>
            <td>Phone number</td>
            <td><input type="number" name="phoneNumber" value="${student.phoneNumber}"></td>
        </tr>
        <tr>
            <td>Date Of Birth</td>
            <td><input type="text" name="dateOfBirth" value="${student.dateOfBirth}"></td>
        </tr>
        <tr>
            <td>Class Id</td>
            <td><input type="text" name="classId" value="${student.classId}"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button>Update</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
