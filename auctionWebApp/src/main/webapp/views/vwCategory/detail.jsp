<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="product" scope="request" type="com.auction.auctionwebapp.beans.Product" />
<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<jsp:useBean id="auctions" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.auction>"/>

<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <style>
            /** CSS căn id pagination ra giữa màn hình **/
            #pagination {
                display: flex;
                display: -webkit-flex; /* Safari 8 */
                flex-wrap: wrap;
                -webkit-flex-wrap: wrap; /* Safari 8 */
                justify-content: center;
                -webkit-justify-content: center;
            }
        </style>
    </jsp:attribute>

    <jsp:attribute name="js">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <!-- JS tạo nút bấm di chuyển trang start -->
        <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
        <!-- JS tạo nút bấm di chuyển trang end -->
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            var currentPrice = parseInt($('.currentPrice').val());
            var priceStep = parseInt($('.val_priceStep').val());
            var intialPrice = currentPrice;
            var buyNowPrice = parseInt($('.currentPrice').attr('max'));
            // var buyNowPrice = 20000000;
            $(document).ready(function () {
                $("#decrease").click(function (e) {
                    e.preventDefault();
                    if(currentPrice === intialPrice)
                    {
                        currentPrice= intialPrice;
                    }
                    else {
                        currentPrice-=priceStep;
                    }
                    $('.currentPrice').val(currentPrice);
                });
                $("#increase").click(function (e) {
                    e.preventDefault();

                    if ( currentPrice === buyNowPrice)
                    {
                        currentPrice === buyNowPrice;
                        swal({
                            title: "Chúc mừng bạn!",
                            text: "Bạn đã ra giá có thể mua liền!",
                            icon: "success",
                            button: "OK!",
                        });
                    }
                    else {
                        currentPrice += priceStep;
                        $('.currentPrice').val(currentPrice);

                    }
                });
                // $(".btn_bid").click(function (e) {
                //     // e.preventDefault();
                // });
            });
        </script>
    </jsp:attribute>

    <jsp:body>
<%--        <sql:setDataSource--%>
<%--                var="list"--%>
<%--                driver="com.mysql.jdbc.Driver"--%>
<%--                url="jdbc:mysql://localhost:3306/daugiatructuyen"--%>
<%--                user="root" password="roor"--%>
<%--        />--%>
<%--        <sql:query var="auction"   dataSource="${list}">--%>
<%--            SELECT * FROM auction;--%>
<%--        </sql:query>--%>
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
                    <form method="post">
                        <div class="card">
                            <div class="card-header">
                                <h3>${product.nameProduct}</h3>
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
                                <div class="action" style="display: flex;">

                                    <div class="priceBid" >
                                        <button onclick="return false;" id="decrease" class="val_priceStep"  style="padding: 10px;
	cursor: pointer;
	color: white;
	border: 1px solid #007bff;
	border-radius: 5px;
	background-color: #007bff;" value="${product.priceStep}"><i class="fas fa-minus"></i></button>
                                        <input type="text" class="currentPrice" name="currentPrice" style="padding: 10px;
	border: transparent;
	background-color: whitesmoke;" value="${product.price}"  max="${product.buyNowPrice}" readonly>
                                        <button onclick="return false;" id="increase" class="val_priceStep" style="padding: 10px;
	cursor: pointer;
	color: white;
	border: 1px solid #007bff;
	border-radius: 5px;
	background-color: #007bff;" value="${product.priceStep}"><i class="fas fa-plus"></i></button>
                                    </div>

                                    <button class="btn btn_bid btn-primary" style="font-size: 20px; margin-left: 15px;" type="submit" >
                                        <img src="${pageContext.request.contextPath}/public/image/daugia.png" alt="" >
                                        Đấu giá
                                    </button>

                                    <input type="text" name="idUser" value="${authUser.idUser}" style="display: none;" readonly>

                                </div>
                            </div>

                        </div>
                    </form>
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
            <div class="card-body" style="background-color: white">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Product Id</th>
                        <th>User Id</th>
                        <th>Username</th>
                        <th>Giá</th>
                        <th>Thời gian</th>
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