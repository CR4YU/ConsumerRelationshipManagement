<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Customers</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
<div id="container">
    <h1 id="title">Consumer Relationship Management</h1>

    <div class="row no-gutters">
        <div class="col-12 col-sm-6 col-md-8"><h2 id="section">All customers</h2></div>
        <div class="col-6 col-md-4">
            <div id="user-section">
                <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                    <i style="margin-right: 10px;font-size:24px" class="fa fa-user"></i><security:authentication property="principal.username" />
                    <input type="submit" value="Logout" class="button" />
                </form:form>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-8">
            <form:form action="search" method="POST">
                <label><input type="text" name="name" placeholder="By name or email" class="input"/><input type="submit" value="&#128269;" class="button" /></label>
            </form:form>
        </div>
        <div class="col-4">
        <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
            <input type="button" onclick="window.location.href='addCustomer'; return false;" value="&#10010;" class="button" id="button-add"/>
        </security:authorize>
    </div>
    </div>

    <table class="table">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Birth date</th>
            <th>Phone</th>
            <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
            <th style="text-align: center">Actions</th>
            </security:authorize>
        </tr>

        <c:forEach var="customer" items="${customers}">
            <c:url var="updateLink" value="/customer/updateCustomer">
                <c:param name="customerId" value="${customer.id}"/>
            </c:url>

            <c:url var="deleteLink" value="/customer/deleteCustomer">
                <c:param name="customerId" value="${customer.id}"/>
            </c:url>
            <tr>
                <td> ${customer.firstName} </td>
                <td> ${customer.lastName} </td>
                <td> ${customer.email} </td>
                <td> ${customer.dateOfBirth} </td>
                <td> ${customer.phone} </td>
                <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                <td style="text-align: center">
                    <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                    <input type="button" onclick="window.location.href='${updateLink}'; return false;" value="&#9998;" class="button" />
                    </security:authorize>
                    <security:authorize access="hasAnyRole('ADMIN')">
                        <input type="button" onclick="if (confirm('Are you sure you want to delete this customer?')) window.location.href='${deleteLink}'; return false;" value="&#9986;" class="button"/>
                    </security:authorize>
                </td>
                </security:authorize>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
