<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Trang chủ</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
<base href="${pageContext.servletContext.contextPath}/">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Gamja+Flower');

html, body {
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

.carousel-inner img {
	height: 700px;
	background: fixed;
	width: 100%;
}

.carousel-inner h3 {
	font-size: 72px;
	text-transform: uppercase;
	text-shadow: 5px 5px 15px #000000;
}

.carousel-caption {
	position: absolute;
	top: 50%;
}

.btn-primary {
	background: #222;
	border: 1px solid white;
}

.btn-primary:hover {
	color: #000000;
	background: #ccc8c8;
}

.jumbotron {
	padding: 1rem;
	border-radius: 0;
}

.welcome hr {
	border-top: 2px solid #222;
	width: 95%;
}

.card img {
	transition: all ease-in-out 500ms;
	transform: scale(1);
	height: 500px;
}

.social a {
	font-size: 3em;
	padding: 3rem;
}

footer {
	padding-top: 10px;
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
/* Media query */
@media ( max-width : 992px) {
	.carousel-caption {
		top: 40%;
	}
	.carousel-caption h3 {
		font-size: 250%;
	}
	.carousel-caption .btn {
		font-size: 125%;
	}
}

@media ( max-width : 768px) {
	.carousel-caption {
		top: 30%;
	}
	.carousel-caption h3 {
		font-size: 200%;
	}
	.carousel-caption .btn {
		font-size: 110%;
	}
}

@media ( max-width : 576px) {
	.carousel-caption {
		top: 20%;
	}
	.carousel-caption h3 {
		font-size: 170%;
	}
	.carousel-caption .btn {
		font-size: 90%;
	}
}

.card {
	overflow: hidden;
	cursor: pointer;
	position: relative;
}

.card:hover img {
	transform: scale(1.1);
}

.title-sanpham {
	color: #000000;
	text-decoration: none;
}
.sale{
	position: absolute;
	z-index: 1;
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<nav class="navbar navbar-expand-md bg-light navbar-light sticky-top">
		<div class="container-fluid">
			<a href="/sanpham/trangchu" id="logo" class="navbar-branch"> <h1>MEN STORE</h1>
			</a>
			<form class="form-inline my-2 my-lg-0"
				action="/sanpham/detail/search" method="post">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					name="search" value="" />
			</form>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="/sanpham/trangchu"
					class="nav-link active">Trang chủ</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdownId"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quần
						nam</a>
					<div class="dropdown-menu" aria-labelledby="dropdownId">
						<a class="dropdown-item" href="/sanpham/detail/quandai">Quần
							dài</a> <a class="dropdown-item" href="/sanpham/detail/quanngan">Quần
							short</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdownId"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Áo
						nam</a>
					<div class="dropdown-menu" aria-labelledby="dropdownId">
						<a class="dropdown-item" href="/sanpham/detail/aosomi">Áo sơ
							mi</a> <a class="dropdown-item" href="/sanpham/detail/aophong">Áo
							phông</a>
					</div></li>
				<li class="nav-item"><a href="/sanpham/detail/giay"
					class="nav-link">Giày nam</a></li>
				<li class="nav-item"><a href="#" class="nav-link">Blog</a></li>
				<li class="nav-item"><a href="#" class="nav-link">Liên hệ</a></li>
				<li class="nav-item"><a href="/sanpham/cart">
                   	<button type="button" class="btn btn-secondary">
					  <i class="fa fa-shopping-cart" style="font-size:36px;"></i> <span class="badge badge-light">${cart.size()}</span>
					</button>
                </a></li>
			</ul>
		</div>
	</nav>

	<div id="carouselId" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselId" data-slide-to="0" class="active"></li>
			<li data-target="#carouselId" data-slide-to="1"></li>
			<li data-target="#carouselId" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img data-src="holder.js/900x500/auto/#777:#555/text:First slide"
					alt="First slide" src="images/slide-show-1.jpg">
				<div class="carousel-caption">
					<h3 class="display-2">Đẳng cấp thời trang nam</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img data-src="holder.js/900x500/auto/#666:#444/text:Second slide"
					alt="Second slide" src="images/slide-show-2.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-2">Đẳng cấp thời trang nam</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img data-src="holder.js/900x500/auto/#666:#444/text:Third slide"
					alt="Third slide" src="images/slide-show-3.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-2" style="color: #000000;">Đẳng cấp thời
						trang nam</h3>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselId" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselId" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<div class="container-fluid">
		<div class="jumbotron">
			<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
				<p>Những chiếc áo sơ mi nam lịch lãm được chúng tôi lựa chọn kỹ
					lưỡng sẽ đem đến cho quý vị cảm giác cực kỳ thoải mái và dễ chịu
					khi mặc.</p>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-2">
				<a href="/sanpham/detail/aosomi">
					<button type="button" class="btn btn-outline-secondary">
						Xem ngay</button>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid padding">
		<div class="row welcome text-center">
			<div class="col-12">
				<h1 class="display-4">ĐẲNG CẤP THỜI TRANG NAM</h1>
			</div>
			<hr>
		</div>
	</div>
	<hr class="my-4">
	<div class="container-fluid padding">
		<div class="row padding">
			<div class="col-md-12 col-lg-6 ">
				<h2>BIG SALE</h2>
				<p>BIG SALE - Nhằm tri ân khách hàng chúng tôi tạo ra đợt giảm
					giá lớn nhất giúp quý tha hồ lựa chọn những sản phẩm yêu thích.</p>
			</div>
			<div class="col-lg-6">
				<a href="/sanpham/detail/hanggiamgia"> <img
					src="images/logo1.jpg" alt="" class="img-fluid">
				</a>
			</div>
		</div>
	</div>
	<hr class="my-2">
	<h1>Một số sản phẩm BIG SALE</h1>
	<hr class="my-2">
	<div class="container-fluid padding">
		<div class="row padding">
			<c:set var="count" value="-1" />
			<c:forEach var="sp" items="${list1}">
				<c:set var="count" value="${count+1}" />
				<c:choose>
					<c:when test="${count <3 }">
						<div class="col-md-4">
							<div class="card">
								<a href="/sanpham/thongtinsanpham/${sp.masanpham}"> <img
									src="images/${sp.hinhanh}" alt="" class="card-img-top">
								</a>
								<div class="sale">
									<img alt="" src="images/giamgia-0001" style="width: 50px"/>
								</div>
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
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<hr class="my-4">
	<div class="container-fluid padding">
		<div class="row padding">
			<div class="col-lg-6">
				<a href="/sanpham/detail/giay"> <img src="images/logo2.jpg"
					alt="" class="img-fluid">
				</a>
			</div>
			<div class="col-md-12 col-lg-6 ">
				<h2>HOT</h2>
				<p>Những bộ trang phục được ưa thích nhất hiện nay, đã được
					chúng tôi lựa chọn kỹ lưỡng sẽ đem đến cho quý vị cảm giác cực kỳ
					thoải mái và dễ chịu khi mặc.</p>
			</div>
		</div>
	</div>
	<hr class="my-2">
	<h1>Một số sản phẩm Giày HOT</h1>
	<hr class="my-2">
	<div class="container-fluid padding">
		<div class="row padding">
			<c:set var="count" value="-1" />
			<c:forEach var="sp" items="${list2}">
				<c:set var="count" value="${count+1}" />
				<c:choose>
					<c:when test="${count <3 }">
						<div class="col-md-4">
							<div class="card">
								<a href="/sanpham/thongtinsanpham/${sp.masanpham}"> <img
									src="images/${sp.hinhanh}" alt="" class="card-img-top">
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

					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<hr class="my-4">
	<div class="container-fluid padding">
		<div class="row text-center padding">
			<div class="col-12">
				<h2>Liên hệ</h2>
			</div>
			<div class="col-12 social padding">
				<a href="youtube.com"><i class="fab fa-facebook"></i></a> <a
					href="youtube.com"><i class="fab fa-twitter"></i></a> <a
					href="youtube.com"><i class="fab fa-google-plus-g"></i></a> <a
					href="youtube.com"><i class="fab fa-instagram"></i></a> <a
					href="youtube.com"><i class="fab fa-youtube"></i></a>

			</div>
		</div>
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
				<div class="col-md-4">
					<h4>TRỢ GIÚP VÀ TƯ VẤN</h4>
					<p>>> Liên hệ</p>
					<p>>> Bản đồ</p>
					<p>>> Chính sách giao hàng</p>
					<p>>> Chính sách đổi hàng</p>
					<p>>> Cách chọn size quần áo</p>
				</div>
				<div class="col-12">
					<hr class="light-100">
					<h5>MEN STORE</h5>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>