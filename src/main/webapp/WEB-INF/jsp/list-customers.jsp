<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Customers</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>Consumer Relationship Management </h2>
        </div>
    </div>

    <div id="container">
        <div id="content">

            <form:form action="search" method="POST">
                Search customer: <input type="text" name="name" />

                <input type="submit" value="Search" class="add-button" />
            </form:form>

            <input type="button" onclick="window.location.href='showFormForAddCustomer'; return false;" value="Add Customer" class="add-button"/>
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Phone</th>
                    <th>Actions</th>
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
                        <td> ${customer.age} </td>
                        <td> ${customer.phone} </td>
                        <td>
                            <a href="${updateLink}">Update</a>
                            |
                            <a href="${deleteLink}"
                            onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
