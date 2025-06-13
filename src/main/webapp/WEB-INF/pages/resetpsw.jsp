<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password</title>
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
	margin-bottom: 15px;
}

@media ( max-width : 768px) {
	.text-section {
		text-align: center;
	}
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<!-- Left Side (Reset Form) -->
			<div class="col-md-6 login-section">
				<img src="images/testlogo.png" alt="Logo" width="100px" height="100px"
					class="mb-4 mx-auto d-block">
				<p class="text-danger" id="errorMsg">${errMsg}</p>
				<h4 class="text-success" id="errorMsg">${msg}</h4>
				<frm:form modelAttribute="passwordReset" action="changePassword"
					onsubmit="return validateForm()">
					<p>Please reset your password</p>

					<frm:input type="email" class="form-control" id="email"
						path="email" readonly="true" />
					<frm:input type="password" class="form-control" id="temPwd"
						path="temPwd" placeholder="Enter your temporary password" />
					<frm:input type="password" class="form-control" id="newPwd"
						path="newPwd" placeholder="Enter your new password" />
					<frm:input type="password" class="form-control" id="conPwd"
						path="conPwd" placeholder="Confirm your new password" />

					<div id="error-msg" class="text-danger mb-2"></div>

					<input type="submit" class="btn btn-primary w-100"
						value="Reset Password">
				</frm:form>

				<br> <br>
				<p>
					<b>Already Changed?</b> <a href="login">
						<button class="btn btn-outline-primary w-50">Login</button>
					</a>
				</p>
			</div>

			<!-- Right Side (Text) -->
			<div class="col-md-6 text-section">
				<h3>Shiva IT is not an Institute, it is Growth in IT</h3>
				<p>Helping students get jobs, service is our top priority.</p>
			</div>
		</div>
	</div>

	<script>
		function validateForm() {
			const temPwd = document.getElementById("temPwd").value.trim();
			const newPwd = document.getElementById("newPwd").value.trim();
			const conPwd = document.getElementById("conPwd").value.trim();
			const errorDiv = document.getElementById("error-msg");

			if (!temPwd || !newPwd || !conPwd) {
				errorDiv.textContent = "All fields are required.";
				return false;
			}

			if (newPwd.length < 5) {
				errorDiv.textContent = "New password must be at least 5 characters.";
				return false;
			}

			if (newPwd !== conPwd) {
				errorDiv.textContent = "New password and confirm password do not match.";
				return false;
			}

			errorDiv.textContent = "";
			return true;
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
