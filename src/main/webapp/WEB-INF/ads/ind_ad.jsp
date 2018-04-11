
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Henny+Penny" rel="stylesheet">
    <style>
    <%@ include file="/stylesheets/navbar.css"%>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--<c:out value="${ad}"/>--%>
    <div class="col-md-3">

    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="..." alt="Card image cap">
        <div class="card-body">
            <h2 class="card-title"><c:out value="${ad.title}"/></h2>
            <%--<p class="card-text"><c:out value="${ad.username}"/></p>--%>
            <p class="card-text"><c:out value="${ad.price}"/></p>
            <p class="card-text"><c:out value="${ad.description}"/></p>
        </div>
        <div class="card-body">
            <a href="/ads" class="card-link">Back to Ads</a>
        </div>
    </div>
</body>
</html>
