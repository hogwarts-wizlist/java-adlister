<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="WizList" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Henny+Penny" rel="stylesheet">    <style>
        <%@ include file="/stylesheets/navbar.css"%>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Welcome to the Adlister!</h1>


    <%--placeholder for movie--%>
    <iframe width="100%" height="425" src="https://www.youtube.com/embed/JaVEdi3MtPo?
    autoplay=1&controls=0&showinfo=0&loop=1&rel=0" frameborder="0" allowfullscreen></iframe>



</div>
</body>
</html>