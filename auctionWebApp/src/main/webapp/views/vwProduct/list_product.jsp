<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<html>
<head>


    <title>Title</title>
</head>

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

    <c:forEach items="${productList}" var="c">
        <c:choose>
            <c:when test="${c.timeInserted < 100}">
                <tr style="color: red">
                    <td><img src="${pageContext.request.contextPath}/public/image/product/${c.image}" alt="" width="30px" height="30px"></td>
                    <td>${c.nameProduct}</td>
                    <td>${c.price}</td>
                    <td>${c.quantity}</td>
                    <td>${c.createdDate}</td>
                    <td>${c.timeRemaining}</td>
                    <td>${c.bidder}</td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td><img src="${c.image}" alt="" width="30px" height="30px"></td>
                    <td>${c.nameProduct}</td>
                    <td>${c.price}</td>
                    <td>${c.quantity}</td>
                    <td>${c.createdDate}</td>
                    <td>${c.timeRemaining}</td>
                    <td>${c.bidder}</td>
                </tr>
            </c:otherwise>
        </c:choose>

    </c:forEach>


    </tbody>
    <tfoot>
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Created Date</th>
        <th>Time Remaining</th>
        <th>Bidder</th>
    </tr>
    </tfoot>
</table>
</jsp:body>
</i:main>
