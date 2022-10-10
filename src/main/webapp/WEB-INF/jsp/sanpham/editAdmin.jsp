<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<head>
<title>Bootstrap Example</title>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
	<br>
	<h1>Edit Product </h1>
	<br>
	
		<form method="post" action="/sanpham/admin/edit">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>ID-SP :</label> <input type="text" class="form-control"
						name="masanpham" value=${requestScope["product"].getMasanpham()}>
				</div>

				<div class="form-group col-md-6">
					<label>NameSP :</label> <input type="text" class="form-control"
						name="tensanpham" value=${requestScope["product"].getTensanpham()}>
				</div>

			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<label>Color :</label> <input type="text" class="form-control"
						name="mau" value=${requestScope["product"].getMau()}>
				</div>

				<div class="form-group col-md-4">
					<label>Price In :</label> <input type="number" class="form-control"
						name="gianhap" value=${requestScope["product"].getGianhap()}>
				</div>

				<div class="form-group col-md-4">
					<label>Price Out :</label> <input type="number"
						class="form-control" name="giaban" value=${requestScope["product"].getGiaban()}>
				</div>

			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label>CreateDay :</label> <input type="date" class="form-control"
						name="ngaynhapkho" value=${requestScope["product"].getNgaynhapkho()}>
				</div>

				<div class="form-group col-md-6">
					<label>Link IMG :</label> <input type="text" class="form-control"
						name="hinhanh" value=${requestScope["product"].getHinhanh()}>
				</div>

			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">Content</label>
				<textarea class="form-control" name="motasanpham"
					rows="3" > ${requestScope["product"].getMotasanpham()}  </textarea>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label>LoaiSP</label> <select name="maloai">

						<option selected value="Ao01">sơ mi</option>
						<option value="Ao02">Phông</option>
						<option value="Giay01">Giày Nam</option>
						<option value=Quan01>Quân dài</option>
						<option value="Quan02">Quân Ngăn</option>
					</select>
				</div>

				<div class="form-group col-md-4">
					<label>Sale</label> <select name="magiamgia">

						<option selected value="GG01">0.1</option>
						<option value="GG02">0.2</option>
						<option value="GG03">0.3</option>
						<option value="GG04">0.4</option>
						<option value="GG05">0.5</option>
					</select>
				</div>

				<div class="form-group col-md-2">
					<label>Status</label> <select name="trangthai">

						<option value="0">An</option>
						<option selected value="1">Hien</option>
					</select>
				</div>

			</div>



			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>