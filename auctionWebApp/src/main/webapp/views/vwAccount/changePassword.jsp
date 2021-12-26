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
            var new_Pass = $(".new_Pass").val();
            var repeat_new_Pass = $(".repeat_new_Pass").val();
            // $('#btn_save').on('submit',function (){
            //
            //     if( new_Pass != repeat_new_Pass)
            //     {
            //         alert("Bạn đã nhập mật khẩu nhập lại sai hoặc mật khẩu mới. Xin mời nhập lại!");
            //         return;
            //     }
            //     })
            $('.btn_save').click(function (){
                if(new_Pass!=repeat_new_Pass) {
                    $('.warning').css("display","block")
                }
            })
            $('.close').click(function (){
                $('.warning').css("display","none");
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <c:if test="${hasError}">
            <div style="margin-bottom: 30px; margin-left: 80px;position: absolute;
    transform: translate(60%,7px);
     top: 40%;
     right: 40%;
     width: 400px;
     height: 60px;
     background-color: #1A374D;
    box-shadow: 0px 0px 1px 2px rgba(0,0,0,0.5);
    color: whitesmoke;
    border-color: darkgrey;
    padding-top: 15px;

    " role="alert" class="warning">
                <strong style="padding-top: 20px; padding-left: 10px;">Incorrect!</strong> ${errorMessage}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="color: white;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
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
                <div class="LayoutInner bg-white changePassword_layout" id= "infor" style="display: block">
                    <div class="container-layoutInner">
                        <div class="title">
                            <h2>Thay đổi mật khẩu</h2>
                        </div>

                        <form method="post" class="frmChangePass">
                            <div class="idUser" style="display: none;">
                                <label>ID</label>
                                <input type="text" value="${authUser.idUser}" name="idUser">
                            </div>
                            <div class="oldPass">
                                <span>Mật khẩu cũ: </span>
                                <input type="password" name="OldPass" class="old_Pass">
                            </div>
                            <div class="newPass space-top">
                                <span>Mật khẩu mới: </span>
                                <input type="password" name="NewPass" class="new_Pass">
                            </div>
                            <div class="repeat_newPass space-top">
                                <span>Nhập lại mật khẩu mới: </span>
                                <input type="password" name="Repeat_newPass" class="repeat_new_Pass">
                            </div>

                            <div class="btn-save">
                                <button class="btn_save" type="submit" >Lưu thay đổi</button>
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