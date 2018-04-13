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


<div class="container-fluid">
    <div class="col-md-3 side-menu-public">
        <div class="center">
            <h3 class="center">Welcome to </h3><h3><c:out value="${user.username}"/>'s profile!</h3>
        <%--<img src="${user.profile_pic}" alt="${user.username}">--%>
            <div style="width: 200px; height: 200px; margin-bottom: 20px; margin-top: 20px;">
                <img src="https://avatarfiles.alphacoders.com/121/121391.jpg" alt="Profile picture" width="100%" class="rounded-image">
            </div>
        <ul class="list-unstyled">
            <li>Member since: <c:out value="${user.created_at}"/></li>
        </ul>
        </div>
    </div>



    <div class="col-md-offset-4">
    <c:choose>
        <c:when test="${empty user.ads}">
            <h2><c:out value="${user.username}"/> doesn't have any ads</h2>
        </c:when>
        <c:otherwise>
            <c:forEach items="${user.ads}" var="ad">
            <div class="col-md-6 ad">
                <div style="width: 150px; height: 150px;">
                    <img src="https://s8.favim.com/orig/72/lt3-lt3-hp-lt3-always-harry-potter-Favim.com-724166.jpg" alt="ad picture" width="100%">
                </div>
                <h3><c:out value="${ad.title}"/></h3>
                <p><c:out value="${ad.description}"/></p>
                <p>$<c:out value="${ad.price}"/></p>
            </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    </div>




</div>


</body>
</html>
