<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${user.username}" />
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
        <div class="col-md-3 side-menu-profile">
            <div class="profile-content">
            <h2>Welcome, <c:out value="${user.username}"/>!</h2>
            <%--<img src="${user.profile_pic}" alt="Profile picture">--%>
            <div style="width: 200px; height: 200px; margin-bottom: 20px;">
                <img src="https://avatarfiles.alphacoders.com/121/121391.jpg" alt="Profile picture" width="100%" class="rounded-image">
            </div>

            <ul class="list-unstyled">
                <li>My email: <c:out value="${user.email}"/></li>
                <li>Member since: <c:out value="${user.created_at}"/></li>
                <li><button class="btn btn-default center">Update Profile</button></li>
            </ul>
            </div>
        </div>


    <%--<div class="row">--%>
        <%--<div class="col-xs-12 text-center">--%>
            <%--<ul class="list-inline">--%>
                <%--<li><button class="btn btn-default">My Ads</button></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>


    <%--For Each Favorited Ad--%>
    <%--<div class="row" style="margin: 50px auto">--%>
        <%--<div class="col-md-10 col-md-offset-1">--%>
            <%--<div class="col-md-3">--%>
                <%--<img src="#" alt="Ad Picture">--%>
                <%--<h3><c:out value="${ad.title}"/></h3>--%>
                <%--<p><c:out value="${ad.description}"/></p>--%>
                <%--<h4><c:out value="${ad.created_at}"/></h4>--%>
                <%--<a href="#"><button class="btn btn-danger">Delete</button></a>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--My Ads--%>

        <div class="col-md-offset-4 ad">
            <c:forEach items="${user.ads}" var="ad">
                <div class="col-md-4">
                    <div style="width: 100px; height: 100px;">
                        <img src="https://s8.favim.com/orig/72/lt3-lt3-hp-lt3-always-harry-potter-Favim.com-724166.jpg" alt="ad picture" width="100%">
                    </div>
                    <h4>Title: <c:out value="${ad.title}"/></h4>
                    <h5>Description: <c:out value="${ad.description}"/></h5>
                    <h5>Created At: <c:out value="${ad.created_at}"/></h5>
                    <a href="#"><button class="btn btn-primary">Edit</button></a>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

</body>
</html>
