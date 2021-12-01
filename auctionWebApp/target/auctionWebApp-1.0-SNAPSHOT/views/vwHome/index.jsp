<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<i:main>
    <jsp:body>
        <div class="mx-auto mt-5 w-75 d-flex">
            <div class="w-50 h-100">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
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
            </div>
            <div class="w-50 ml-3" style="height: 400px;">
                <div style="height: 49%; margin-bottom: 8px">
                    <img width="100%" height="100%" src="${pageContext.request.contextPath}/public/image/thongbao.jpg" alt="thongbao" type="button">
                </div>
                <div style="height: 49%;">
                    <img width="100%" height="100%" src="${pageContext.request.contextPath}/public/image/auction.jpg" alt="auction" type="button">
                </div>
            </div>
        </div>
        <div class="mx-auto mt-5 w-75 d-flex justify-content-between">
            <div class="card h-100" style="width: 14rem;border-radius: 0" type="button">
                <img class="card-img-top" src="${pageContext.request.contextPath}/public/image/phone.jpg" alt="Card image cap">
                <div class="card-footer" style="background-color: coral; font-weight: bold">Điện thoại</div>
            </div>
            <div class="card h-100" style="width: 14rem;border-radius: 0" type="button">
                <img class="card-img-top" src="${pageContext.request.contextPath}/public/image/laptop1.jpg" alt="Card image cap">
                <div class="card-footer" style="background-color: coral; font-weight: bold">Laptop</div>
            </div>
            <div class="card h-100" style="width: 14rem;border-radius: 0" type="button">
                <img class="card-img-top" src="${pageContext.request.contextPath}/public/image/tablet.jpg" alt="Card image cap">
                <div class="card-footer" style="background-color: coral; font-weight: bold">Máy tính bảng</div>
            </div>
            <div class="card h-100" style="width: 14rem;border-radius: 0" type="button">
                <img class="card-img-top" src="${pageContext.request.contextPath}/public/image/mayanh.jpg" alt="Card image cap">
                <div class="card-footer" style="background-color: coral; font-weight: bold">Máy ảnh</div>
            </div>
            <div class="card h-100" style="width: 14rem;border-radius: 0" type="button">
                <img class="card-img-top" src="${pageContext.request.contextPath}/public/image/nuochoa.jpg" alt="Card image cap">
                <div class="card-footer" style="background-color: coral; font-weight: bold">Nước hoa</div>
            </div>
        </div>
        <div class="mx-auto w-75">
            <div class="card mt-5">
                <div class="card-header textDiv">
                    Sắp hết hạn!!!
                </div>
                <div class="card-body">

                </div>
            </div>
            <div class="card mt-5">
                <div class="card-header textDiv">
                    Sản phẩm nổi bật!!!
                </div>
                <div class="card-body">

                </div>
            </div>
            <div class="card mt-5">
                <div class="card-header textDiv">
                    Top giá !!!
                </div>
                <div class="card-body">

                </div>
            </div>
        </div>
    </jsp:body>
</i:main>