<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authAdmin" scope="session" type="com.auction.auctionwebapp.beans.admin" />
<jsp:useBean id="user" scope="request" type="com.auction.auctionwebapp.beans.user"/>
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
    <div class="container-fluid mt-3">
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
            <div class="col-sm-9" style="display: block" id="information">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Thông tin
                    </h4>
                    <form action="" method="post">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="txtUserID">ID</label>
                                <input type="text" class="form-control" id="txtUserID" name="idUser" readonly value="${user.idUser}">
                            </div>
                            <div class="form-group">
                                <label for="txtUsername">Username</label>
                                <input type="text" class="form-control" id="txtUsername" name="username" autofocus value="${user.username}">
                            </div>
                            <div class="form-group">
                                <label for="txtName">Name</label>
                                <input type="text" class="form-control" id="txtName" name="name" autofocus value="${user.name}">
                            </div>
                            <div class="form-group">
                                <label for="txtEmail">Email</label>
                                <input type="text" class="form-control" id="txtEmail" name="email" autofocus value="${user.email}">
                            </div>
                            <div class="form-group">
                                <label for="txtPermission">Permission</label>
                                <input type="text" class="form-control" id="txtPermission" name="queue" autofocus value="${user.queue}">
                            </div>
                        </div>
                        <div class="card-footer">
                            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin" role="button">
                                <i class="fa fa-backward" aria-hidden="true"></i>
                                Back
                            </a>
                            <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/admin/delete">
                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                Delete
                            </button>
                            <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/admin/update">
                                <i class="fa fa-check" aria-hidden="true"></i>
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</body>
</html>