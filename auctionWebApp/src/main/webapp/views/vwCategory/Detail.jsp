<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<i:main>

    <jsp:body>
        <div class="container-fluid mt-3">
            <div class="row">
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
                                        <img class="d-block w-100" src="${pageContext.request.contextPath}/public/image/product/ip12.png" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${pageContext.request.contextPath}/public/image/product/ip12.png" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${pageContext.request.contextPath}/public/image/product/ip12.png" alt="Third slide">
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
                            <h3>Ten san pham</h3>
                        </div>
                        <div class="card-body">
                            <h4>Thoi gian con lai <br>
                                00:00:00
                            </h4>

                            <p>
                                Gia hien tai <br>
                                <fmt:formatNumber value="100000" type="number" />
                            </p>
                            <p>
                                Nguoi giu gia <br>
                                Tram
                            </p>

                            <button class="btn btn-primary">
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
                    <tbody class="">
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

            <div class="detail">
                <h4>
                    Thông tin chi tiết sản phẩm
                </h4>
                <p>
                    Noi dung chi tiet san pham
                </p>
            </div>
        </div>
    </jsp:body>
</i:main>