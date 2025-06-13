<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f8f9fa;
	padding: 20px;
}

.container {
	max-width: 900px;
	background: white;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
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

@media (max-width: 768px) {
	.row {
		flex-direction: column;
	}
}
</style>
</head>
<body>

	<div class="container">
	<h3 class="text-center text-warning"><b>${err}</b></h3>
		<div class="row">
			<!-- Left Side (Login Form) -->
			<div class="col-md-6 login-section">
				<img alt="" src="images/testlogo.png"  class="text-center mb-4" height="150px" width="150px"
					style="margin-left: 125px;">
               <p class="text-danger"><b>${msg}</b></p>
               <h3 class="text-center text-success"><b>${succMsg}</b></h3>
				<frm:form modelAttribute="lForm" onsubmit="return validateLoginForm();">
					<div class="mb-3">
						<p>Please login to your account</p>
						<frm:input path="userEmail" class="form-control" id="email"
							placeholder="Enter your email" />
						<small id="emailError" class="text-danger d-none">Please enter a valid email.</small>
					</div>
					<div class="mb-3">
						<frm:input path="userPassword" type="password"
							class="form-control" placeholder="Enter your password"
							id="password" />
						<small id="passwordError" class="text-danger d-none">Password is required.</small>
					</div>
					<button type="submit" class="btn btn-primary w-100">Login</button>
					<div class="text-center mt-2">
						<a href="checkEmail" class="text-decoration-none">Forgot Password?</a>
					</div>
				</frm:form>

				<br>
				<p>
					<b>You don't have an account?</b>
					<a href="signup">
						<button class="btn btn-outline-success ms-3">Create New</button>
					</a>
				</p>
			</div>

			<!-- Right Side (Text Content) -->
			<div class="col-md-6 text-section">
				<h3>SelfTest – Learn, Practice, and Grow</h3>
				<p>Your personal space to create questions, take tests, and
					improve continuously. Prepare your way, anytime, anywhere.</p>
			</div>
		</div>
	</div>

	<!-- JS for Bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JavaScript Validation -->
	<script>
		function validateLoginForm() {
			let email = document.getElementById("email").value.trim();
			let password = document.getElementById("password").value.trim();
			let emailError = document.getElementById("emailError");
			let passwordError = document.getElementById("passwordError");

			let isValid = true;

			// Email Validation
			if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
				emailError.classList.remove("d-none");
				isValid = false;
			} else {
				emailError.classList.add("d-none");
			}

			// Password Validation
			if (!password) {
				passwordError.classList.remove("d-none");
				isValid = false;
			} else {
				passwordError.classList.add("d-none");
			}

			return isValid; // form submits only if valid
		}
	</script>

</body>
</html>
