<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="product" scope="request" type="com.auction.auctionwebapp.beans.Product"/>

<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/styles.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </jsp:attribute>

    <jsp:attribute name="js">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </jsp:attribute>
    <jsp:body>
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
                                        <img class="d-block w-100" src="data:image/jpg;base64,${product.image2}" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="data:image/jpg;base64,${product.image3}" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="data:image/jpg;base64,${product.image4}" alt="Third slide">
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
                        <div class="card-header">
                            <h3>${product.nameProduct}</h3>
                        </div>
                        <div class="card-body" style="font-size: 18px">
                            <h4>Thoi gian con lai <br>

                            </h4>

                            <p>
                                Gia hien tai <br>
                                <fmt:formatNumber value="${product.price}" type="number" />
                            </p>
                            <p>
                                Nguoi giu gia <br>

                            </p>

                            <button class="btn btn-primary" style="font-size: 20px">
                                <img src="${pageContext.request.contextPath}/public/image/daugia.png" alt="" >
                                Đấu giá
                            </button>
                        </div>

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

            <div class="detail" style="font-size: 16px">
                <h4 style="font-size: 24px" >
                    Thông tin chi tiết sản phẩm
                </h4>
                <p>
                        ${product.detail}
                </p>
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
    </jsp:body>
</i:main>