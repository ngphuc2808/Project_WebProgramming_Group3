<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>

<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="path/to/file/bootstrap.min.css">
    </jsp:attribute>

    <jsp:attribute name="js">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/themes/fa/theme.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>
        <script type="text/javascript" src="path/to/file/bootstrap.min.js"></script>
        <script>
            $( document ).ready(function() {
                $('#jpgImage1').fileinput({
                    theme: 'fa',
                    language: "vi",
                    dropZoneEnabled: false,
                    allowedFileExtensions: ['jpg', 'png', 'gif']
                });
                $('#jpgImage2').fileinput({
                    theme: 'fa',
                    language: "vi",
                    dropZoneEnabled: false,
                    allowedFileExtensions: ['jpg', 'png', 'gif']
                });
                $('#jpgImage3').fileinput({
                    theme: 'fa',
                    language: "vi",
                    dropZoneEnabled: false,
                    allowedFileExtensions: ['jpg', 'png', 'gif']
                });
                $('#jpgImage4').fileinput({
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
                <div class="col-sm-9" style="height: 100vh; overflow: auto">
                    <div class="card">
                        <h4 class="card-header d-flex justify-content-between ">
                            Sản phẩm
                            <a class="btn btn-outline-success" role="button">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                                Đăng bài
                            </a>
                        </h4>
                        <div class="card-body">
                            <c:if test="${Error}">
                                <script>
                                    alert("Upload Error!");
                                </script>
                            </c:if>
                            <form id="formCreateProduct" action="" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="txtUsername" class="classReg">Tên đăng nhập</label>
                                    <input type="text" id="txtUsername" name="username" style="margin-left: 20px; width: 400px;"  required>
                                </div>
                                <div class="form-group">
                                    <label for="txtPassword" class="classReg">Mật khẩu</label>
                                    <input type="password" id="txtPassword" name="password" style="margin-left: 57px; width: 400px;" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtIdCategory" class="classReg">Danh mục đăng bán</label>
                                    <select class="custom-select" id="txtIdCategory" name="idCategory" required>
                                        <option value="1">Phone</option>
                                        <option value="2">Laptop</option>
                                        <option value="3">Tablet</option>
                                        <option value="4">Camera</option>
                                        <option value="5">Perfume</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="txtNameProduct" class="classReg">Tên sản phẩm</label>
                                    <input type="text" id="txtNameProduct" name="nameProduct" style="margin-left: 30px; width: 400px;" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtStartingPrice" class="classReg">Giá khởi điểm:</label>
                                    <input type="text" id="txtStartingPrice" name="startingPrice" style="margin-left: 27px; width: 400px;" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtPriceStep" class="classReg">Bước giá:</label>
                                    <input type="text" id="txtPriceStep" name="priceStep" style="margin-left: 62px; width: 400px;" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtBuyNow" class="classReg">Giá mua ngay</label>
                                    <input type="text" id="txtBuyNow" name="buyNowPrice" style="margin-left: 30px; width: 400px;" required>
                                </div>
                                <div class="form-group">
                                    <label for="jpgImage1" class="classReg">Ảnh đại diện sản phẩm</label>
                                    <input id="jpgImage1" name="jpgImage1" type="file">
                                    <br>
                                    <label for="jpgImage2" class="classReg">Ảnh phụ</label>
                                    <input id="jpgImage2" name="jpgImage2" type="file">
                                    <br>
                                    <input id="jpgImage3" name="jpgImage3" type="file">
                                    <br>
                                    <input id="jpgImage4" name="jpgImage4" type="file">
                                </div>
                                <div class="form-group">
                                    <label for="txtDetail" class="classReg">Mô tả sản phẩm</label>
                                    <br>
                                    <textarea type="text" id="txtDetail" name="detail" style="width: 500px; height: 350px" required></textarea>
                                </div>
                                <button class="btn btn-outline-success" type="submit">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Đăng
                                </button>
                                <a href="${pageContext.request.contextPath}/category" class="btn btn-outline-danger">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Hủy
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</i:main>