<%--
  Created by IntelliJ IDEA.
  User: paulina
  Date: 03/11/2020
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new product</title>
</head>
<body>
<h3>Add product:</h3>
<form action="addItem" method="post">
    <label for="name">Name of product:</label>
    <br>
    <input id="name" name="name" type="text" maxlength="40" pattern="[a-zA-Z]+">
    <br>
    <label for="price">Price:</label>
    <br>
    <input id="price" name="price" type="number" step="0.01" min="0" maxlength="15"
           pattern="[0-9]{1-10}[/.[0-9]{2}]?">
    <br><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
