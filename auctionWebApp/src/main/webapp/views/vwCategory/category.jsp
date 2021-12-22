<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.category>"/>
<i:main>
    <jsp:attribute name="css">
    <link rel="stylesheet" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" src="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" type="text/css">
</jsp:attribute>

    <jsp:attribute name="js">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

</jsp:attribute>

    <jsp:body>
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card">
                        <h4 class="card-header">
                            Danh mục sản phẩm
                        </h4>
                        <div class="list-group list-group-flush">
                            <c:forEach items="${categories}" var="c">
                                <a href="${pageContext.request.contextPath}/product/byCat?id=${c.idCategory}" class="list-group-item list-group-item-action">
                                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                                        ${c.nameCategory}
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9" style="height: 100vh;">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between">
                            Sản phẩm
                        </h4>
                        <div class="card-body d-flex" style="flex-wrap: wrap">

                                <c:forEach items="${products}" var="p">
                                    <c:choose>
                                        <c:when test="${p.timeInserted < 100}">
                                            <div class="col-sm-4 mb-3 " style="color: red" >
                                                <div class="card h-100">
                                                    <div class="card-body">

                                                        <img src="${pageContext.request.contextPath}/public/image/product/${p.image}" alt="" style="height: 250px;">
                                                        <h6 class="card-title mt-4">${p.nameProduct}</h6>
                                                        <h5 class="card-title text-danger">
                                                            <fmt:formatNumber value="${p.price}" type="number" />

                                                        </h5>
                                                        <div class="content d-flex justify-content-between">
                                                            <p style="color:cornflowerblue;">
                                                                ${p.timeRemaining}
                                                            </p>
                                                            <p style="text-align: right;color: lightslategray; font-size: 12px">
                                                                    ${p.createdDate}
                                                            </p>
                                                        </div>

                                                    </div>
                                                    <div class="card-footer text-muted">
                                                        <a class="btn btn-sm btn-outline-primary" href="#" role="button">
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
<%--                                            <tr >--%>
<%--                                                <td><img src="${pageContext.request.contextPath}/public/image/product/${p.image}" alt="" width="30px" height="30px"></td>--%>
<%--                                                <td>${p.nameProduct}</td>--%>
<%--                                                <td>${p.price}</td>--%>
<%--                                                <td>${p.quantity}</td>--%>
<%--                                                <td>${p.createdDate}</td>--%>
<%--                                                <td>${p.timeRemaining}</td>--%>
<%--                                                <td>${p.bidder}</td>--%>
<%--                                            </tr>--%>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-sm-4 mb-3 " >
                                                <div class="card h-100">
                                                    <div class="card-body">

                                                        <img src="${pageContext.request.contextPath}/public/image/product/${p.image}" alt="" style="height: 250px;">
                                                        <h6 class="card-title mt-4">${p.nameProduct}</h6>
                                                        <h5 class="card-title text-danger">
                                                            <fmt:formatNumber value="${p.price}" type="number" />

                                                        </h5>
                                                        <div class="content d-flex justify-content-between">
                                                            <p style="color:cornflowerblue;">
                                                                    ${p.timeRemaining}
                                                            </p>
                                                            <p style="text-align: right;color: lightslategray; font-size: 12px">
                                                                    ${p.createdDate}
                                                            </p>
                                                        </div>

                                                    </div>
                                                    <div class="card-footer text-muted">
                                                        <a class="btn btn-sm btn-outline-primary" href="#" role="button">
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
<%--                                            <tr>--%>
<%--                                                <td><img src="${pageContext.request.contextPath}/public/image/product/${p.image}" alt="" width="30px" height="30px"></td>--%>
<%--                                                <td>${p.nameProduct}</td>--%>
<%--                                                <td>${p.price}</td>--%>
<%--                                                <td>${p.quantity}</td>--%>
<%--                                                <td>${p.createdDate}</td>--%>
<%--                                                <td>${p.timeRemaining}</td>--%>
<%--                                                <td>${p.bidder}</td>--%>
<%--                                            </tr>--%>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</i:main>