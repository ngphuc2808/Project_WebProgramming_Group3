<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authAdmin" scope="session" type="com.auction.auctionwebapp.beans.admin" />
<jsp:useBean id="users" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.user>"/>
<jsp:useBean id="users1" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.user>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Auction Web Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles.css" />
</head>
<body>
<div id="divMain">
    <c:choose>
        <c:when test="${authAd}">
            <form id="frmAdminLogout" method="post" action="${pageContext.request.contextPath}/admin/logout"></form>
            <div class="d-flex bd-highlight navbar-dark bg-dark justify-content-end" style="color: white; font-size: 14px">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Welcome <b>${authAdmin.nameAdmin}!</b>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="javascript: $('#frmAdminLogout').submit()">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                        Sign Out
                    </a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="d-flex bd-highlight navbar-dark bg-dark justify-content-end" style="color: white; font-size: 14px">
                <a class="p-2 myHover" href="${pageContext.request.contextPath}/admin/login" style="color: white">Login</a>
            </div>
        </c:otherwise>
    </c:choose>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
        <a class="navbar-brand" style="margin-left: 230px" href="#">Auction.com</a>
        <div class="collapse navbar-collapse" style="margin-right: 230px" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                        Danh mục quản lý
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <button class="dropdown-item" onclick="showInformation()">Quản lý dannh sách người dùng</button>
                        <button class="dropdown-item" onclick="showPermission()">Đơn xin đăng bán</button>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" style="width: 51vw" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <div class="container-fluid mt-3" style="height: 100vh">
        <div class="row">
            <div class="col-sm-3">
                <div class="card">
                    <h4 class="card-header">
                        Danh mục quản lý
                    </h4>
                    <button class="list-group-item list-group-item-action" onclick="showInformation()">
                        Quản lý danh sách người dùng
                    </button>
                    <button class="list-group-item list-group-item-action" onclick="showPermission()">
                        Đơn xin đăng bán
                    </button>
                </div>
            </div>
<%--            <c:if test="${hasError}">--%>
                <div class="col-sm-9" style="display: block" id="information">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between">
                            Thông tin
                        </h4>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Permission</th>
                                    <th>&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users}" var="u">
                                    <tr>
                                        <td>${u.idUser}</td>
                                        <td>${u.username}</td>
                                        <td>${u.name}</td>
                                        <td>${u.email}</td>
                                        <td>${u.queue}</td>
                                        <td class="text-right">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/admin/edit?id=${u.idUser}" role="button">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9" style="display: none" id="permission">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between">
                            Danh sách xin cấp quyền
                        </h4>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Permission</th>
                                    <th>&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users1}" var="u1">
                                    <tr>
                                        <td>${u1.idUser}</td>
                                        <td>${u1.username}</td>
                                        <td>${u1.name}</td>
                                        <td>${u1.email}</td>
                                        <td>${u1.queue}</td>
                                        <td class="text-right">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/admin/edit?id=${u1.idUser}" role="button">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<script>
    function showInformation(){
        document.getElementById("information").style.display = "block";
        document.getElementById("permission").style.display = "none";
    }
    function showPermission(){
        document.getElementById("information").style.display = "none";
        document.getElementById("permission").style.display = "block";
    }
</script>
</body>
</html>