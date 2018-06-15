<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Customers</title>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>CRM</h2>
        </div>
    </div>

    <div id="container">
        <div id="content">
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Phone</th>
                </tr>

                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td> ${customer.firstName} </td>
                        <td> ${customer.lastName} </td>
                        <td> ${customer.email} </td>
                        <td> ${customer.age} </td>
                        <td> ${customer.phone} </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
