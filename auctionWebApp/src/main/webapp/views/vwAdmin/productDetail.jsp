<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Auction Web Application</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
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
                        <h4>Th???i gian c??n l???i <br>

                        </h4>

                        <p>
                            Gi?? hi???n t???i <br>
                            <fmt:formatNumber value="${product.price}" type="number" />
                        </p>
                    </div>
                </div>
                <div class="detail" style="font-size: 16px">
                    <h4 style="font-size: 24px" >
                        Th??ng tin chi ti???t s???n ph???m
                    </h4>
                    <p>
                        ${product.detail}
                    </p>
                </div>
            </div>
        </div>

        <div class="card-body" style="background-color: white; margin-top: 15px">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Product Id</th>
                    <th>User Id</th>
                    <th>Username</th>
                    <th>Gi??</th>
                    <th>Th???i gian</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${auctions}" var="a">
                    <tr>
                        <td>${a.idProduct}</td>
                        <td>${a.idUser}</td>
                        <td>${a.username}</td>
                        <td>${a.priceBidder}</td>
                        <td>${a.timeBid.dayOfMonth} / ${a.timeBid.month.value} / ${a.timeBid.year}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="footer bg-footer mt-5">
        <div class="container-fluid">
            <div class="contact">

                <h3>Li??n h??? v???i ch??ng t??i</h3>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
</body>
</html>