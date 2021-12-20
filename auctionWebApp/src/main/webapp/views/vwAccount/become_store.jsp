<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css_Account/style_account.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css_Account/reset_account.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    </jsp:attribute>
    <jsp:body>
        <div class="info-user bg-main" style="margin-top: 0">
            <div class="container">
                <div class="category-user">
                    <div class="image-user" style="margin-top: 20px">
                        <div class="avatar">
                            <img src="${pageContext.request.contextPath}/public/image/PortalAgares.png" >
                        </div>
                        <div class="name-user">
                            <span class="title-name">Tài <kh></kh>oản của</span>
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
                    </ul>
                </div>
                <div class="LayoutInner bg-white becomeStore_layout">
                    <div class="container-layoutInner">
                        <div class="title">
                            <h2>Trở thành người bán</h2>
                        </div>
                        <c:if test="${Error}">
                            <script>
                                alert("Error!");
                            </script>
                        </c:if>
                        <c:choose>
                            <c:when test="${authUser.queue=='0'}">
                                <form action="" method="post">
                                    <div class="userName">
                                        <span>Tên đăng nhập</span>
                                        <input type="text"  placeholder="Username" name="username">
                                    </div>
                                    <div class="password space-top">
                                        <span>Mật khẩu</span>
                                        <input type="password" placeholder="Password" name="password">
                                    </div>
                                    <div class="fullName space-top">
                                        <label >Họ và tên</label>
                                        <span>${authUser.name}</span>
                                    </div>
                                    <div class="email space-top">
                                        <label >Email</label>
                                        <span>${authUser.email}</span>
                                    </div>
                                    <div class="address space-top">
                                        <label >Địa chỉ</label>
                                        <span>${authUser.address}</span>
                                    </div>
                                    <div class="role space-top">
                                        <label >Quyền hạn</label>
                                        <span>${authUser.queue}</span>
                                    </div>
                                    <div class="btn-require">
                                        <button type="submit">Xin cấp quyền</button>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div style="margin-top: 20px">Họ tên: ${authUser.name}</div>
                                <div>Quyền hạn: ${authUser.queue}</div>
                                <div>Bạn đã được cấp quyền trong 7 ngày!</div>
                                <div>Từ ngày: </div>
                                <div>Đến ngày: </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
        </div>
    </jsp:body>
</i:main>