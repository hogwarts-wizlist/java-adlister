
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
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--POST request--%>

<div class="container">
    <h1>Create an Ad:</h1>
    <p class="error">*All fields are required</p>
    <form action="/create" method="POST">

        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" value="${title}"type="text" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" value="${description}" type="textarea" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" value="${price}" type="number" required>
        </div>

        <div>
            <h4>Categories:</h4>
            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="wands" name="c1" value="1">
                    <label for="wands">Wands</label>
                </div>
                <div>
                    <input type="checkbox" id="potions" name="c2" value="2">
                    <label for="potions">Potions</label>
                </div>
            </div>
            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="creatures" name="c3" value="3">
                    <label for="creatures">Creatures</label>
                </div>
                <div>
                    <input type="checkbox" id="robes" name="c4" value="4">
                    <label for="robes">Robes</label>
                </div>
            </div>

            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="brooms" name="c5" value="5">
                    <label for="brooms">Brooms</label>
                </div>
                <div>
                    <input type="checkbox" id="subscriptions" name="c6" value="6">
                    <label for="subscriptions">Subscriptions</label>
                </div>
            </div>

            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="spells" name="c7" value="7">
                    <label for="spells">Spells</label>
                </div>
                <div>
                    <input type="checkbox" id="misc" name="c8" value="8">
                    <label for="misc">Misc</label>
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div>
                <input type="checkbox" id="services" name="c9" value="9">
                <label for="services">Services</label>
            </div>
            <div>
                <input type="checkbox" id="books" name="c10" value="10">
                <label for="books">Books</label>
            </div>
        </div>


        <%--form for image; doesn't upload--%>
        <%--<div class="form-group">--%>
            <%--<input type="file" name="pic" accept="image/*">--%>
        <%--</div>--%>
        <input type="submit" class="btn btn-primary btn-block" value="Submit">
    </form>
</div>





</body>
</html>
