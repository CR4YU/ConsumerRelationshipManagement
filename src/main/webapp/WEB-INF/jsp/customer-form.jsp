<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Save Customer</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/add-customer-style.css">
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
        <div class="col"><h2 id="section">Save Customer</h2></div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="form-style-2">
                <form:form action="saveCustomer" modelAttribute="customer" method="post">
                    <form:hidden path="id"/>
                    <label><span>First name<span class="required"></span></span><form:input path="firstName" class="input" /></label>
                    <label><span>Last name<span class="required"></span></span><form:input path="lastName" class="input" /></label>
                    <label><span>Email<span class="required"></span></span><form:input path="email" class="input" /></label>
                    <label><span>Age<span class="required"></span></span><form:input path="age" class="input" /></label>
                    <label><span>Telephone<span class="required"></span></span><form:input path="phone" class="input" /></label>
                    <label><span>&nbsp;</span><input type="submit" value="Save" class="button"/></label>
                </form:form>
            </div>
        </div>
    </div>



    <div class="col">
        <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/customer/list'; return false;" value="&#127968;" class="button" />
    </div>


</div>
</body>
</html>



























<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<title>Save Customer</title>--%>

    <%--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">--%>
    <%--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/add-customer-style.css">--%>

<%--</head>--%>
<%--<body>--%>
<%--<div id="wrapper">--%>
    <%--<div id="header">--%>
        <%--<h2>Consumer Relationship Management</h2>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<div id="container">--%>
    <%--<h3>Save Customer</h3>--%>
    <%--<form:form action="saveCustomer" modelAttribute="customer" method="post">--%>
        <%--<form:hidden path="id"/>--%>
        <%--<table>--%>
            <%--<tbody>--%>
                <%--<tr>--%>
                    <%--<td><labe>First name:</labe></td>--%>
                    <%--<td><form:input path="firstName"/></td>--%>
                <%--</tr>--%>

                <%--<tr>--%>
                    <%--<td><labe>Last name:</labe></td>--%>
                    <%--<td><form:input path="lastName"/></td>--%>
                <%--</tr>--%>

                <%--<tr>--%>
                    <%--<td><labe>Age:</labe></td>--%>
                    <%--<td><form:input value="" path="age"/></td>--%>
                <%--</tr>--%>

                <%--<tr>--%>
                    <%--<td><labe>Email:</labe></td>--%>
                    <%--<td><form:input path="email"/></td>--%>
                <%--</tr>--%>

                <%--<tr>--%>
                    <%--<td><labe>Phone:</labe></td>--%>
                    <%--<td><form:input path="phone"/></td>--%>
                <%--</tr>--%>

                <%--<tr>--%>
                    <%--<td><labe></labe></td>--%>
                    <%--<td><input type="submit" value="Save" class="save"/></td>--%>
                <%--</tr>--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</form:form>--%>

    <%--<div style="clear: both;"></div>--%>
    <%--<p>--%>
        <%--<a href="${pageContext.request.contextPath}/customer/list">Back to list</a>--%>
    <%--</p>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
