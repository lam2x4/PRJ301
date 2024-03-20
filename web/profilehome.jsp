<%-- 
    Document   : home
    Created on : Jul 11, 2022, 5:20:00 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head> <style>
            .container_content{
                background-color: #F1F6F7;
                height: 100vh;
            }
            .container_option{
                padding: 0;
            }
            .container_option .head{
                height: 70px;
                display: flex;
            }
            a{
                color: black;
            }
            .container_option .head a{
                margin: auto;
                font-size: 20px;
            }

            li{
                list-style: none;
            }

            .option-nav>li{
                height:50px;
            }

            .option-nav > li:hover{
                background: #F2F7F8;
                color: #6AC5FA;
            }

            .option-nav{
                padding: 0;
            }

            .option-nav li{
                padding-left:  30px;
                padding-top: 10px;
            }

            .option-nav li>a>i{
                margin-right: 10px;
            }

            .card-body{

            }

            .container2{
                padding: 25px 30px;
            }

            .cart-body{
                padding: 0px 10px;
            }

            .cart-body-item{
                background: white;
                padding: 1.25rem;
                text-align: center;
            }

            .cart-body-item p{
                text-align: center;
            }

            .page-breadcrumb{
                padding: 30px;
                padding-bottom: 20px;
            }

            .form1{
                padding-left: 50px;
            }

            .form1 ul >li{
                padding: 20px 0;
            }

            .form1 ul >li input{
                width: 100%;
                border: none;
            }
            .card1{
                width: 1000px;
            }
            .form1{
                padding-right: 200px;
            }
            .active{
                background: #F2F7F8;
                color: #6AC5FA;
            }
        </style>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Male-Fashion</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        
      <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__option">
                <div class="offcanvas__links">
                    <a href="login">Sign in</a>
                    <a href="#">FAQs</a>
                </div>
                <div class="offcanvas__top__hover">
                    <span>Usd <i class="arrow_carrot-down"></i></span>
                    <ul>
                        <li>USD</li>
                        <li>EUR</li>
                        <li>USD</li>
                    </ul>
                </div>
            </div>
            <div class="offcanvas__nav__option">
                <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                <a href="#"><img src="img/icon/heart.png" alt=""></a>
                <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                <div class="price">$0.00</div>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__text">
                <p>Free shipping, 30-day return or refund guarantee.</p>
            </div>
        </div>
        <!-- Offcanvas Menu End -->

       <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-7">
                            <div class="header__top__left">
                                <p>Free shipping, 30-day return or refund guarantee.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-5">
                            <div class="header__top__right">
                                <c:if test="${sessionScope.account != null}">
                                    <div class="header__top__links">
                                        <a style="color: white; margin-right: 8px" href="profilehome.jsp"><i class='fa fa-user'></i></a>
                                        <a href="logout">Sign out</a>
                                        
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <div class="header__top__links">
                                        <a href="login">Sign in</a>
                                        <a href="register">Register</a>
                                       
                                    </div>
                                </c:if>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="home"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li ><a href="home">Home</a></li>
                                <li><a href="shop">Shop</a></li>                        
                                <li><a href="./contact.html">Contacts</a></li>
                            </ul>
                        </nav>
                    </div>
        <!-- Offcanvas Menu End -->

      

            <div class="col-md-10 container_content">
                
                <div class="container2">
                    <div class="card1">
                        <div class="form1">
                            <form action="home" method="post">
                                <c:set value="${sessionScope.account}" var="a"/>
                                <ul>
                                    <li>Name:<input type="text" name="name" value="${a.name}"/> <br/></li>
                                    <li>Gender:<input type="text" name="gender" value="${a.gender}"/> <br/></li>
                                    <li>DOB:<input type="date" name="dob" value="${a.dob}"/> <br/></li>
                                    <li>Phone:<input type="text" name="phone" value="${a.phone}"/> <br/></li>
                                    <li>Address:<input type="text" name="address" value="${a.address}"/> <br/></li>
                                </ul>
                                <input type="submit" value="Update" style="color:white; background: black;margin-left: 40px"/>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Footer Section Begin -->
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__logo">
                                    <a href="#"><img src="img/footer-logo.png" alt=""></a>
                                </div>
                                <p>The customer is at the heart of our unique business model, which includes design.</p>
                                <a href="#"><img src="img/payment.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                            <div class="footer__widget">
                                <h6>Shopping</h6>
                                <ul>
                                    <li><a href="#">Clothing Store</a></li>
                                    <li><a href="#">Trending Shoes</a></li>
                                    <li><a href="#">Accessories</a></li>
                                    <li><a href="#">Sale</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <div class="footer__widget">
                                <h6>Shopping</h6>
                                <ul>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Payment Methods</a></li>
                                    <li><a href="#">Delivary</a></li>
                                    <li><a href="#">Return & Exchanges</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                            <div class="footer__widget">
                                <h6>NewLetter</h6>
                                <div class="footer__newslatter">
                                    <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                                    <form action="#">
                                        <input type="text" placeholder="Your email">
                                        <button type="submit"><span class="icon_mail_alt"></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="footer__copyright__text">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                <p>Copyright ©
                                    <script>
                                        document.write(new Date().getFullYear());
                                    </script>2020
                                    All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                        aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                </p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer Section End -->

            <!-- Search Begin -->
            <div class="search-model">
                <div class="h-100 d-flex align-items-center justify-content-center">
                    <div class="search-close-switch">+</div>
                    <form class="search-model-form">
                        <input type="text" id="search-input" placeholder="Search here.....">
                    </form>
                </div>
            </div>
            <!-- Search End -->

            <!-- Js Plugins -->
            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
            <script src="js/jquery.nicescroll.min.js"></script>
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/jquery.countdown.min.js"></script>
            <script src="js/jquery.slicknav.js"></script>
            <script src="js/mixitup.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/main.js"></script>
    </body>

</html>
