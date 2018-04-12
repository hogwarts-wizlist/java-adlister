
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="format navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">WizList</a>
        </div>


        <%--dynamic navbar--%>
        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/ads">View Ads</a></li>
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/create">Create</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </c:when>
            <c:otherwise>
             <ul class="nav navbar-nav navbar-right">
                <li><a href="/ads">View Ads</a></li>
                 <li><a href="/register">Register</a></li>
                 <li><a href="/login">Login</a></li>
             </ul>
            </c:otherwise>
        </c:choose>

    </div>
    </div>
</nav>

