

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Male-Fashion </title>

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

        <style>
            .shop__sidebar__accordion .shop__sidebar__categories ul li a.active{
                color: black;
            }
        </style>
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
                    <a href="#">Sign in</a>
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
                                        <a style="color: white; margin-right: 8px" href=""><i class='fa fa-user'></i></a>
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
                                <li><a href="home">Home</a></li>
                                <li class="active"><a href="shop">Shop</a></li>                                                        
                                
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="header__nav__option">
                            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                            <a href="#"><img src="img/icon/heart.png" alt=""></a>
                            <a href="cart"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                            <div class="price">${requestScope.sizeCart}</div>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shop</h4>
                            <div class="breadcrumb__links">
                                <a href="home">Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <form action="shop" id="my_form" method="get"><!-- comment----------------------------------------------------------------------------------------------------- -->
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="shop__sidebar">
                                <div class="shop__sidebar__search" style="display: flex">
                                    <input style="width:160px" type="text" placeholder="Search..." name="searchProduct" >
                                    <button type="submit"><span class="icon_search"></span></button>
                                </div>
                                <div class="shop__sidebar__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__categories">
                                                        <ul class="nice-scroll">
                                                            <c:set var="ci" value="${requestScope.categoryId}" />
                                                            <c:set var="cat" value="${requestScope.dataCategory}" />
                                                            <c:forEach begin="0" end="${cat.size()-1}" var="i">
                                                                <li><input type="checkbox" name="categoryIdm" value="${cat.get(i).getId()}" ${ci[i]?"checked":""} onclick="this.form.submit()"/>${cat.get(i).getName()}</li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                            </div>
                                            <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__brand">
                                                        <ul>
                                                            <c:set var="bi" value="${requestScope.brandId}" />
                                                            <c:set var="brand" value="${requestScope.dataBrand}" />
                                                            <c:forEach begin="0" end="${brand.size()-1}" var="i">
                                                                <li><input type="checkbox" name="brandIdm" value="${brand.get(i).getId()}" ${bi[i]?"checked":""} onclick="this.form.submit()"/>${brand.get(i).getName()}</li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                            </div>
                                            <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__price">
                                                        <ul>
                                                            <c:set var="pri" value="${requestScope.priceTick}" />
                                                            <li><input type="checkbox" name="price" value="1" ${pri[0]?"checked":""} onclick="this.form.submit()"/>100000 - 300000đ</li>
                                                            <li><input type="checkbox" name="price" value="2" ${pri[1]?"checked":""} onclick="this.form.submit()"/>300000 - 1 triệu</li>
                                                            <li><input type="checkbox" name="price" value="3" ${pri[2]?"checked":""} onclick="this.form.submit()"/>1 - 3 triệu</li>
                                                            <li><input type="checkbox" name="price" value="4" ${pri[3]?"checked":""} onclick="this.form.submit()"/>3 - 10 triệu</li>
                                                            <li><input type="checkbox" name="price" value="5" ${pri[4]?"checked":""} onclick="this.form.submit()"/>Trên 10 triệu</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- comment -->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="shop__product__option">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="shop__product__option__left">
                                            <p>${requestScope.sizeList} results</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="shop__product__option__right">
                                            <p>Sort by Price:</p>
                                            <c:set value="${requestScope.filterRight}" var="f"/>
                                            <div class="nice-select">
                                                <span class="current">${f}</span>
                                                <ul class="list">
                                                    <li class="${f=="Default"?"option selected":"option"}">
                                                        <a href="${requestScope.url1}filterRight=Default" style="color: black">Default</a>
                                                    </li>
                                                    <li class="${f=="Low to high"?"option selected":"option"}">
                                                        <a href="${requestScope.url1}filterRight=Low+to+high" style="color: black">Low to high</a>
                                                    </li>
                                                    <li class="${f=="High to low"?"option selected":"option"}">
                                                        <a href="${requestScope.url1}filterRight=High+to+low" style="color: black">High to low</a>
                                                    </li>
                                                    <li class="${f=="New arrival"?"option selected":"option"}">
                                                        <a href="${requestScope.url1}filterRight=New+arrival" style="color: black">New arrival</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- 
                                            <select name="filterRight" style="display: block">
                                                <option value="lowhigh" onclick="this.form.submit()">Low To High</option>
                                                <option value="default" onclick="this.form.submit()">Default</option>
                                                <option value="highlow" onclick="this.form.submit()">High To Low</option>
                                                <option value="">$0 - $55</option>
                                                <option value="">$55 - $100</option>
                                            </select>
                                            -->
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:set var="p" value="${requestScope.data}" />
                                <c:if test="${p==null}">
                                    <p>Không tìm thấy sản phẩm nào phù hợp!</p>
                                </c:if>
                                <c:if test="${p!=null}">
                                    <c:forEach begin="0" end="${p.size()-1}" var="i">
                                        <div class="col-lg-4 col-md-6 col-sm-6">
                                            <div class="product__item">
                                                <div class="product__item__pic set-bg" data-setbg="${p.get(i).images}">
                                                    <ul class="product__hover">
                                                        <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                                        <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a>
                                                        </li>
                                                        <li><a href="detail?productId=${p.get(i).id}"><img src="img/icon/search.png" alt=""></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__item__text">
                                                    <h6>${p.get(i).name}</h6>
                                                    <a href="${requestScope.url1}IdP=${p.get(i).id}" class="add-cart">+ Add To Cart</a>
                                                    <div class="rating">
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5>${p.get(i).price*2}đ</h5>
                                                    <div class="product__color__select">
                                                        <label for="pc-4">
                                                            <input type="radio" id="pc-4">
                                                        </label>
                                                        <label class="active black" for="pc-5">
                                                            <input type="radio" id="pc-5">
                                                        </label>
                                                        <label class="grey" for="pc-6">
                                                            <input type="radio" id="pc-6">
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </c:forEach>
                                </c:if>    


                                <!-- -------------------------------------------------------------------------------------------------------------- -->
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <c:set var="page" value="${requestScope.page}"/>
                                    <div class="product__pagination">
                                        <!--                                        -->
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <a class="${i==page?"active":""}" href="${requestScope.url1}page=${i}" >${i}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </section>
        <!-- Shop Section End -->

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
