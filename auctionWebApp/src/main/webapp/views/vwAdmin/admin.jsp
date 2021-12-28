<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="authAdmin" scope="session" type="com.auction.auctionwebapp.beans.admin" />
<jsp:useBean id="users" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.user>"/>
<jsp:useBean id="users1" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.user>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Auction Web Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles.css" />
    <style>
        #pagination {
            display: flex;
            display: -webkit-flex; /* Safari 8 */
            flex-wrap: wrap;
            -webkit-flex-wrap: wrap; /* Safari 8 */
            justify-content: center;
            -webkit-justify-content: center;
        }
    </style>
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
        <a class="navbar-brand" style="margin-left: 230px" href="${pageContext.request.contextPath}/home">Auction.com</a>
        <div class="collapse navbar-collapse" style="margin-right: 230px" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                        Danh mục quản lý
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <button class="dropdown-item" onclick="showInformation()">Quản lý dannh sách người dùng</button>
                        <button class="dropdown-item" onclick="showPermission()">Đơn xin đăng bán</button>
                        <button class="dropdown-item" onclick="showProduct()">Quản lý danh sách sản phẩm</button>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" style="width: 51vw" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <div class="container-fluid mt-3" style="height: 100vh; overflow: auto">
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
                    <button class="list-group-item list-group-item-action" onclick="showProduct()">
                        Quản lý danh sách sản phẩm
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
                                                <i class="fa fa-pen" aria-hidden="true"></i>
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
                <div class="col-sm-9" style="display: none; height: 100%;" id="viewProduct">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between ">
                            Sản phẩm
                        </h4>
                        <div class="card-body d-flex " style="flex-wrap: wrap">
                            <c:forEach items="${products}" var="p">
                                <c:choose>
                                    <c:when test="${p.timeInserted < 100}">
                                        <div class="col-sm-4 mb-3 " style="color: red" >
                                            <div class="card h-100 contentPage">
                                                <div class="card-body">
                                                    <img src="data:image/jpg;base64,${p.image1}" alt="" style="height: 250px;">
                                                    <h6 class="card-title mt-4">${p.nameProduct}</h6>
                                                    <h5 class="card-title text-danger">
                                                        <fmt:formatNumber value="${p.price}" type="number" />
                                                    </h5>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/admin/adminDetails?id=${p.idProduct}" role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                                    <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                                        <img src="${pageContext.request.contextPath}/public/image/bid.png" alt="" style="width: 18px;height: 18px;">
                                                        <fmt:formatNumber value="${p.priceStep}" type="number" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-sm-4 mb-3 " >
                                            <div class="card h-100 contentPage">
                                                <div class="card-body">
                                                    <img src="data:image/jpg;base64,${p.image1}" alt="" style="height: 250px;">
                                                    <h6 class="card-title mt-4">${p.nameProduct}</h6>
                                                    <h5 class="card-title text-danger">
                                                        <fmt:formatNumber value="${p.price}" type="number" />
                                                    </h5>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-sm btn-outline-primary" href="#" role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                                    <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                                        <img src="${pageContext.request.contextPath}/public/image/bid.png" alt="" style="width: 18px;height: 18px;">
                                                        <fmt:formatNumber value="${p.priceStep}" type="number" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="card-footer">
                            <ul id="pagination"></ul>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <div class="footer bg-footer mt-5">
        <div class="container-fluid">
            <div class="contact">

                <h3>Liên hệ với chúng tôi</h3>
                <ul>
                    <li><a href=""><i class="fab fa-facebook"></i></a></li>
                    <li><a href=""><i class="fab fa-instagram"></i></a></li>
                    <li><a href=""><i class="fab fa-twitter"></i></a></li>
                    <li><a href=""><i class="fas fa-phone-alt"></i></a></li>
                </ul>
            </div>

            <div class="designBy">
                <span>Design by</span>
                <ul>
                    <li>Quynh Nhut</li>
                    <li>Hoang Phuc</li>
                    <li>Bich Tram</li>
                    <li>Nguyen Huy</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script>
    function showInformation(){
        document.getElementById("information").style.display = "block";
        document.getElementById("permission").style.display = "none";
        document.getElementById("viewProduct").style.display = "none";
    }
    function showPermission(){
        document.getElementById("viewProduct").style.display = "none";
        document.getElementById("information").style.display = "none";
        document.getElementById("permission").style.display = "block";
    }
    function showProduct(){
        document.getElementById("information").style.display = "none";
        document.getElementById("permission").style.display = "none";
        document.getElementById("viewProduct").style.display = "block";
    }
</script>
<script type="text/javascript">
    $(function () {
        var pageSize = 6;
        showPage = function (page) {
            $(".contentPage").hide();
            $(".contentPage").each(function (n) {
                if (n >= pageSize * (page - 1) && n < pageSize * page)
                    $(this).show();

            });
        }
        showPage(1);
        ///** Cần truyền giá trị vào đây **///
        var totalRows = 40; // Tổng số sản phẩm hiển thị
        var btnPage = 3; // Số nút bấm hiển thị di chuyển trang
        var iTotalPages = Math.ceil(totalRows / pageSize);

        var obj = $('#pagination').twbsPagination({
            totalPages: iTotalPages,
            visiblePages: btnPage,
            onPageClick: function (event, page) {
                console.info(page);
                showPage(page);
            }
        });
        console.info(obj.data());
    });
</script>
</body>
</html>