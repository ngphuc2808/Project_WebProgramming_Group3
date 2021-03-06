<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/styles.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css_Account/style_account.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css_Account/reset_account.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $(document).ready(function (){
                $('#upIMG').fileinput({
                    theme: 'fa',
                    language: "vi",
                    dropZoneEnabled: false,
                    allowedFileExtensions: ['jpg', 'png', 'gif']
                });
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="info-user bg-main" style="margin-top: 0">
            <div class="container">
                <div class="category-user">
                    <div class="image-user" style="margin-top: 20px">
                        <div class="avatar">
                            <a href="${pageContext.request.contextPath}/account/uploadIMG?id=${authUser.idUser}">
                                <img src="data:image/jpg;base64,${authUser.image}" >
                            </a>
                        </div>
                        <div class="name-user">
                            <span class="title-name">T??i kho???n c???a</span>
                            <span class="name">${authUser.name}</span>
                        </div>
                    </div>
                    <ul>
                        <li class="account">
                            <a href="${pageContext.request.contextPath}/account/profile?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-user"></i>
                                <span>Th??ng tin t??i kho???n</span>
                            </a>
                        </li>
                        <li class="changePassword">
                            <a href="${pageContext.request.contextPath}/account/changePassword?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-lock"></i>
                                <span style="padding-left: 17px;">Thay ?????i m???t kh???u</span>
                            </a>
                        </li>
                        <li class="become-store">
                            <a href="${pageContext.request.contextPath}/account/becomeStore?id=${authUser.idUser}" role="button" style="text-decoration: none; color: black;">
                                <i class="fas fa-store"></i>
                                <span>Tr??? th??nh ng?????i b??n</span>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a href="${pageContext.request.contextPath}/account/historyUpload?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-history"></i>
                                <span>C??c b??i ???? ????ng</span>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a>
                                <i class="fas fa-history"></i>
                                <span>L???ch s??? giao d???ch</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="LayoutInner bg-white uploadIMG_layout">
                    <div class="container-layoutInner">

                        <div class="title">
                            <h2>Upload h??nh ???nh</h2>
                        </div>


                        <form action="" method="post" enctype="multipart/form-data">
                            <div class="upload">
                                <input type="file" id="upIMG" name="image" accept="image/*" >
                            </div>
                            <div class="btn-save">
                                <button>L??u thay ?????i</button>
                            </div>
                        </form>

                    </div>
                </div>
        </div>
        <div class="footer bg-footer">
            <div class="container-fluid">
                <div class="contact">

                    <h3>Li??n h??? v???i ch??ng t??i</h3>
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