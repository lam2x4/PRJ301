

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

        <script src="https://kit.fontawesome.com/68ae502490.js" crossorigin="anonymous"></script>
        <title>Admin manager</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">

        <style>
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
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <div class="container1">
            <div class="row">
                <div class="col-md-2 container_option">
                    <div class="head">
                        <a href="dashboard">Admin</a>
                    </div>
                    <div class="option">
                        <ul class="option-nav">
                            <li><a href="dashboard"><i class="fa-solid fa-chart-bar"></i>Dashboard</a></li>
                            <li class="active"><a href="profile"><i class="fa-solid fa-user"></i>Profile</a></li>
                            <li><a href="catetable"><i class="fa-solid fa-layer-group"></i>Category group</a></li>
                            <li><a href="productmanager"><i class="fa-brands fa-product-hunt"></i>Product</a></li>
                            <li><a href="accountmanager"><i class="fa-brands fa-blogger"></i>Account</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 container_content">
                    <div class="page-breadcrumb">
                        <h4>Profile</h4>
                        <div class="breadcrumb__links">
                            <a href="dashboard">Home</a>
                            <i class="fa-solid fa-angle-right"></i>
                            <span>Profile</span>
                        </div>
                    </div>
                    <div class="container2">
                        <div class="card1">
                            <div class="form1">
                                <form action="actionaccount" method="post">
                                    <c:set value="${requestScope.user}" var="a"/>
                                    <ul>
                                        <li>Account<input type="text" name="email" value="${a.email}"/> <br/></li>
                                        <li>Password:<input type="text" name="password" value="${a.password}"/> <br/></li>
                                        <li>Name:<input type="text" name="name" value="${a.name}"/> <br/></li>
                                        <li>Phone:<input type="text" name="phone" value="${a.phone}"/> <br/></li>
                                        <li>Gender:<input type="text" name="gender" value="${a.gender}"/> <br/></li>
                                        <li>Address<input type="text" name="address" value="${a.address}"/> <br/></li>
                                        <li>Date of Birth<input type="Date" name="dob" value="${a.dob}"/> <br/></li>

                                    </ul>
                                    <input type="submit" value="Update" style="color:white; background: black;margin-left: 40px"/>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>