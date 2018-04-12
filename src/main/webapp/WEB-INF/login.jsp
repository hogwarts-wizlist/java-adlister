<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="WizList" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Henny+Penny" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <style>
        <%@ include file="/stylesheets/navbar.css"%>
        <%@ include file="/stylesheets/index.css"%>
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <h1>Please Log In</h1>
    <form action="/login" method="POST">

        <%--username field--%>
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <%--password field    --%>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
</div>
</body>
</html>
