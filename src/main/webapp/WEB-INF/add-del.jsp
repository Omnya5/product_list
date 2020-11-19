<%--
  Created by IntelliJ IDEA.
  User: paulina
  Date: 03/11/2020
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add, edit or delete product</title>
</head>
<body>


<br><br>
<div style="text-align: center">
    <h3>EDIT product:</h3>
    <form action="editItem" align="center">
        <input type="hidden" name="id" value="${param.id}"/>

        <table style="margin-left: auto; margin-right: auto;">
            <tr>
                <td>
                    <label for="name">Name of product:</label>
                </td>
                <td>
                    <input id="name" name="name" value="${param.name}" type="text" maxlength="40" pattern="[a-zA-Z]+">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="price">Price:</label>
                </td>
                <td>
                    <input id="price" name="price" value="${param.price}" type="number" step="0.01" min="0" maxlength="15"
               pattern="[0-9]{1-10}[/.[0-9]{2}]?">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Submit">
    </form>
</div>


</body>
</html>
