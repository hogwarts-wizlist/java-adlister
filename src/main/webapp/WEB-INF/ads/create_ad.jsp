
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

<%--title, description, price, low_price, high_price, ad_image--%>
<%--POST request--%>

<div class="form-container">
    <h1>Create an Ad:</h1>
    <form action="/ads/create" method="POST">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" value="${title}"type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" value="${description}" type="textarea">
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" value="${price}" type="number">
        </div>
        <div class="form-group">
            <label for="low-price">Low Price</label>
            <input id="low-price" name="low-price" class="form-control" value="${low_price}" type="number">
        </div>
        <div class="form-group">
            <label for="high-price">High Price</label>
            <input id="high-price" name="high-price" class="form-control" value="${high_price}" type="number">
        </div>
        <div class="form-group">
        <input type="file" name="pic" accept="image/*">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Submit">
    </form>
</div>





</body>
</html>
