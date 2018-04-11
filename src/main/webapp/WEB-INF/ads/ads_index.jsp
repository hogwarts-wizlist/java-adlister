<%--
  Created by IntelliJ IDEA.
  User: BettinaTrejo
  Date: 4/9/18
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
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

<c:forEach var="ad" items="${ads}">
    <div class="col-md-3">

        <div class="card" style="width: 18rem;">
            <img class="card-img-top" src="..." alt="Card image cap">
            <div class="card-body">
                <h2 class="card-title">${ad.title}</h2>
                <p class="card-text">${ad.username}</p>
                <p class="card-text">${ad.price}</p>
            </div>
            <div class="card-body">
                <a href="/ad?id=${ad.id}" class="card-link">More Details</a>
            </div>
        </div>


        <%--<h2>${ad.title}</h2>--%>
        <%--<p>${ad.username}</p>--%>
        <%--<p>$${ad.price}</p>--%>
        <%--<p>${ad.description}</p>--%>
    </div>
</c:forEach>



</body>
</html>
