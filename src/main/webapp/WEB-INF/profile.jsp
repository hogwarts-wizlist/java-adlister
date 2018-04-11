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

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2>Welcome <c:out value="${user.username}"/>user.username</h2>
            <img src="${user.profile_pic}" alt="Profile picture">
            <ul class="list-unstyled">
                <li>My email: <c:out value="${user.email}"/>user.email</li>
                <li>Member since: <c:out value="${user.created_at}"/>user.created_at</li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 text-center">
            <ul class="list-inline">
                <li><button class="btn btn-default">Faves</button></li>
                <li><button class="btn btn-default">My Ads</button></li>
            </ul>
        </div>
    </div>


    <%--For Each Favorited Ad--%>
    <div class="row" style="margin: 50px auto">
        <div class="col-md-10 col-md-offset-1">
            <div class="col-md-3">
                <img src="#" alt="Ad Picture">
                <h3><c:out value="${ad.title}"/>ad.title</h3>
                <p><c:out value="${ad.description}"/>ad.description </p>
                <h4><c:out value="${ad.created_at}"/>ad.created_at</h4>
                <a href="#"><button class="btn btn-danger">unfave</button></a>
            </div>
        </div>
    </div>

    <%--My Ads--%>
    <div class="row" style="margin: 50px auto">
        <div class="col-md-offset-1 col-md-10">
            <div class="col-md-3">
                <img src="#" alt="Ad Picture">
                <h3><c:out value="${ad.title}"/>ad.title</h3>
                <p><c:out value="${ad.description}"/>ad.description </p>
                <h4><c:out value="${ad.created_at}"/>ad.created_at</h4>
                <a href="#"><button class="btn btn-primary">Edit</button></a>
            </div>
            <div class="col-md-3">
                <img src="#" alt="Ad Picture">
                <h3><c:out value="${ad.title}"/>ad.title</h3>
                <p><c:out value="${ad.description}"/>ad.description </p>
                <h4><c:out value="${ad.created_at}"/>ad.created_at</h4>
                <a href="#"><button class="btn btn-primary">Edit</button></a>
            </div>
            <div class="col-md-3">
                <img src="#" alt="Ad Picture">
                <h3><c:out value="${ad.title}"/>ad.title</h3>
                <p><c:out value="${ad.description}"/>ad.description </p>
                <h4><c:out value="${ad.created_at}"/>ad.created_at</h4>
                <a href="#"><button class="btn btn-primary">Edit</button></a>
            </div>
            <div class="col-md-3">
                <img src="#" alt="Ad Picture">
                <h3><c:out value="${ad.title}"/>ad.title</h3>
                <p><c:out value="${ad.description}"/>ad.description </p>
                <h4><c:out value="${ad.created_at}"/>ad.created_at</h4>
                <a href="#"><button class="btn btn-primary">Edit</button></a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
