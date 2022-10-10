<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<head>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<title>Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="../images\template\vendors\ti-icons\css\themify-icons.css">
<link rel="stylesheet"
	href="../images\template\vendors\base\vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../images\template\css\style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../images\template\images\favicon.png" />
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>

	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="index.html"><img
					src="images/logo.svg" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index.html"><img
					src="images/logo-mini.svg" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="ti-view-list"></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="ti-search"></i>
								</span>
							</div>
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search now" aria-label="search"
								aria-describedby="search">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown mr-1"><a
						class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
						id="messageDropdown" href="#" data-toggle="dropdown"> <i
							class="ti-email mx-0"></i>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="messageDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
							<a class="dropdown-item">
								<div class="item-thumbnail">
									<img src="images/faces/face4.jpg" alt="image"
										class="profile-pic">
								</div>
								<div class="item-content flex-grow">
									<h6 class="ellipsis font-weight-normal">David Grey</h6>
									<p class="font-weight-light small-text text-muted mb-0">
										The meeting is cancelled</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">
									<img src="images/faces/face2.jpg" alt="image"
										class="profile-pic">
								</div>
								<div class="item-content flex-grow">
									<h6 class="ellipsis font-weight-normal">Tim Cook</h6>
									<p class="font-weight-light small-text text-muted mb-0">
										New product launch</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">
									<img src="images/faces/face3.jpg" alt="image"
										class="profile-pic">
								</div>
								<div class="item-content flex-grow">
									<h6 class="ellipsis font-weight-normal">Johnson</h6>
									<p class="font-weight-light small-text text-muted mb-0">
										Upcoming board meeting</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="ti-bell mx-0"></i> <span class="count"></span>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="notificationDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
							<a class="dropdown-item">
								<div class="item-thumbnail">
									<div class="item-icon bg-success">
										<i class="ti-info-alt mx-0"></i>
									</div>
								</div>
								<div class="item-content">
									<h6 class="font-weight-normal">Application Error</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Just now</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">
									<div class="item-icon bg-warning">
										<i class="ti-settings mx-0"></i>
									</div>
								</div>
								<div class="item-content">
									<h6 class="font-weight-normal">Settings</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Private message</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">
									<div class="item-icon bg-info">
										<i class="ti-user mx-0"></i>
									</div>
								</div>
								<div class="item-content">
									<h6 class="font-weight-normal">New user registration</h6>
									<p class="font-weight-light small-text mb-0 text-muted">2
										days ago</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <img src="images/faces/face28.jpg"
							alt="profile" />
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
								Settings
							</a> <a class="dropdown-item"> <i
								class="ti-power-off text-primary"></i> Logout
							</a>
						</div></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="ti-view-list"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="index.html">
							<i class="ti-shield menu-icon"></i> <span class="menu-title">Dashboard</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i class="ti-palette menu-icon"></i>
							<span class="menu-title">Acout</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">

								<li class="nav-item"><a class="nav-link"
									href="sanpham/admin/createNV">New Acout</a></li>
							</ul>
						</div></li>


					<li class="nav-item"><a class="nav-link"
						href="sanpham/admin/create"> <i class="ti-write menu-icon"></i>
							<span class="menu-title">New Product</span>
					</a></li>
				</ul>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h4 class="font-weight-bold mb-0">Dashboard</h4>
								</div>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Total
										Product</p>
									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">

										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${tong1}</h3>

										<i class="ti-calendar icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
									<br>
									<button class="btn btn-outline-success" id="btnProducts">Show/Hide
										Product</button>
								</div>
							</div>
						</div>
						<div class="col-md-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Total
										Employees</p>

									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${tong5}</h3>
										<i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
									<br>
									<button class="btn btn-outline-success" id="btnEmployees">Show/Hide
										Employees</button>
								</div>
							</div>
						</div>
						<div class="col-md-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Total
										Invoice</p>
									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${tong2}</h3>
										<i class="ti-agenda icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
									<p class="mb-0 mt-2 text-success">
										Thanh cong<span class="text-black ml-1">
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title text-md-center text-xl-left">Total
										Revenue</p>
									<div
										class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
										<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">${tong3}</h3>
										<i
											class="ti-layers-alt icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
									</div>
									<p class="mb-0 mt-2 text-success">
										VND<span class="text-black ml-1">
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 grid-margin stretch-card" id="Products">
							<div class="card">
								<div class="card-body">
									<p class="card-title mb-0">List Products</p>
									<br>

									<div class="col-md-5 grid-margin stretch-card">
										<select class="custom-select mr-sm-2"
											id="inlineFormCustomSelect">
											<option selected>All</option>
											<option onclick="#">Quan</a></option>
											<option value="2">Ao</option>

										</select>
									</div>

									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>ID</th>
													<th>Name</th>
													<th>Price</th>
													<th>DateCreate</th>
													<th>Img</th>

													<th>Status</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="sp" items="${list}">
													<tr>
														<td>${sp.masanpham}</td>
														<td>${sp.tensanpham}</td>
														<td class="text-danger">${sp.giaban}</td>
														<td><label class="badge badge-danger">${sp.ngaynhapkho}</label></td>
														<td><img src="images/${sp.hinhanh }" height="50"
															width="50" /></td>

														<td><c:choose>
																<c:when test="${sp.trangthai=='1'}">
																	<label class="badge badge-success">Hiên thi</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-warning">Ẩn</label>
																	<br />
																</c:otherwise>
															</c:choose></td>
														<td><a href="sanpham/admin/edit?id=${sp.masanpham}">Edit</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="container">
										<ul class="pagination">
											<li class="page-item"><a class="page-link"
												href="sanpham/admin?size=10&page=0">Truoc</a></li>
											<c:forEach var="i" begin="1" end="10">
												<li class="page-item"><a class="page-link"
													href="sanpham/admin?size=10&page=${i }">${i}</a></li>
												<p>
											</c:forEach>

											<li class="page-item"><a class="page-link"
												href="sanpham/admin?size=10&page=10">Sau</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 grid-margin stretch-card" id="Employees">
							<div class="card">
								<div class="card-body">
									<p class="card-title mb-0">List Employees</p>
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>Id NV</th>
													<th>Name NV</th>
													<th>Password</th>
													<th>Aress</th>
													<th>Role</th>
													<th>SDT</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="nv" items="${listNhanVien}">
													<tr>
														<td>${nv.manv}</td>
														<td>${nv.tennv}</td>
														<td>${nv.matkhau}</td>
														<td>${nv.quequan}</td>													
														<td><c:choose>
																<c:when test="${nv.vaitro=='1'}">
																	<label class="badge badge-success">Admin</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-warning">Nhân Viên</label>
																	<br />
																</c:otherwise>
															</c:choose></td>
														<td>${nv.sodt}</td>
														<td><a href="sanpham/admin/editNV?id=${nv.manv}">Edit</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>


								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 grid-margin stretch-card" id="HoaDon">
							<div class="card">
								<div class="card-body">
									<p class="card-title mb-0">List Hóa Đơn</p>
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>Id HĐ</th>
													<th>Tổng Tiền</th>
													<th>Name người mua</th>
													<th>Email</th>
													<th>SĐT</th>
													<th>Địa chỉ</th>
													<th>Trạng thái</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="hd" items="${listHoaDon}">
													<tr>
														<td>${hd.mahoadon}</td>
														<td>${hd.tongtien}</td>
														<td>${hd.tennguoimua}</td>
														<td>${hd.email}</td>
														<td>${hd.sodienthoai}</td>
														<td>${hd.diachi}</td>														
														<td><c:choose>
																<c:when test="${hd.trangthai=='1'}">
																	<label class="badge badge-success">Thành công</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-warning">Đang thực hiện</label>
																	<br />
																</c:otherwise>
															</c:choose></td>
														<td><a href="sanpham/admin/editNV?id=${hd.mahoadon}">Edit</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>


								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 grid-margin stretch-card" id="HoaDonChiTiet">
							<div class="card">
								<div class="card-body">
									<p class="card-title mb-0">List Hóa Đơn Chi Tiết</p>
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>Id HĐCT</th>
													<th>Id Hóa Đơn</th>
													<th>ID Sản Phẩm</th>
													<th>Id Size</th>
													<th>Số Lượng</th>
													<th>Thành tiền</th>
													<th>Trạng thái</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="hdct" items="${listHoaDonChiTiet}">
													<tr>
														<td>${hdct.mahoadonchitiet}</td>
														<td>${hdct.hoadon.mahoadon}</td>
														<td>${hdct.sanpham.masanpham}</td>
														<td>${hdct.tensize}</td>
														<td>${hdct.soluong}</td>
														<td>${hdct.thanhtien}</td>
														
														<td><c:choose>
																<c:when test="${hdct.trangthai=='1'}">
																	<label class="badge badge-success">Thành Công</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-warning">Đang thực hiện</label>
																	<br />
																</c:otherwise>
															</c:choose></td>
														<td><a href="sanpham/admin/editHDCT?id=${hdct.mahoadonchitiet}">Edit</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>


								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<p class="card-title">Thong Kê Doanh Số</p>
									<div class="row">
										<div
											class="col-md-12 col-xl-3 d-flex flex-column justify-content-center">
											<div class="ml-xl-4">
												<h1>${tong1 }</h1>
												<h3 class="font-weight-light mb-xl-4">Product</h3>
												<p class="text-muted mb-2 mb-xl-0">Toàn Bô Sản Phâm Hiên
													Có Của Shop</p>
											</div>
										</div>
										<div class="col-md-12 col-xl-9">
											<div class="row">
												<%-- <div class="col-md-6 mt-3 col-xl-5">
													<canvas id="north-america-chart"></canvas>
													<div id="north-america-legend"></div>
												</div> --%>
												<div class="col-xl-8">
													<div class="table-responsive mb-3 mb-md-0">
														<table class="table table-borderless report-table">
															<tr>
																<td class="text-muted">Áo sơ mi</td>
																<td class="w-100 px-0">
																	<div class="progress progress-md mx-4">
																		<div class="progress-bar bg-primary"
																			role="progressbar" style="width: 70%"
																			aria-valuenow="70" aria-valuemin="0"
																			aria-valuemax="100"></div>
																	</div>
																</td>
																<td><h5 class="font-weight-bold mb-0"></h5>20</td>
															</tr>
															<tr>
																<td class="text-muted">Áo phông</td>
																<td class="w-100 px-0">
																	<div class="progress progress-md mx-4">
																		<div class="progress-bar bg-primary"
																			role="progressbar" style="width: 30%"
																			aria-valuenow="30" aria-valuemin="0"
																			aria-valuemax="100"></div>
																	</div>
																</td>
																<td><h5 class="font-weight-bold mb-0">22</h5></td>
															</tr>
															<tr>
																<td class="text-muted">Giày nam</td>
																<td class="w-100 px-0">
																	<div class="progress progress-md mx-4">
																		<div class="progress-bar bg-primary"
																			role="progressbar" style="width: 95%"
																			aria-valuenow="95" aria-valuemin="0"
																			aria-valuemax="100"></div>
																	</div>
																</td>
																<td><h5 class="font-weight-bold mb-0">13</h5></td>
															</tr>
															<tr>
																<td class="text-muted">Quan dài</td>
																<td class="w-100 px-0">
																	<div class="progress progress-md mx-4">
																		<div class="progress-bar bg-primary"
																			role="progressbar" style="width: 60%"
																			aria-valuenow="60" aria-valuemin="0"
																			aria-valuemax="100"></div>
																	</div>
																</td>
																<td><h5 class="font-weight-bold mb-0">25</h5></td>
															</tr>
															<tr>
																<td class="text-muted">Quan ngan</td>
																<td class="w-100 px-0">
																	<div class="progress progress-md mx-4">
																		<div class="progress-bar bg-primary"
																			role="progressbar" style="width: 40%"
																			aria-valuenow="40" aria-valuemin="0"
																			aria-valuemax="100"></div>
																	</div>
																</td>
																<td><h5 class="font-weight-bold mb-0">53</h5></td>
															</tr>

														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Edit
							by <a href="#" target="_blank">JohnToan</a>.
						</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
							& made with <i class="ti-heart text-danger ml-1"></i>
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- plugins:js -->
	<script src="../images\template\vendors\base\vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<script src="../images\template\vendors\chart.js\Chart.min.js"></script>
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="../images\template\js\off-canvas.js"></script>
	<script src="../images\template\js\hoverable-collapse.js"></script>
	<script src="../images\template\js\template.js"></script>
	<script src="../images\template\js\todolist.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="../images\template\js\dashboard.js"></script>
	<!-- End custom js for this page-->
	<script>
		function isShowEmployees() {
			$("#Employees").toggle();
		};

		function isShowProduct() {
			$("#Products").toggle();
		};

		$('#btnEmployees').click(isShowEmployees);
		$('#btnProducts').click(isShowProduct);
	</script>

</body>

</html>

