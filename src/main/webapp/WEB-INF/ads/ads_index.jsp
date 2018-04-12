
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="WizList" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Henny+Penny" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <style>
        <%@ include file="/stylesheets/navbar.css"%>
        <%@ include file="/stylesheets/index.css"%>
    </style>
</head>
<body class="container">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="col-md-4 side-menu">
    <%--search menu for ads--%>
    <div class="search-bar">
        <form class="search-bar navbar-form navbar-left">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Search</button>
        </form>
    </div>
    <%--category list--%>
    <div>

        <fieldset>
            <legend>Categories:</legend>
            <div>
                <input type="checkbox" id="wands" name="category" value="wands">
                <label for="wands">Wands</label>
            </div>
            <div>
                <input type="checkbox" id="potions" name="category" value="potions">
                <label for="potions">Potions</label>
            </div>
            <div>
                <input type="checkbox" id="creatures" name="category" value="creatures">
                <label for="creatures">Creatures</label>
            </div>
            <div>
                <input type="checkbox" id="robes" name="category" value="robes">
                <label for="robes">Robes</label>
            </div>
            <div>
                <input type="checkbox" id="brooms" name="category" value="brooms">
                <label for="brooms">Brooms</label>
            </div>
            <div>
                <input type="checkbox" id="subscriptions" name="category" value="subscriptions">
                <label for="subscriptions">Subscriptions</label>
            </div>
            <div>
                <input type="checkbox" id="spells" name="category" value="spells">
                <label for="spells">Spells</label>
            </div>
            <div>
                <input type="checkbox" id="misc" name="category" value="misc">
                <label for="misc">Misc</label>
            </div>
            <div>
                <input type="checkbox" id="services" name="category" value="services">
                <label for="services">Services</label>
            </div>
            <div>
                <input type="checkbox" id="books" name="category" value="books">
                <label for="books">Books</label>
            </div>
        </fieldset>
    </div>
</div>

<%--placeholder image--%>
            <%--<img src="../../img/hp_ad.jpg">--%>

<%--each ad--%>
<div class="col-md-offset-4">
<c:forEach var="ad" items="${ads}">
    <div class="col-md-5">
        <div class="card card-format">
            <div class="card-body">
                <h4 class="card-title">${ad.title} <a class="btn btn-lg" href="/index.jsp" role="button">&#9889;</a></h4>
                <p class="card-text">$${ad.price}</p>
                <p class="card-text username"><a href="/publicprofile?username=${ad.username}">${ad.username}</a></p>
                <c:forEach items="${ad.categories}" var="cat">
                    <p>${cat.title}</p>
                </c:forEach>
            </div>
            <div class="card-body">
                <a href="/ad?id=${ad.id}" class="card-link">More Details</a>
            </div>
        </div>
    </div>
</c:forEach>
</div>



</body>
</html>
