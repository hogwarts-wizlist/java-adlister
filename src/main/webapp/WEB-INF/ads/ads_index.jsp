
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

<form class="navbar-form navbar-left">
    <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
</form>

<div>
<c:forEach var="ad" items="${ads}">
    <div class="col-md-3">
        <div class="card" style="width: 18rem;">
            <img class="card-img-top" src=".." alt="ad">
            <div class="card-body">
                <h2 class="card-title">${ad.title}</h2>
                <p class="card-text">${ad.username}</p>
                <p class="card-text">${ad.price}</p>
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
