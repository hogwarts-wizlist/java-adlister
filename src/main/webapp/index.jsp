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
    <%--<h1>Welcome to the Adlister!</h1>--%>

    <div class="col-md-6">
        <%--landing page video--%>
        <iframe src="https://player.vimeo.com/video/264284188?autoplay=1&loop=1&autopause=0" width="600" height="360" frameborder="0"  allowfullscreen></iframe>

    </div>


</div>
</body>
</html>