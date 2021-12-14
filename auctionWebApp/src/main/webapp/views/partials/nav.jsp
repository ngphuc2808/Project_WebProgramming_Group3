<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<c:choose>
    <c:when test="${auth}">
        <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/account/logout"></form>
        <div class="d-flex bd-highlight navbar-dark bg-dark justify-content-end" style="color: white; font-size: 14px">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                Welcome <b>${authUser.name}!</b>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/account/profile">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                    Sign Out
                </a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="d-flex bd-highlight navbar-dark bg-dark justify-content-end" style="color: white; font-size: 14px">
            <a class="p-2 myHover" href="${pageContext.request.contextPath}/account/login" style="color: white">Login</a>
            <a class="p-2 mr-2 myHover" href="${pageContext.request.contextPath}/account/register" style="color: white">Register</a>
        </div>
    </c:otherwise>
</c:choose>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <a class="navbar-brand" style="margin-left: 230px" href="#">Auction.com</a>
    <div class="collapse navbar-collapse" style="margin-right: 230px" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Phone</a>
                    <a class="dropdown-item" href="#">Laptop</a>
                    <a class="dropdown-item" href="#">Tablet</a>
                    <a class="dropdown-item" href="#">Camera</a>
                    <a class="dropdown-item" href="#">Perfume</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" style="width: 51vw" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>