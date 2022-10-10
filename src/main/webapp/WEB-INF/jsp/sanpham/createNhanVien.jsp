
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
	<h1>Create Nhân Viên </h1>
	<br>
	
		<form method="post" action="/sanpham/admin/createNV">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>ID Nhân Viên :</label> <input type="text" class="form-control"
						name="manv" placeholder="ID">
				</div>

				<div class="form-group col-md-6">
					<label>Name Nhân Viên :</label> <input type="text" class="form-control"
						name="tennv" placeholder="Name">
				</div>

			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<label>PassWord :</label> <input type="text" class="form-control"
						name="matkhau" placeholder="PassWord">
				</div>

				<div class="form-group col-md-4">
					<label>Quê quán :</label> <input type="text" class="form-control"
						name="quequan" placeholder="Quê quán">
				</div>

				<div class="form-group col-md-4">
				<br><br>
					<label>Vai trò</label> <select name="vaitro">

						<option selected value="0">Nhân Viên</option>
						<option value="1">Admin</option>
						
					</select>
				</div>

			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label>CreateDay :</label> <input type="date" class="form-control"
						name="ngayvao" placeholder="CreateDay">
				</div>

				<div class="form-group col-md-6">
					<label>Phone Number :</label> <input type="text" class="form-control"
						name="sodt" placeholder="Phone">
				</div>

			</div>
			
	

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>