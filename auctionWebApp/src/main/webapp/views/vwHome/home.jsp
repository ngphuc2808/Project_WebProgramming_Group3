<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="h" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.category>"/>

<i:main>
    <jsp:attribute name="css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </jsp:attribute>
    <jsp:body>
        <div class="container-fluid" style="width: 75vw">
            <div id="myDiv" class="mx-auto mt-3 d-flex justify-content-between" style="width: 75vw">
                <div id="carouselExampleIndicators" style="width: 50%;" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/public/image/iphone.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/public/image/laptop.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/public/image/camera.jpg" alt="Third slide">
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
                <div class="ml-3" style="width: 50%; height: 400px">
                    <div style="height: 197px; margin-bottom: 6px">
                        <img style="width: 100%; height: 100%" src="${pageContext.request.contextPath}/public/image/thongbao.jpg" alt="thongbao" type="button">
                    </div>
                    <div style="height: 197px;">
                        <img style="width: 100%; height: 100%" src="${pageContext.request.contextPath}/public/image/auction.jpg" alt="thongbao" type="button">
                    </div>
                </div>
            </div>
            <div class="mx-auto mt-5 d-flex justify-content-between" style="width: 75vw">
                <h:forEach items="${categories}" var="h">
                    <div class="card h-100" style="width: 14rem;border-radius: 0" type="button">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/public/image/${h.idCategory}/main_pic.jpg" alt="Card image cap">
                        <div class="card-footer" style="background-color: powderblue; font-weight: bold; text-align: center">
                            <a href="${pageContext.request.contextPath}/search?category=${h.idCategory}">${h.nameCategory}</a>
                        </div>
                    </div>
                </h:forEach>
            </div>
            <div class="mx-auto" style="width: 75vw">
                <div class="card mt-5">
                    <div class="card-header textDiv">
                        About to expire!!!
                    </div>
                    <div class="card-body">

                    </div>
                </div>
                <div class="card mt-5">
                    <div class="card-header textDiv">
                        Hot!!!
                    </div>
                    <div class="card-body">

                    </div>
                </div>
                <div class="card mt-5">
                    <div class="card-header textDiv">
                        The highest prices !!!
                    </div>
                    <div class="card-body">

                    </div>
                </div>
            </div>
        </div>

        <div class="footer bg-footer">
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