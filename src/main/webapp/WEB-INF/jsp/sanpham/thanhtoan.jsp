<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
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

        .infomation {
            display: grid;
            grid-template-columns: 450px 1fr;
            grid-gap: 10px;
            margin-top: 100px;
        }

        .combobox {
            width: 500px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
        }

        .gia-san-pham {
            color: red;
            font-size: 36px;
        }

        footer {
            padding-top: 10px;
            background: #222;
            color: #ccc8c8;
        }

        .light-100 {
            border-top: 1px solid #d5d5d5;
            width: 100%;
        }

        .social a {
            font-size: 1.5em;
            padding: 1rem;
        }

        .col-md-4 {
            margin-bottom: 10px;
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

        .link-text {
            text-decoration: none;
        }

        .jumbotron h3 {
            padding-top: 45px;
        }

        .card img {
            height: 500px;
            transition: all ease-in-out 500ms;
            transform: scale(1);
        }

        #form{
            width: 600px;
            margin-left: 50px;
        }
        .form-group{
            width: 500px;
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
            <a href="/sanpham/trangchu" id="logo"  class="navbar-branch"><h1>MEN STORE</h1>
            </a>
            <form class="form-inline my-2 my-lg-0" action="/sanpham/detail/search" method="post">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" name="search" value="" />
            </form>
        </div>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="/sanpham/trangchu" class="nav-link active">Trang chủ</a></li>

                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdownId"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quần
                        nam</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="/sanpham/detail/quandai">Quần
                            dài</a> <a class="dropdown-item" href="/sanpham/detail/quanngan">Quần
                            short</a>
                    </div>
                </li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdownId"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Áo
                        nam</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="/sanpham/detail/aosomi">Áo sơ
                            mi</a> <a class="dropdown-item" href="/sanpham/detail/aophong">Áo
                            phông</a>
                    </div>
                </li>
                <li class="nav-item"><a href="/sanpham/detail/giay" class="nav-link">Giày nam</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Liên hệ</a></li>
                <li class="nav-item cart-icon"><a href="/sanpham/cart">
                    <button type="button" class="btn btn-secondary">
						  <i class="fa fa-shopping-cart" style="font-size:36px;"></i> <span class="badge badge-light">${cart.size()}</span>
						</button>
                    </a></li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid padding" style="padding: 100px 0px;">
        <c:forEach var="sp" items="${cart}">
        	<input type="hidden"value="${item.value.soLuong}" name="txtSoLuong${ item.value.sanPham.masanpham}" id="txtSoLuong${ item.value.sanPham.masanpham }"/> 
        	<input type="hidden"value="${item.value.size}" name="txtSize${item.value.size}" id="txtSize${item.value.size}"/>
        	<input type="hidden"value="${item.value.sanPham.masanpham }" name="txtMa${item.value.sanPham.masanpham }" id="txtMa${item.value.sanPham.masanpham }"/>  
        </c:forEach>
        <form action="/sanpham/thanhtoan/${tien}" method="post">
            <h1>THANH TOÁN ĐƠN HÀNG</h1>
            <hr class="my-4">
            <div class="form-group">
                <label for="">Họ tên:</label>
                <input type="text" class="form-control" name="txtTenKH" id="" aria-describedby="helpId" placeholder="Ho ten">
            </div>
            <div class="form-group">
                <label for="">Email:</label>
                <input type="text" class="form-control" name="txtEmailKH" id="" aria-describedby="helpId" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="">Số điện thoại:</label>
                <input type="text" class="form-control" name="txtSoDTKH" id="" aria-describedby="helpId" placeholder="So dien thoai">
            </div>
            <div class="form-group">
              <label for="">Địa chỉ</label>
              <textarea class="form-control" name="txtDiaChiKH" id="" rows="3" placeholder="Địa chỉ của bạn"></textarea>
            </div>
            <hr class="my-4">
            <button type="submit" name="" id="" class="btn btn-primary">Gửi thông tin</button>
        </form>
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