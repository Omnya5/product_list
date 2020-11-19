<%@ page import="pl.strzygowska.product_list.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product list</title>
    <link href="https://fonts.googleapis.com/css?family=Lato: 100,300,400,700|Luckiest+Guy|Oxygen:300,400"
          rel="stylesheet">
    <link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 style="text-align: center">List of items</h1>

<form action="/add" method="get" style="text-align: center">
    <input type="submit" value="Add new product"/>
</form>

    <div id="table">
        <table>
            <thead>
            <tr>
                <th style="text-align: center">ID</th>
                <th style="text-align: center">Item's name</th>
                <th style="text-align: center">Price</th>
                <th style="text-align: center">Edit</th>
                <th style="text-align: center">Delete</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td><c:out value="${item.id }"/></td>
                    <td><c:out value="${item.name }"/></td>
                    <td><c:out value="${item.price }"/></td>
                    <td>
                        <c:url var="editUrl" value="/add-del">
                            <c:param name="id" value="${item.id}"/>
                            <c:param name="name" value="${item.name}"/>
                            <c:param name="price" value="${item.price}"/>

                        </c:url>
                        <a href="${editUrl}">edit</a>
                    </td>
                    <td>
                        <c:url var="delUrl" value="/deleteItem">
                            <c:param name="id" value="${item.id}"/>
                        </c:url>
                        <a href="${delUrl}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <br>

    <div style="text-align: center;">
        <h3>Find product:</h3>
        <form action="getItem">
            <label for="search">Id of product:</label>
            <br>
            <input id="search" name="id" type="number" maxlength="40">
            <br>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>