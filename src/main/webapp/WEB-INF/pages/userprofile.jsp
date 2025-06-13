<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<html>
<head>
<title>Update User Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #89f7fe, #66a6ff);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2rem;
}

.container {
	max-width: 1000px;
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	overflow: hidden;
}

.row {
	display: flex;
	flex-wrap: wrap;
}

.form-section {
	flex: 1 1 60%;
	padding: 3rem;
	background: linear-gradient(to top right, #f8f9fa, #e3f2fd);
}

.info-section {
	flex: 1 1 40%;
	background: linear-gradient(to bottom right, #007bff, #6610f2);
	color: white;
	padding: 3rem;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.info-section h3, .info-section h4, .info-section p {
	margin-bottom: 1rem;
}

.form-label {
	font-weight: 600;
	color: #333;
}

.form-control, .form-select {
	border-radius: 10px;
	border: 1px solid #ced4da;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.05);
}

.btn-primary {
	background-color: #007bff;
	border: none;
	border-radius: 10px;
	padding: 0.75rem;
	font-weight: bold;
	transition: all 0.3s ease;
}

.btn-primary:hover {
	background-color: #0056b3;
	transform: scale(1.03);
}

.error-text {
	color: red;
	font-size: 0.9rem;
}

@media ( max-width : 768px) {
	.form-section, .info-section {
		flex: 1 1 100%;
		padding: 2rem;
	}
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<!-- Form Section -->
			<div class="form-section">
				<h3 class="text-center mb-4">Update Your Profile</h3>
				<frm:form modelAttribute="userUpdateDetails" cssClass="p-2"
					enctype="multipart/form-data" onsubmit="return validateForm()">
					<frm:hidden path="userId" />

					<div class="mb-3">
						<label class="form-label">Name</label>
						<frm:input path="userName" cssClass="form-control" id="userName" />
					</div>

					<div class="mb-3">
						<label class="form-label">Email</label>
						<frm:input path="userEmail" type="email" cssClass="form-control"
							id="userEmail" readonly="true" />
					</div>

					<div class="mb-3">
						<label class="form-label">Phone Number</label>
						<frm:input path="userPhno" cssClass="form-control" id="userPhno" />
					</div>

					<div class="mb-3">
						<label class="form-label">Location (State)</label>
						<frm:select path="userLocation" cssClass="form-select"
							id="userLocation">
							<frm:option value="" label="-- Select State --" />
							<frm:options items="${states}" />
						</frm:select>
					</div>

					<div class="mb-3">
						<label class="form-label">Purpose of Use</label>
						<frm:input path="usagePurpose" cssClass="form-control"
							id="usagePurpose" maxlength="30"
							placeholder="e.g.,Practice Tests,Learn Technolies,Prepare Interviews" />
					</div>

					<div class="mb-3">
						<label class="form-label">User Role</label>
						<frm:select path="UserRole" cssClass="form-select" id="userRole">
							<frm:option value="" label="-- Select User Role --" />
							<frm:option value="Fresher" label="Fresher" />
							<frm:option value="Worker" label="Worker" />
							<frm:option value="Self Learner" label="Self Learner" />
							<frm:option value="Student" label="Student" />
							<frm:option value="Trainer" label="Trainer" />
							<frm:option value="Java Developer" label="Java Developer" />
							<frm:option value="Backend Intern" label="Backend Intern" />
							<frm:option value="SSC Candidate" label="SSC Candidate" />
							<frm:option value="UPSC Aspirant" label="UPSC Aspirant" />
							<frm:option value="Admin Officer" label="Admin Officer" />
						</frm:select>
					</div>

					<div class="mb-3">
						<label class="form-label">Profile Image</label> <input type="file"
							name="image" class="form-control" id="fileName" />
					</div>

					<div id="error-msg" class="error-text mb-3"></div>

					<button type="submit" class="btn btn-primary w-100">Update
						Profile</button>
				</frm:form>
			</div>

			<!-- Info Section -->
			<div class="info-section">
				<h4 class="mb-3">Self Test Tip</h4>
				<h3>SelfTest: Learn, Practice, Grow</h3>
				<p>Your space to build, track, and improve your skills.</p>
				<hr class="bg-white w-75">
				<p>
					<em>"Small consistent efforts create big success."</em>
				</p>
			</div>
		</div>
	</div>

	<script>
		function validateForm() {
			let name = document.getElementById("userName").value.trim();
			let email = document.getElementById("userEmail").value.trim();
			let phone = document.getElementById("userPhno").value.trim();
			let location = document.getElementById("userLocation").value;
			let designation = document.getElementById("usagePurpose").value
					.trim();

			let userRole = document.getElementById("userRole").value;
			let userFile = document.getElementById("fileName").value;

			const errorDiv = document.getElementById("error-msg");

			if (!name || !email || !phone || !location || !designation
					|| !userType || !userRole || !userFile) {
				errorDiv.textContent = "All fields are required.";
				return false;
			}

			if (!/^\d{10}$/.test(phone)) {
				errorDiv.textContent = "Phone number must be 10 digits.";
				return false;
			}

			if (!/^\S+@\S+\.\S+$/.test(email)) {
				errorDiv.textContent = "Please enter a valid email address.";
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
