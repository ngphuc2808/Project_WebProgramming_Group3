<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Auction Web Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <a class="navbar-brand" style="margin-left: 230px" href="${pageContext.request.contextPath}/admin/index">Auction.com</a>
        <div class="collapse navbar-collapse" style="margin-right: 230px" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/index">
                        Back
                    </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/admin/search" method="get">
                <input class="form-control mr-sm-2" style="width: 51vw" type="search" name="txtSearch" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-sm-3">
                <div class="card">
                    <h4 class="card-header">
                        Danh mục sản phẩm
                    </h4>
                    <div class="list-group list-group-flush">
                        <c:forEach items="${categories}" var="c">
                            <a href="${pageContext.request.contextPath}/admin/byCatAdmin?id=${c.idCategory}" class="list-group-item list-group-item-action">
                                <i class="fa fa-caret-right" aria-hidden="true"></i>
                                    ${c.nameCategory}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-sm-9" style="height: 100vh; overflow: auto">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between ">
                        Sản phẩm
                    </h4>
                    <div class="card-body d-flex " style="flex-wrap: wrap">

                        <c:forEach items="${products}" var="p">
                            <c:choose>
                                <c:when test="${p.timeInserted < 3}">
                                    <div class="col-sm-4 mb-3 " style="color: red" >
                                        <div class="card h-100 contentPage">
                                            <div class="card-body">

                                                <img src="data:image/jpg;base64,${p.image1}" alt="" style="height: 250px; margin: auto">
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

                                                <img src="data:image/jpg;base64,${p.image1}" alt="" style="height: 250px; margin: auto">
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
</body>
</html>