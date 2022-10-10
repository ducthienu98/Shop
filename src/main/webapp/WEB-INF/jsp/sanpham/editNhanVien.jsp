
<!DOCTYPE html>
<html lang="en">
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
	<h1>Edit Nhân Viên </h1>
	<br>
	
		<form method="post" action="/sanpham/admin/editNV">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>ID Nhân Viên :</label> <input type="text" class="form-control"
						name="manv" value=${requestScope["nhanvien"].getManv()}>
				</div>

				<div class="form-group col-md-6">
					<label>Name Nhân Viên :</label> <input type="text" class="form-control"
						name="tennv" value=${requestScope["nhanvien"].getTennv()}>
				</div>

			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<label>PassWord :</label> <input type="text" class="form-control"
						name="matkhau" value=${requestScope["nhanvien"].getMatkhau()}>
				</div>

				<div class="form-group col-md-4">
					<label>Quê quán :</label> <input type="text" class="form-control"
						name="quequan" value=${requestScope["nhanvien"].getQuequan()}>
				</div>

				<div class="form-group col-md-4">
					<label>Role NV :</label> <input type="number"
						class="form-control" name="vaitro" value=${requestScope["nhanvien"].getVaitro()}>
				</div>

			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label>CreateDay :</label> <input type="date" class="form-control"
						name="ngayvao"value=${requestScope["nhanvien"].getNgayvao()}>
				</div>

				<div class="form-group col-md-6">
					<label>Phone Number :</label> <input type="text" class="form-control"
						name="sodt" value=${requestScope["nhanvien"].getSodt()}>
				</div>

			</div>
			
	

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>