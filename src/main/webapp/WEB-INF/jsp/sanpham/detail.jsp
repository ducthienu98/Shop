<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Trang sản phẩm</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        
        <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
    <base href="${pageContext.servletContext.contextPath}/">
    <style>

        html,
        body {
            width: 100%;
            height: 100%;
            font-family: 'Noto Sans JP', sans-serif;
			font-size: 16px;
            color: #222;
        }

        .navbar {
            display: grid;
            grid-template-columns: 1fr 700px;
            width: 100%;
            position: fixed;
        }

        .navbar li a:hover {
            color: #000000 !important;
        }


        .jumbotron h3 {
            padding-top: 45px;
        }

        .card img {
            height: 500px;
            transition: all ease-in-out 500ms;
            transform: scale(1); 
        }

        footer {
        	padding-top:10px;
            background: #222;
            color: #ccc8c8;
        }
		.gia-san-pham{
        	color: red;
        	font-size: 36px;
        }
        .light-100 {
            border-top: 1px solid #d5d5d5;
            width: 100%;
        }
        .social a {
    		font-size: 1.5em;
   			padding: 1rem;
		}
		.col-md-4{
			margin-bottom: 10px;
		}
		.card{
			overflow: hidden;
            cursor: pointer;
            position: relative;
		}
		.card:hover img{
            transform: scale(1.1);
        }
       .title-sanpham{        
            color: #000000;   
            text-decoration: none;
        }
        #logo{
        	font-family: 'Rowdies', cursive;
        	color: #000000;
        	text-decoration: none;
        }
    </style>
    
</head>

<body>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    <nav class="navbar navbar-expand-md bg-light navbar-light sticky-top">
        <div class="container-fluid">
            <a href="/sanpham/trangchu" id="logo" class="navbar-branch">
                <h1>MEN STORE</h1>
            </a>
            <form class="form-inline my-2 my-lg-0" action="/sanpham/detail/search" method="post">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" name="search" value=""/>
            </form>
        </div>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="/sanpham/trangchu" class="nav-link active">Trang chủ</a>
                </li>
                
                <li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quần nam</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="/sanpham/detail/quandai">Quần dài</a>
                        <a class="dropdown-item" href="/sanpham/detail/quanngan">Quần short</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Áo nam</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="/sanpham/detail/aosomi">Áo sơ mi</a>
                        <a class="dropdown-item" href="/sanpham/detail/aophong">Áo phông</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="/sanpham/detail/giay" class="nav-link">Giày nam</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Blog</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Liên hệ</a>
                </li>
                <li class="nav-item">
                    <a href="/sanpham/cart">
                    	<button type="button" class="btn btn-secondary">
						  <i class="fa fa-shopping-cart" style="font-size:36px;"></i> <span class="badge badge-light">${cart.size()}</span>
						</button>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid">  
        <div class="jumbotron text-center">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h3 class="display-4">${message }</h3>
                </div>
                <hr>
                <div class="col-12">
                    <p>Chúng tôi luôn đem đến cho quý khách những sản phẩm chất lượng nhất.</p>
                </div>
            </div>
        </div>
    </div>
    <c:set var="max" value="-1"/>
    <c:forEach var="abc" items="${list }">
    	<c:set var="max" value="${max+1}"/>
    </c:forEach>
    <div class="container-fluid padding">
    	<div class="row padding">
        <c:set var="count" value="-1"/>
        <c:forEach var="sp" items="${list}">
        <c:set var="count" value="${count+1}"/>
        <c:set var="max" value="${max }"/>
        	<c:choose>
            	<c:when test="${count % 3 == 0 }">
            		</div>
            		<div class="row padding">
            	</c:when>
            </c:choose>
        	<div class="col-md-4">    		
                 <div class="card"> 
                   	<a href="/sanpham/thongtinsanpham/${sp.masanpham}">          	
						<img src="images/${sp.hinhanh}" alt="" class="card-img-top">   
					</a>        	
        			<div class="card-body">		
            			<h4 class="title-sanpham">${sp.tensanpham}</h4>			
            			<c:choose>
		            		<c:when test="${sp.giamgia.chitietgiam != 0}">		
		            			<p>Giá cũ: <span style="text-decoration: underline;">${sp.giaban}</span> <sup>đ</sup></p>
			           			<p>Giá mới: <span class="gia-san-pham">${sp.giaban - (sp.giamgia.chitietgiam * sp.giaban)}</span><sup>đ</sup></p>
		            		</c:when>
		            		<c:otherwise>
		            			<p>Giá bán: <span class="gia-san-pham">${sp.giaban}<sup>đ</sup></span></p>
		            		</c:otherwise>
		           		</c:choose>		
        			</div>	
               	</div> 	
            </div>
            <c:choose>
            	<c:when test="${count == max }">
            		</div>
            	</c:when>
            </c:choose>
        </c:forEach>
    </div>    
    <footer>
        <div class="container-fluid padding">
            <div class="row text-center">
                <div class="col-md-4">
                    <h4>ĐỊA CHỈ SHOP TẠI HÀ NỘI</h4>
                    <p>Đ/c 1: so 1, trinh van bo, ha noi</p>
                    <p>Đ/c 2: so 1, trinh van bo, ha noi</p>
                    <p>Đ/c 3: so 1, trinh van bo, ha noi</p>
                    <p>Đ/c 4: so 1, trinh van bo, ha noi</p>
                    <p>Đ/c 5: so 1, trinh van bo, ha noi</p>
                </div>
                <div class="col-md-4">
                    <h4>THƯƠNG HIỆU THỜI TRANG NAM</h4>
                    <p>Hot line: 0123456789</p>
                    <p>Gmail: abcxyz123@gmail.com</p>
                    <p>Facebook: Man store</p>
                    <p>Instagram: manstore.hn</p>
                    <p>Tiktok: Man Store</p>
                </div>
                <div class="col-md-4 social padding">
                    <h2>Liên hệ</h2>
                    <a href="youtube.com"><i class="fab fa-facebook"></i></a>
                    <a href="youtube.com"><i class="fab fa-twitter"></i></a>
                    <a href="youtube.com"><i class="fab fa-google-plus-g"></i></a>
                    <a href="youtube.com"><i class="fab fa-instagram"></i></a>
                    <a href="youtube.com"><i class="fab fa-youtube"></i></a>
                </div>
                <hr class="my-4">
                <div class="col-12">
                    <hr class="light-100">
                    <h5>MEN STORE</h5>
                </div>
            </div>
        </div>
    </footer>

</body>

</html>