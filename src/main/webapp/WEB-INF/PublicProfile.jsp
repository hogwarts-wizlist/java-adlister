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
        <%@ include file="/stylesheets/index.css"%>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />


<div class="container">
    <h1>This profile belongs to <c:out value="${user.username}"/></h1>
    <img src="${user.profile_pic}" alt="${user.username}">
    <ul class="list-unstyled">
        <li>Member since: <c:out value="${user.created_at}"/></li>
    </ul>



    <c:choose>
        <c:when test="${empty user.ads}">
            <h2><c:out value="${user.username}"/> doesn't have any ads</h2>
        </c:when>
        <c:otherwise>
            <c:forEach items="${user.ads}" var="ad">
                <h3><c:out value="${ad.title}"/> <a class="btn btn-lg" href="/index.jsp" role="button">&#9889;</a></h3>
                <p><c:out value="${ad.description}"/></p>
                <p><c:out value="${ad.price}"/></p>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>


</body>
</html>
