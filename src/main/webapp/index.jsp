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
    <div>
        <%--landing page video--%>
        <div class="video-container">
            <iframe class="main-video" src="https://player.vimeo.com/video/264284188?autoplay=1&loop=1&autopause=0" frameborder="0" ></iframe>
        </div>
    </div>
</div>

<%--<div class="container">--%>
            <%--<div class="browse">--%>
                <%--<a class="btn btn-primary btn-lg" href="/ads" role="button">Browse Ads</a>--%>
            <%--</div>--%>
<%--</div>--%>

</body>
</html>