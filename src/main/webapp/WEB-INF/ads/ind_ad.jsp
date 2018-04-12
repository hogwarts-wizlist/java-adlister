
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
    <%@ include file="/stylesheets/index.css"%>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<%--<c:out value="${ad}"/>--%>

<main class="container">
    <div class="col-md-6">
    <div class="card">
        <img class="card-img-top" src="..." alt="Card image cap">
        <div class="card-body">
            <h2 class="card-title"><c:out value="${ad.title}"/></h2>
            <p class="card-text"><c:out value="${ad.username}"/></p>
            <p class="card-text"><c:out value="${ad.price}"/></p>
            <p class="card-text"><c:out value="${ad.description}"/></p>
            <c:forEach var="cat" items="${ad.categories}">
                <p class="card-text"><c:out value="${cat.title}"/></p>
            </c:forEach>
        </div>
        <div class="card-body">
            <a href="/ads" class="card-link">Back to Ads</a>
        </div>
        </div>
    </div>
</main>
</body>
</html>
