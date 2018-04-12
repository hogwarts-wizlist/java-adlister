
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
<body class="container">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="col-md-4 side-menu">
    <%--search menu for ads--%>
    <div class="search-bar">
        <form class="search-bar navbar-form navbar-left">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Search</button>
        </form>
    </div>
    <%--category list--%>
    <div>
        <h3>Categories:</h3>
        <ul>
            <li><a href="#">Wands</a></li>
            <li><a href="#">Potions</a></li>
            <li><a href="#">Creatures</a></li>
            <li><a href="#">Robes</a></li>
            <li><a href="#">Brooms</a></li>
            <li><a href="#">Subscriptions</a></li>
            <li><a href="#">Spells</a></li>
            <li><a href="#">Misc</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Books</a></li>
        </ul>
    </div>
</div>

<%--placeholder image--%>
            <%--<img src="../../img/hp_ad.jpg">--%>

<%--each ad--%>
<div class="col-md-offset-4">
<c:forEach var="ad" items="${ads}">
    <div class="col-md-5">
        <div class="card card-format">
            <div class="card-body">
                <h4 class="card-title">${ad.title} <a class="btn btn-lg" href="/index.jsp" role="button">&#9889;</a></h4>
                <p class="card-text">$${ad.price}</p>
                <p class="card-text username">${ad.username}</p>
            </div>
            <div class="card-body">
                <a href="/ad?id=${ad.id}" class="card-link">More Details</a>
            </div>
        </div>
    </div>
</c:forEach>
</div>



</body>
</html>
