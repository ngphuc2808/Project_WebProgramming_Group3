<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="i" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="h" %>
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
        const year = document.getElementById("year");
        const month = document.getElementById("month")
        const day = document.getElementById("day")

        var date = new Date()
        var curr_year = date.getFullYear();

        getYear();
        getMonth();

        function getMonth()
        {
            for(var i= 1; i<=12;i++)
            {
                var opt = document.createElement("option")
                opt.text=i;
                opt.value=i;
                month.appendChild(opt);
            }

        }
        function getYear()
        {
            for(var i= curr_year; i>=1900;i--)
            {
                var opt = document.createElement("option")
                opt.text=i;
                opt.value=i;
                year.appendChild(opt);
            }

        }

        $(document).ready(function () {
            $('#year,#month').change(function (e) {
                e.preventDefault();
                var currSelect_year = year.options[year.selectedIndex].value
                var val_month = parseInt(month.value);
                var valDay = 0;
                switch(val_month)
                {
                    case 2:
                        if((currSelect_year%4==0) && ((currSelect_year%100!=0) || (currSelect_year%400==0)))
                        {
                            valDay=28;
                        }
                        else{
                            valDay=29;
                        } break;

                    case 1:
                    case 3:
                    case 5:
                    case 7:
                    case 8:
                    case 10:
                    case 12: valDay=31;
                        break;
                    case 4:
                    case 6:
                    case 9:
                    case 11:  valDay=30;
                        break;
                }
                for(let i=1;i<=valDay;i++)
                {
                    var opt = document.createElement("option")
                    opt.text=i;
                    opt.value=i;
                    day.appendChild(opt);
                }
            });
        });

    </script>
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
                            <a href="${pageContext.request.contextPath}/views/vwAccount/infoAccount.jsp">
                                <i class="fas fa-user"></i>
                                <span>Thông tin tài khoản</span>
                            </a>
                        </li>
                        <li class="become-store">
                            <a href="become_store.html">
                                <i class="fas fa-store"></i>
                                <span>Trở thành người bán</span>
                            </a>
                        </li>
                        <li class="notify">
                            <a href="notify.html">
                                <i class="fas fa-bell"></i>
                                <span>Thông báo</span>
                            </a>
                        </li>
                        <li class="address">
                            <a href="${pageContext.request.contextPath}/views/vwAccount/address.jsp">
                                <i class="fas fa-map-marker-alt"></i>
                                <span>Địa chỉ</span>
                            </a>
                        </li>
                        <li class="trading-history">
                            <a href="trading_his.html">
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
                        <form action="">
                            <div class="nickName">
                                <label >Tên đăng nhập</label>
                                <span>${authUser.username}</span>
                            </div>
                            <div class="fullName space-top">
                                <label >Họ và Tên</label>
                                <div class="input-name">
                                    <input type="text">
                                </div>
                            </div>
                            <div class="email space-top">
                                <label >Mật khẩu</label>
                                <span>${authUser.password}</span>
                                <a href="" class="change-pass">Thay đổi</a>
                            </div>
                            <div class="email space-top">
                                <label >Email</label>
                                <span>${authUser.email}</span>
                                <a href="" class="change-pass">Thay đổi</a>
                            </div>
                            <div class="birthday ">
                                <label >Ngày sinh</label>
                                <div class="group-select">
                                    <input type="text" placeholder="Date of Birth" id="txtDOB" name="dob" required>
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
                                <button>Lưu thay đổi</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</i:main>