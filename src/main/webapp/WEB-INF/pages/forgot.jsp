<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f8f9fa;
}

.container {
	max-width: 900px;
	background: white;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.row {
	display: flex;
	flex-wrap: wrap;
}

.login-section {
	padding: 2rem;
	background: #ffffff;
}

.text-section {
	background: #007bff;
	color: white;
	padding: 2rem;
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
}

.form-control {
	margin-bottom: 10px;
}

.error {
	color: red;
	font-size: 0.9rem;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<!-- Left Side (Form Section) -->
			<div class="col-md-6 login-section">
				<img alt="" src="images/testlogo.png" class="text-center mb-4"
					height="150px" width="150px" style="margin-left: 125px;">
				<h4 class="text-danger">${msg}</h4>
				<form action="checkEmail" method="post"
					onsubmit="return validateEmailForm();">
					<div class="mb-3">
						<p>
							<b>Recover your Password</b>
						</p>
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Enter your email"> <span id="emailError"
							class="error"></span>
					</div>
					<button type="submit" class="btn btn-primary w-100">Submit</button>
				</form>
				<br>
				<p>
					Don't have an account? <a href="signup"><button
							class="btn btn-outline-primary mt-2">Create New</button></a>
				</p>
			</div>

			<!-- Right Side (Info Section) -->
			<div class="col-md-6 text-section">
				<h3>SelfTest – Learn, Practice, and Grow</h3>
				<p>Your personal space to create questions, take tests, and
					improve continuously. Prepare your way, anytime, anywhere.</p>
			</div>
		</div>
	</div>

	<script>
		function validateEmailForm() {
			const email = document.getElementById("email").value.trim();
			const emailError = document.getElementById("emailError");
			emailError.innerText = "";

			const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

			if (email === "") {
				emailError.innerText = "Email is required";
				return false;
			} else if (!regex.test(email)) {
				emailError.innerText = "Enter a valid email address";
				return false;
			}
			return true;
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
