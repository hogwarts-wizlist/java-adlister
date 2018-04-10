
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="WizList" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Henny+Penny" rel="stylesheet">
    <style>
        <%@ include file="/stylesheets/navbar.css"%>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

title, description, price, low_price, high_price, ad_image
POST request

<div class="form-container">
    <h1>Please Log In</h1>
    <form action="/ads/create" method="POST">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <%--<div class="form-group">--%>
            <%--<label for="password">Password</label>--%>
            <%--<input id="password" name="password" class="form-control" type="password">--%>
        <%--</div>--%>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
</div>





</body>
</html>
