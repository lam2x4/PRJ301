

<%-- 
    Document   : checkout
    Created on : Jul 13, 2022, 10:01:21 PM
    Author     : ADMIN
--%>

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
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are U sure to delete product with id=" + id + " ?")) {
                    window.location = "actionproduct?action=delete&id=" + id;
                }
            }
        </script>
        <style>
            .container_content{
                background-color: #F1F6F7;
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
                padding: 10px 10px;
            }

            .cart-body-item{
                background: white;
                padding: 1.25rem;
                text-align: center;
                border: solid 1px;
            }

            .cart-body-item p{
                text-align: center;
            }

            .page-breadcrumb{
                padding: 30px;
                padding-bottom: 20px;
            }

            .cart-body-item button{
                background: white;
            }
            .active{
                background: #F2F7F8;
                color: #6AC5FA;
            }
            
            table tr:hover{
                background: #e9ecef;
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
                            <li><a href="profile"><i class="fa-solid fa-user"></i>Profile</a></li>
                            <li><a href="catetable"><i class="fa-solid fa-layer-group"></i>Category group</a></li>
                            <li class="active"><a href="productmanager"><i class="fa-brands fa-product-hunt"></i>Product</a></li>
                            <li><a href="accountmanager"><i class="fa-brands fa-blogger"></i>Account</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 container_content">
                    <div class="page-breadcrumb">
                        <h4>Product</h4>
                        <div class="breadcrumb__links">
                            <a href="dashboard">Home</a>
                            <i class="fa-solid fa-angle-right"></i>
                            <span>Product</span>
                        </div>
                    </div>
                    <div class="container2">
                        <center>
                            <h1>The list of products</h1>
                            <a href="add">Add new</a>
                            <table  width='100%' style="background: white; "  >
                                <tr style="border-bottom: 1px #e9ecef solid ; background: #e9ecef">
                                    <th style="width: 25px">ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Category</th>
                                    <th>Brand</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>ReleaseDate</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach items="${requestScope.data}" var="p">
                                    <c:set var='id' value="${p.id}" />
                                    <tr style="border-bottom: 1px #e9ecef solid ">
                                        <td>${id}</td>
                                        <td>${p.name}</td>
                                        <td><img style="width:30px;height: 40px" src="${p.images}" alt="alt"/></td>
                                        <td>${p.category}</td>
                                        <td>${p.brand}</td>
                                        <td style="width: 70px">${p.price}</td>
                                        <td>${p.quantity}</td>
                                        <td>${p.releaseDate}</td>
                                        <td style="width: 150px">
                                            <button><a href="actionproduct?action=update&id=${id}">Update</a></button>
                                            <button><a href="#" onclick="doDelete('${id}')">Delete</a></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </center>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
