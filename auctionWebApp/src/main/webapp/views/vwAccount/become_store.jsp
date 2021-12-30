<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.auction.auctionwebapp.beans.user" />
<jsp:useBean id="pms" scope="request" type="com.auction.auctionwebapp.beans.myPermission"/>
<i:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css_Account/style_account.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css_Account/reset_account.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            function thongBao(){
                alert("Xin cấp phép thành công, vui lòng đợi Admin xem xét");
            }
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
                            <span class="title-name">Tài khoản của</span>
                            <span class="name">${authUser.name}</span>
                        </div>
                    </div>
                    <ul>
                        <li class="account">
                            <a href="${pageContext.request.contextPath}/account/profile?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-user"></i>
                                <span>Thông tin tài khoản</span>
                            </a>
                        </li>
                        <li class="changePassword">
                            <a href="${pageContext.request.contextPath}/account/changePassword?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-lock"></i>
                                <span style="padding-left: 17px;">Thay đổi mật khẩu</span>
                            </a>
                        </li>
                        <li class="become-store">
                            <a href="${pageContext.request.contextPath}/account/becomeStore?id=${authUser.idUser}" role="button" style="text-decoration: none; color: black;">
                                <i class="fas fa-store"></i>
                                <span>Trở thành người bán</span>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a href="${pageContext.request.contextPath}/account/historyUpload?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-history"></i>
                                <span>Các bài đã đăng</span>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a href="${pageContext.request.contextPath}/account/favorite?id=${authUser.idUser}" style="text-decoration: none; color: black;">
                                <i class="fas fa-heart"></i>
                                <span>Danh sách yêu thích</span>
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
                                        <span>${pms.permission}</span>
                                    </div>
                                    <div class="btn-require">
                                        <button type="submit" onclick="thongBao()">Xin cấp quyền</button>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div style="margin-top: 20px"><h6>ID: ${pms.userId}</h6></div>
                                <div><h6>Họ tên: ${authUser.name}</h6></div>
                                <div><h6>Quyền hạn: ${pms.permission}</h6></div>
                                <div><h6>Bạn đã được cấp quyền trong 7 ngày!</h6></div>
                                <div><h6>Từ ngày: ${pms.startDate}</h6></div>
                                <div><h6>Đến ngày: ${pms.endDate}</h6></div>
                            </c:otherwise>
                        </c:choose>
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