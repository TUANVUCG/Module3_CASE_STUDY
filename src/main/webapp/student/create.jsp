<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/3/2021
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<h1>Create new student</h1>
<a href="/students">Student List</a>
<form method="post">
    <table>
    <tr>
        <td>Name</td>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
        <td>Address</td>
        <td><input type="text" name="address"></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><input type="text" name="email"></td>
    </tr>
    <tr>
        <td>Phone number</td>
        <td><input type="number" name="phoneNumber"></td>
    </tr>
    <tr>
        <td>Date Of Birth</td>
        <td><input type="text" name="dateOfBirth"></td>
    </tr><tr>
        <td>Class Id</td>
        <td><input type="text" name="classId"></td>
    </tr>
    <tr>
        <td></td>
        <td><button>Create</button></td>
    </tr>
    </table>
</form>
</body>
</html>
