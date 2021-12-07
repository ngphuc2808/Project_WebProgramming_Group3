<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="h" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.category>"/>
<i:main>
    <jsp:body>
        <div class="container-fluid" style="width: 75vw">
            <div id="myDiv" class="mx-auto mt-3 d-flex justify-content-between" style="width: 75vw">
                <div id="carouselExampleIndicators" class="carousel slide" style="width: 50%; height: 100vh" data-ride="carousel">
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
                        <div class="card-footer" style="background-color: powderblue; font-weight: bold">${h.nameCategory}</div>
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
    </jsp:body>
</i:main>