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
        <script>
            function getInformation() {
                document.getElementById("infor").style.display = "block"
                document.getElementById("permission").style.display = "none";
            }
            function getPermission() {
                document.getElementById("infor").style.display = "none"
                document.getElementById("permission").style.display = "block";            }


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
                            <a>
                                <i class="fas fa-user"></i>
                                <button onclick="getInformation()" style="background-color: transparent">Thông tin tài khoản</button>
                            </a>
                        </li>
                        <li class="become-store">
                            <a>
                                <i class="fas fa-store"></i>
                                <button onclick="getPermission()" style="background-color: transparent">Trở thành người bán</button>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a>
                                <i class="fas fa-history"></i>
                                <button style="background-color: transparent">Lịch sử giao dịch</button>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="LayoutInner bg-white account_layout" id= "infor" style="display: block">
                    <div class="container-layoutInner">
                        <div class="title">
                            <h2>Thông tin tài khoản</h2>
                        </div>
                        <form action="" method="post">
                            <div class="nickName">
                                <label>Tên đăng nhập</label>
                                <span>${authUser.username}</span>
                            </div>
                            <div class="fullName space-top">
                                <label >Họ và Tên</label>
                                <div class="input-name">
                                    <input type="text" class="input_fullName" value="${authUser.name}" style="padding: 5px 0px; width: 300px;">
                                </div>
                            </div>

                            <div class="email space-top">
                                <label style="padding-right: 112px;">Email</label>
                                <input type="email" value="${authUser.email}" style="padding: 5px 0px; width: 300px;">
                            </div>
                            <div class="birthday ">
                                <label >Ngày sinh</label>
                                <div class="group-select">
                                    <span>${authUser.dob.dayOfMonth}/${authUser.dob.monthValue}/${authUser.dob.year}</span>

                                </div>
                            </div>
                            <div class="point space-top">
                                <label >Điểm số</label>
                                <span>${authUser.point}</span>
                            </div>
                            <div class="point space-top">
                                <label >Quyền hạn</label>
                                <span>${authUser.queue}</span>
                            </div>
                            <div class="btn-save">
                                <button type="submit">Lưu thay đổi</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="LayoutInner bg-white account_layout" id= "permission" style="display: none">
                    <div class="container-layoutInner">
                        <div class="title">
                            <h2>Xin cấp quyền đăng bài</h2>
                        </div>
                        <c:if test="${Error}">
                            <script>
                                alert("Error!");
                            </script>
                        </c:if>
                        <form action="" method="post">
                            <div class="nickName d-flex">
                                <div>
                                    <label>Tên đăng nhập</label>
                                    <input type="text" placeholder="Username" id="txtUsername" name="username" autofocus required>
                                </div>
                            </div>
                            <div class="nickName">
                                <label>Mật khẩu</label>
                                <input type="password" placeholder="Password" id="txtPassword" name="password" autofocus required>
                            </div>
                            <div class="fullName space-top">
                                <label >Họ và Tên</label>
                                <span>${authUser.name}</span>
                            </div>
                            <div class="email space-top">
                                <label >Email</label>
                                <span>${authUser.email}</span>
                            </div>
                            <div class="email space-top">
                                <label >Địa chỉ</label>
                                <span>${authUser.address}</span>
                            </div>
                            <div class="point space-top">
                                <label >Quyền hạn</label>
                                <span>${authUser.queue}</span>
                            </div>
                            <div class="btn-save">
                                <button type="submit">Xin cấp quyền</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</i:main>