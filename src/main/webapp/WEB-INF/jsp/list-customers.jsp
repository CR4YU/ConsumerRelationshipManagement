<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Customers</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<div id="container">
    <h1 id="title">Consumer Relationship Management</h1>
    <div class="row">
        <div class="col"></div>
        <div class="col"><h2 id="section">All customers</h2></div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col-8">
            <form:form action="search" method="POST">
                <label><input type="text" name="name" placeholder="By name or email" class="input"/><input type="submit" value="&#128269;" class="button" /></label>
            </form:form>

        </div>
        <div class="col-4">
            <input type="button" onclick="window.location.href='showFormForAddCustomer'; return false;" value="&#10010;" class="button" id="button-add"/>
        </div>
    </div>

    <table class="table">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Birth date</th>
            <th>Phone</th>
            <th style="text-align: center">Actions</th>
        </tr>

        <c:forEach var="customer" items="${customers}">
            <c:url var="updateLink" value="/customer/showFormForUpdateCustomer">
                <c:param name="customerId" value="${customer.id}"/>
            </c:url>

            <c:url var="deleteLink" value="/customer/delete">
                <c:param name="customerId" value="${customer.id}"/>
            </c:url>
            <tr>
                <td> ${customer.firstName} </td>
                <td> ${customer.lastName} </td>
                <td> ${customer.email} </td>
                <td> ${customer.dateOfBirth} </td>
                <td> ${customer.phone} </td>
                <td style="text-align: center">
                    <input type="button" onclick="window.location.href='${updateLink}'; return false;" value="&#9998;" class="button" />
                    <input type="button" onclick="if (confirm('Are you sure you want to delete this customer?')) window.location.href='${deleteLink}'; return false;" value="&#9986;" class="button"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
