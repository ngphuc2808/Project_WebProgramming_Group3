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
        <a class="navbar-brand" style="margin-left: 230px" href="${pageContext.request.contextPath}/home">Auction.com</a>
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
    <div class="container-fluid mt-3" >
        <div class="row mt-3">
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body" >
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block" src="data:image/jpg;base64,${product.image2}" style="height: 450px; width: 100%;object-fit: contain" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block" src="data:image/jpg;base64,${product.image3}" style="height: 450px; width: 100%;object-fit: contain" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block" src="data:image/jpg;base64,${product.image4}" style="height: 450px; width: 100%;object-fit: contain" alt="Third slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <h3>${product.nameProduct}</h3>
                        <form action="" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="txtProductID" name="idProduct" style="margin-top:10px;width: 90px" readonly value="${product.idProduct}">
                            </div>
                            <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/admin/deleteProduct">
                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                Delete
                            </button>
                        </form>
                    </div>
                    <div class="card-body" style="font-size: 18px">
                        <h4>Thời gian còn lại <br>

                        </h4>

                        <p>
                            Giá hiện tại <br>
                            <fmt:formatNumber value="${product.price}" type="number" />
                        </p>
                        <p>
                            Người giữ giá <br>
                        </p>

                        <button class="btn btn-primary" style="font-size: 20px">
                            <img src="${pageContext.request.contextPath}/public/image/daugia.png" alt="" >
                            Đấu giá
                        </button>
                    </div>
                </div>
                <div class="detail" style="font-size: 16px">
                    <h4 style="font-size: 24px" >
                        Thông tin chi tiết sản phẩm
                    </h4>
                    <p>
                        ${product.detail}
                    </p>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <table class="table">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Người dùng</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thời gian</th>
                </tr>
                </thead>
                <tbody style="background: white">
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
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