
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
                    <input type="checkbox" id="wands" name="category" value="wands">
                    <label for="wands">Wands</label>
                </div>
                <div>
                    <input type="checkbox" id="potions" name="category" value="potions">
                    <label for="potions">Potions</label>
                </div>
            </div>
            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="creatures" name="category" value="creatures">
                    <label for="creatures">Creatures</label>
                </div>
                <div>
                    <input type="checkbox" id="robes" name="category" value="robes">
                    <label for="robes">Robes</label>
                </div>
            </div>

            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="brooms" name="category" value="brooms">
                    <label for="brooms">Brooms</label>
                </div>
                <div>
                    <input type="checkbox" id="subscriptions" name="category" value="subscriptions">
                    <label for="subscriptions">Subscriptions</label>
                </div>
            </div>

            <div class="col-md-2">
                <div>
                    <input type="checkbox" id="spells" name="category" value="spells">
                    <label for="spells">Spells</label>
                </div>
                <div>
                    <input type="checkbox" id="misc" name="category" value="misc">
                    <label for="misc">Misc</label>
                </div>
            </div>
        </div>

        <div class="col-md-2">
            <div>
                <input type="checkbox" id="services" name="category" value="services">
                <label for="services">Services</label>
            </div>
            <div>
                <input type="checkbox" id="books" name="category" value="books">
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
