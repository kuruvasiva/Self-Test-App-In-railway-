<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" type="image" href="images/home.jpeg">
<style>
* {
	padding: 0%;
	margin: 0%;
	box-sizing: border-box;
}

:root {
	--bg-light: #f8f9fa;
	--bg-dark: #121212;
	--text-light: #ffffff;
	--text-dark: #000000;
}

body {
	background-color: var(--bg-light);
	color: var(--text-dark);
	transition: all 0.3s ease-in-out;
}

body.dark-mode {
	background-color: var(--bg-dark);
	color: var(--text-light);
}

.profile-img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #007bff;
}

#headerBar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem 2rem;
	flex-wrap: wrap;
}

.left-profile {
	display: flex;
	align-items: center;
	gap: 15px;
}

.right-controls {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	gap: 10px;
}

.theme-toggle {
	background-color: #212529;
	color: white;
	padding: 5px 10px;
	border-radius: 8px;
	cursor: pointer;
}

.theme-toggle:hover {
	background-color: #343a40;
}

.message {
	text-align: center;
	font-weight: bold;
	color: green;
	width: 100%;
}

.footer {
	background-color: silver;
}

.modal-body button {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div id="headerBar">
		<div class="left-profile">
			<label for="profileImgInput" style="cursor: pointer;"> <img
				id="profilePreview" class="profile-img"
				src="${pageContext.request.contextPath}/user/photo/${sessionId}"
				alt="Profile" />
			</label> <a href="userUpdateProfile?userId=${sessionId}"
				class="fw-bold text-decoration-none">Update Profile</a> <input
				type="file" id="profileImgInput" accept="image/*"
				style="display: none;" />
			<p id="currentTime"></p>
		</div>
		<div class="right-controls">
			<a href="logout" class="btn btn-danger"><b>Logout</b></a>
			<div class="theme-toggle" onclick="toggleTheme()">🌙 Dark Mode</div>
		</div>
		<div class="message text-warning">${err}</div>
		<div class="message">${msg}</div>
		<div class="message text-danger">${errMsg}</div>

	</div>

	<div class="container my-2 bg-white shadow-lg">
		<div class="row">
			<div class="col-md-6 text-center mb-5">
				<img src="images/testlogo.png" alt="Logo" width="100" height="100"
					class="mb-3">
				<p class="text-muted">Click below to view your data.</p>
				<button class="btn btn-primary btn-lg" data-bs-toggle="modal"
					data-bs-target="#testModal">ClickTest</button>
				<br> <br> <a href="userAdmin"
					class="btn btn-info btn-lg mb-2">UserAdminPage</a><br> <br>
				<button class="btn btn-outline-success btn-lg"
					onclick="checkAdminLogin()">AdminPage</button>
			</div>
			<div class="col-md-6 text-white text-center bg-primary rounded p-4">
				<h4 class="mb-5">Self Test Tip</h4>
				<h3>SelfTest: Learn, Practice, Grow</h3>
				<p>Your space to build, track, and improve your skills.</p>
				<hr class="bg-white w-90">
				<p>
					<em>"Small consistent efforts create big success."</em>
				</p>
			</div>
		</div>
	</div>

	<!-- Test Modal -->
	<div class="modal fade" id="testModal" tabindex="-1" aria-labelledby="testModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg"> <!-- modal-lg for better width -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="testModalLabel">Select Test Category</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <div class="row g-3"> <!-- g-3 adds consistent spacing -->
          <!-- Each button is placed in col-12 for mobile and col-md-6 or col-lg-4 for wider screens -->
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-secondary w-100" onclick="selectCategory('UI')">UI Full Stack</button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-danger w-100" onclick="selectCategory('Java')">Java Full Stack</button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-info w-100" onclick="selectCategory('Python')">Python Full Stack</button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-dark w-100" onclick="selectCategory('.Net')">C# or .Net Full Stack</button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-primary w-100" onclick="selectCategory('Technology')">
              Other Technology & Innovation (IT, AI, Software, Digital)
            </button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-success w-100" onclick="selectCategory('General')">
              Government Exams & Current Affairs (Sports, English)
            </button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-warning w-100" onclick="selectCategory('Lifestyle')">
              Life & Society, Entertainment, Culture, Agriculture, Food
            </button>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <button class="btn btn-outline-info w-100" onclick="selectCategory('Career')">
              Career & Interviews, Business, Jobs
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


	<!-- Admin Modal -->
	<div class="modal fade" id="adminModal" tabindex="-1"
		aria-labelledby="adminModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Admin Login</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<frm:form action="adminLogin" method="post"
						modelAttribute="adminForm" onsubmit="return validateAdminForm()">
						<div class="mb-3">
							<label for="adminEmail" class="form-label">Email</label>
							<frm:input type="email" class="form-control" id="adminEmail"
								path="userEmail" placeholder="Enter admin email" />
							<small id="emailError" class="text-danger d-none">Please
								enter a valid email.</small>

						</div>
						<div class="mb-3">
							<label for="adminPassword" class="form-label">Password</label>
							<frm:input type="password" class="form-control"
								id="adminPassword" placeholder="Enter admin password"
								path="userPassword" />
							<small id="passwordError" class="text-danger d-none">Password
								is required.</small>

						</div>
						<button type="submit" class="btn btn-success">Login</button>
					</frm:form>
				</div>
			</div>
		</div>
	</div>

	<div class="footer text-center mt-4 text-body-secondary">
		<p>&copy; 2025 Copyright @ Self&test</p>
	</div>

	<script>
		function selectCategory(categoryName) {
			window.location.href = "test?category=" + categoryName;
		}

		function checkAdminLogin() {
			const isAdminLogged = ${sessionScope.adminLogged == true};
			if (isAdminLogged) {
				window.location.href = "adminPage";
			} else {
				const adminModal = new bootstrap.Modal(document
						.getElementById("adminModal"));
				adminModal.show();
			}
		}

		const toggleBtn = document.querySelector(".theme-toggle");

		function toggleTheme() {
			const isDark = document.body.classList.toggle("dark-mode");
			toggleBtn.innerHTML = isDark ? "☀️ Light Mode" : "🌙 Dark Mode";
			localStorage.setItem("theme", isDark ? "dark" : "light");
		}

		function validateAdminForm() {
			const email = document.getElementById("adminEmail").value.trim();
			const password = document.getElementById("adminPassword").value
					.trim();
			let isValid = true;

			if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
				document.getElementById("emailError").classList
						.remove("d-none");
				isValid = false;
			} else {
				document.getElementById("emailError").classList.add("d-none");
			}

			if (!password) {
				document.getElementById("passwordError").classList
						.remove("d-none");
				isValid = false;
			} else {
				document.getElementById("passwordError").classList
						.add("d-none");
			}

			return isValid;
		}

		document
				.getElementById("profileImgInput")
				.addEventListener(
						"change",
						function(e) {
							const file = e.target.files[0];
							if (file) {
								const reader = new FileReader();
								reader.onload = function(e) {
									document.getElementById("profilePreview").src = e.target.result;
								};
								reader.readAsDataURL(file);
							}
						});
		window.onload = function() {
			// Restore saved theme
			const savedTheme = localStorage.getItem("theme");
			if (savedTheme === "dark") {
				document.body.classList.add("dark-mode");
				toggleBtn.innerHTML = "☀️ Light Mode";
			}

			// Show Admin Modal if errMsg exists
			<c:if test="${not empty errMsg}">
			var adminModal = new bootstrap.Modal(document
					.getElementById('adminModal'));
			adminModal.show();
			</c:if>
		};

		function showTime() {
			const now = new Date();

			const options = {
				timeZone : "Asia/Kolkata", // correct India time zone
				hour : '2-digit',
				minute : '2-digit',
				second : '2-digit',
				hour12 : true,
				weekday : 'short',
				year : 'numeric',
				month : 'short',
				day : 'numeric'
			};
			document.getElementById('currentTime').innerHTML = now
					.toLocaleString('en-IN', options);
		}

		showTime();
		setInterval(showTime, 1000);
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
