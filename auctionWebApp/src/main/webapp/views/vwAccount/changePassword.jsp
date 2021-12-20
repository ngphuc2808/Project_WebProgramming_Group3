<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css_Account/style_account.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css_Account/reset_account.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $('#txtDOB').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
                mask: true
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="info-user bg-main" style="margin-top: 0">
            <div class="container">
                <div class="category-user">
                    <div class="image-user" style="margin-top: 20px">
                        <div class="avatar">
                            <img src="${pageContext.request.contextPath}/public/image/PortalAgares.png">
                        </div>
                        <div class="name-user">
                            <span class="title-name">Tài khoản của</span>
                            <span class="name">${authUser.name}</span>
                        </div>
                    </div>
                    <ul>
                        <li class="account">
                            <a href="${pageContext.request.contextPath}/account/profile" style="text-decoration: none; color: black;">
                                <i class="fas fa-user"></i>
                                <span>Thông tin tài khoản</span>
                            </a>
                        </li>
                        <li class="become-store">
                            <a href="${pageContext.request.contextPath}/account/becomeStore" style="text-decoration: none; color: black;">
                                <i class="fas fa-store"></i>
                                <span>Trở thành người bán</span>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a>
                                <i class="fas fa-history"></i>
                                <span>Lịch sử giao dịch</span>
                            </a>
                        </li>

                        <li class="changePassword">
                            <a href="${pageContext.request.contextPath}/views/vwAccount/changePassword.jsp" style="text-decoration: none; color: black;">
                                <i class="fas fa-lock"></i>
                                <span style="padding-left: 17px;">Thay đổi mật khẩu</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="LayoutInner bg-white changePassword_layout" id= "infor" style="display: block">
                    <div class="container-layoutInner">
                        <div class="title">
                            <h2>Thay đổi mật khẩu</h2>
                        </div>
                        <form action="">

                            <div class="oldPass">
                                <span>Mật khẩu cũ: </span>
                                <input type="text">
                            </div>
                            <div class="newPass space-top">
                                <span>Mật khẩu mới: </span>
                                <input type="text">
                            </div>
                            <div class="repeat_newPass space-top">
                                <span>Nhập lại mật khẩu mới: </span>
                                <input type="text">
                            </div>

                            <div class="btn-save">
                                <button>Lưu thay đổi</button>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>
    </jsp:body>
</i:main>