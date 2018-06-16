<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Save Customer</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/add-customer-style.css">

</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>Consumer Relationship Management</h2>
    </div>
</div>

<div id="container">
    <h3>Save Customer</h3>
    <form:form action="saveCustomer" modelAttribute="customer" method="post">
        <form:hidden path="id"/>
        <table>
            <tbody>
                <tr>
                    <td><labe>First name:</labe></td>
                    <td><form:input path="firstName"/></td>
                </tr>

                <tr>
                    <td><labe>Last name:</labe></td>
                    <td><form:input path="lastName"/></td>
                </tr>

                <tr>
                    <td><labe>Age:</labe></td>
                    <td><form:input value="" path="age"/></td>
                </tr>

                <tr>
                    <td><labe>Email:</labe></td>
                    <td><form:input path="email"/></td>
                </tr>

                <tr>
                    <td><labe>Phone:</labe></td>
                    <td><form:input path="phone"/></td>
                </tr>

                <tr>
                    <td><labe></labe></td>
                    <td><input type="submit" value="Save" class="save"/></td>
                </tr>
            </tbody>
        </table>
    </form:form>

    <div style="clear; both;"></div>
    <p>
        <a href="${pageContext.request.contextPath}/customer/list">Back to list</a>
    </p>
</div>
</body>
</html>
