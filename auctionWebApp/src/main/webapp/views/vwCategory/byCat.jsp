<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.category>"/>

<jsp:useBean id="products" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.Product>"/>
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
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
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
                <div class="col-sm-9" style="height: 100vh">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between">
                            Sản phẩm
                        </h4>
                        <div class="card-body">
                            <table id="example" class="table table-striped" style="width:100%">
                                <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Created Date</th>
                                    <th>Time Remaining</th>
                                    <th>Bidder</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${products}" var="p">
                                    <c:choose>
                                        <c:when test="${p.timeInserted < 100}">
                                            <tr style="color: red">
                                                <td><img src="${pageContext.request.contextPath}/public/image/product/${p.image}" alt="" width="30px" height="30px"></td>
                                                <td>${p.nameProduct}</td>
                                                <td>${p.price}</td>
                                                <td>${p.quantity}</td>
                                                <td>${p.createdDate}</td>
                                                <td>${p.timeRemaining}</td>
                                                <td>${p.bidder}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td><img src="${pageContext.request.contextPath}/public/image/product/${p.image}" alt="" width="30px" height="30px"></td>
                                                <td>${p.nameProduct}</td>
                                                <td>${p.price}</td>
                                                <td>${p.quantity}</td>
                                                <td>${p.createdDate}</td>
                                                <td>${p.timeRemaining}</td>
                                                <td>${p.bidder}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</i:main>