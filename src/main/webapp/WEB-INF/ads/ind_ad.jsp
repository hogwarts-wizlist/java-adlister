
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
    <div>
        <div class="card col-md-5 col-md-offset-1">
            <div style="width: 350px; height: 350px; border: 4px solid #a59a22;">
            <img src="https://s8.favim.com/orig/72/lt3-lt3-hp-lt3-always-harry-potter-Favim.com-724166.jpg" alt="ad picture" width="100%">
            </div>
        </div>
        <div class="card-body individual-ad col-md-5">
            <h3 class="card-text">$<c:out value="${ad.price}"/></h3>
            <h3 class="card-title"><c:out value="${ad.title}"/></h3>
            <p class="card-text">Username: <c:out value="${ad.username}"/></p>
            <p class="card-text">Description: <c:out value="${ad.description}"/></p>
            <c:forEach var="cat" items="${ad.categories}">
                <p class="card-text">Category: <c:out value="${cat.title}"/></p>
            </c:forEach>
        </div>

        <div class="card-body">
            <%--<a href="/ads" class="card-link">Back to Ads</a>--%>
            <a href="/ads"><button class="btn btn-default center">Back to Ads</button></a>
        </div>
        </div>
    </div>
</main>
</body>
</html>
