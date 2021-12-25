<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.auction.auctionwebapp.beans.category>"/>
<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="js">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/themes/fa/theme.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>
        <script>
            $( document ).ready(function() {
                $('#jpgImage').fileinput({
                    theme: 'fa',
                    language: "vi",
                    dropZoneEnabled: false,
                    allowedFileExtensions: ['jpg', 'png', 'gif']
                });
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
                <div class="col-sm-9" style="height: 100vh;">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between ">
                            Sản phẩm
                            <a class="btn btn-outline-success" role="button">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                                Đăng bài
                            </a>
                        </h4>
                        <div class="card-body">
                            <form id="formCreateProduct" action="" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="txtUsername" class="classReg">Tên đăng nhập</label>
                                    <input type="text" id="txtUsername" name="username" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtPassword" class="classReg">Mật khẩu</label>
                                    <input type="password" id="txtPassword" name="password" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtIdCategory" class="classReg">Mã danh mục</label>
                                    <input type="text" id="txtIdCategory" name="idCategory" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtNameProduct" class="classReg">Tên sản phẩm</label>
                                    <input type="text" id="txtNameProduct" name="nameProduct" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtStartingPrice" class="classReg">Giá khởi điểm:</label>
                                    <input type="text" id="txtStartingPrice" name="startingPrice" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtPriceStep" class="classReg">Bước giá:</label>
                                    <input type="text" id="txtPriceStep" name="priceStep" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtBuyNow" class="classReg">Giá mua ngay</label>
                                    <input type="text" id="txtBuyNow" name="buyNowPrice" required>
                                </div>
                                <div class="form-group">
                                    <input id="jpgImage" name="jpgImage" type="file">
                                </div>
                                <div class="form-group">
                                    <label for="txtDetail" class="classReg">Mô tả sản phẩm</label>
                                    <textarea type="text" id="txtDetail" name="detail" required></textarea>
                                </div>
                                <button class="btn btn-outline-success" type="submit">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Đăng
                                </button>
                                <button class="btn btn-outline-danger">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Hủy
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</i:main>