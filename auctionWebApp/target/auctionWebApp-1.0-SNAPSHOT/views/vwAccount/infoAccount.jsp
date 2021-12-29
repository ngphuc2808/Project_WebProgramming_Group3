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
            $('#txtDOB').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
                mask: true
            });
            function isValidEmailAddress(emailAddress) {
                let pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                return pattern.test(emailAddress);
            }
            $('#btn-update').on('submit',function (){
                // e.preventDefault();
                const email = $('#txtEmail').val();
                if (!isValidEmailAddress(email)) {
                    alert('Please re-enter email');
                    return;
                }
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
                            <a>
                                <i class="fas fa-history"></i>
                                <span>Lịch sử giao dịch</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="LayoutInner bg-white account_layout">
                    <div class="container-layoutInner">
                        <div class="title">
                            <h2>Thông tin tài khoản</h2>
                        </div>
                        <form action="" method="post">
                            <div class="idUser" style="display: none;">
                                <label>ID</label>
                                <input type="text" value="${authUser.idUser}" name="idUser">
                            </div>
                            <div class="nickName">
                                <label>Tên đăng nhập</label>
                                <span>${authUser.username}</span>
                            </div>
                            <div class="fullName space-top">
                                <label >Họ và Tên</label>
                                <div class="input-name">
                                    <input id="txtName" name="name" type="text" class="input_fullName" value="${authUser.name}" style="padding: 5px 0px; width: 300px;">
                                </div>
                            </div>
                            <div class="email space-top">
                                <label style="padding-right: 112px;">Email</label>
                                <input id="txtEmail" name="email" type="email" value="${authUser.email}" style="padding: 5px 0px; width: 300px;">
                            </div>
                            <div class="birthday  " style="padding-top: 20px;">
                                <label >Ngày sinh</label>
                                <div class="group-select">
                                    <span>${authUser.dob.dayOfMonth}/${authUser.dob.monthValue}/${authUser.dob.year}</span>
                                </div>
                            </div>
                            <div class="role space-top">
                                <label >Điểm số</label>
                                <span style="padding-left: 97px;">${authUser.point}</span>
                            </div>
                            <div class="role space-top">
                                <label >Quyền hạn</label>
                                <span style="padding-left: 79px;">${authUser.queue}</span>
                            </div>
                            <div class="btn-save">
                                <button id="btn-update" type="submit" >Lưu thay đổi</button>
                            </div>
                        </form>
                    </div>
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