<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<jsp:useBean id="favorites" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.favorite>"/>
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
        <script type="text/javascript">
            $(function () {
                var pageSize = 6; // Hiển thị 6 sản phẩm trên 1 trang
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
    </jsp:attribute>

    <jsp:body>
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col-sm-9" style="height: 100vh; overflow: auto; margin: auto">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between ">
                            Sản phẩm
                            <c:if test="${authUser.queue=='1'}">
                                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/product/upload" role="button">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Đăng bài
                                </a>
                            </c:if>
                        </h4>
                        <div class="card-body d-flex " style="flex-wrap: wrap">

                            <c:forEach items="${favorites}" var="f">
                                <div class="col-sm-4 mb-3 " >
                                    <div class="card h-100 contentPage">
                                        <div class="card-body">
                                            <img src="data:image/jpg;base64,${f.image1}" alt="" style="height: 250px;">
                                            <h6 class="card-title mt-4">${f.nameProduct}</h6>
                                            <h5 class="card-title text-danger">
                                                <fmt:formatNumber value="${f.buyNowPrice}" type="number" />
                                            </h5>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/product/details?id=${f.idProduct}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                        <div class="card-footer">
                            <ul id="pagination"></ul>
                        </div>
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