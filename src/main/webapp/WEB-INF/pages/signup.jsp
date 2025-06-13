<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SivaItSignUp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: white;
}

.container {
	max-width: 900px;
	border-radius: 10px;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
}

.form-control {
	margin-bottom: 10px;
}

.error {
	color: red;
	font-size: 0.9rem;
	margin-bottom: 8px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-6 p-3">
				<img alt="" src="images/testlogo.png"  class="text-center mb-2" height="100px" width="100px"
					style="margin-left: 125px;">
					<h3 class="text-center text-primary mb-3">Sign Up Details</h3>
				
				<p class="text-danger">${errMsg}</p>
				<frm:form modelAttribute="user" onsubmit="return validateForm();">
					<div>
						<frm:input type="text" class="form-control" id="name"
							path="userName" placeholder="Enter your Name" />
						<span id="nameError" class="error"></span>
					</div>
					<div>
						<frm:input type="email" class="form-control" id="email"
							path="userEmail" placeholder="Enter your Email" />
						<span id="emailError" class="error"></span>
					</div>
					<div>
						<frm:input type="password" class="form-control" id="password"
							path="userPassword" placeholder="Enter your Password" />
						<span id="passwordError" class="error"></span>
					</div>
					<div>
						<frm:input type="tel" class="form-control" id="phone"
							path="userPhno" placeholder="Enter your Phone Number" />
						<span id="phoneError" class="error"></span>
					</div>
					<button type="submit" class="btn btn-primary w-100">Sign
						Up</button>
				</frm:form>
				<div class="text-center mt-2">
					<p>
						Already have an account? <a href="login"><button
								class="btn btn-outline-danger">Login</button></a>
					</p>
				</div>
			</div>
			<div
				class="col-md-6 text-white text-center d-flex flex-column justify-content-center p-3"
				style="background: #007bff;">
				<h3>SelfTest – Learn, Practice, and Grow</h3>
				<p>Your space to create questions, take tests, and improve
					anytime, anywhere.</p>
			</div>
		</div>
	</div>

	<script>
		function validateForm() {
			let isValid = true;

			let name = document.getElementById("name").value.trim();
			let email = document.getElementById("email").value.trim();
			let password = document.getElementById("password").value.trim();
			let phone = document.getElementById("phone").value.trim();

			document.getElementById("nameError").innerText = "";
			document.getElementById("emailError").innerText = "";
			document.getElementById("passwordError").innerText = "";
			document.getElementById("phoneError").innerText = "";

			if (name === "") {
				document.getElementById("nameError").innerText = "Name is required";
				isValid = false;
			}
			if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
				document.getElementById("emailError").innerText = "Enter valid email";
				isValid = false;
			}
			if (password.length < 5) {
				document.getElementById("passwordError").innerText = "Password must be at least 5 characters";
				isValid = false;
			}
			if (!phone.match(/^[6-9]\d{9}$/)) {
				document.getElementById("phoneError").innerText = "Enter valid 10-digit phone starting with 6-9";
				isValid = false;
			}

			return isValid;
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
