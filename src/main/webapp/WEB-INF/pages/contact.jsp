<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Contact Me</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<style>
body {
	background: linear-gradient(135deg, #f0f4ff, #d2e3ff);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	padding-bottom: 10px; /* Footer space */
	
}

/* .navbar {
	background-color: #ffffff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
} */

.navbar-brand img {
	width: 105px;
	height: 105px;
}

.nav-icons a i {
	font-size: 40px;
	color: #067a06;
	transition: color 0.3s;
}

.nav-icons a i:hover {
	color: #0a8b0a;
	font-size: 41px;
}

.contact-section {
	padding: 2rem 1rem;
}

.contact-title span {
	color: #4c58ff;
}

.contact-icons a {
	font-size: 24px;
	color: #067a06;
	margin-right: 15px;
	text-decoration: none;
}
@media ( min-width : 768px) {
	
}
.contact-icons a:hover {
	color: #0a8b0a;
}

.form-control:focus {
	border-color: #4c58ff;
	box-shadow: 0 0 0 0.25rem rgba(76, 88, 255, 0.25);
}

.send-btn {
	background-color: #4c58ff;
	color: #fff;
}

.send-btn:hover {
	background-color: #3b49cc;
}

footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #fff;
	color: blue;
	text-align: center;
	padding:0px 5px;
	box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
	<div class="container">
		<a class="navbar-brand" href="./">
			<img src="images/testlogo.png" alt="Logo" />
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse d-flex flex-row flex-wrap gap-4 me-auto" id="navbarNav">
			<!-- Navbar Icons -->
			<div class="nav-icons d-flex flex-row flex-wrap gap-4 me-auto mb-2 mb-lg-0">
				<a class="nav-link p-0" href="mailto:chirukurashiva@gmail.com"><i class='bx bx-envelope'></i></a>
				<a class="nav-link p-0" href="https://www.linkedin.com/messaging/compose/?recipients=kuruvasiva" target="_blank"><i class='bx bxl-linkedin'></i></a>
				<a class="nav-link p-0" href="https://m.me/chirukurasiva" target="_blank"><i class='bx bxl-facebook'></i></a>
				<a class="nav-link p-0" href="https://wa.me/8184914791" target="_blank"><i class='bx bxl-whatsapp'></i></a>
			</div>
			<a href="./" class="btn btn-primary me-2">Index</a>
			<a href="login" class="btn btn-danger">Login</a>
			<a href="home" class="btn btn-info btn-custom"> 🏠 Home </a>
		</div>
	</div>
</nav>

<!-- Contact Section -->
<div class="container contact-section">
	<div class="row g-5">
		<!-- Left Info -->
		<div class="col-md-6">
			<h1 class="contact-title mb-3">Contact <span>Me</span></h1>
			<div class="p-2">
				<p>This website helps you learn and practice questions and answers in an easy way. You can take tests, check your answers, and see your results quickly. It is useful for students, job seekers, and anyone who wants to improve their skills.</p>
				<ul class="mt-3 ps-3">
					<li>📚 <strong>Learn at your own speed.</strong></li>
					<li>📝 <strong>Practice anytime.</strong></li>
					<li>🎯 <strong>Get better step by step.</strong></li>
				</ul>
				<ul class="mt-4 list-unstyled">
					<li><i class='bx bxs-send'></i> chirukurashiva@gmail.com</li>
					<li><i class='bx bxs-phone'></i> +91 8184914791</li>
				</ul>
				<div class="contact-icons mt-3">
					<a href="mailto:chirukurashiva@gmail.com"><i class='bx bx-envelope'></i></a>
					<a href="https://www.linkedin.com/messaging/compose/?recipients=kuruvasiva" target="_blank"><i class='bx bxl-linkedin'></i></a>
					<a href="https://m.me/chirukurasiva" target="_blank"><i class='bx bxl-facebook'></i></a>
					<a href="https://wa.me/8184914791" target="_blank"><i class='bx bxl-whatsapp'></i></a>
				</div>
			</div>
		</div>

		<!-- Right Form -->
		<div class="col-md-6">
			<div class="bg-white p-4 shadow rounded-4">
				<form class="needs-validation" novalidate onsubmit="return validateForm()">
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="Enter your name" required>
						
					</div>
					<div class="mb-3">
						<input type="email" class="form-control" placeholder="Enter your email" required>
						
					</div>
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="Enter subject" required>
					</div>
					<div class="mb-3">
						<textarea class="form-control" rows="5" placeholder="Enter your message" required></textarea>
						<div class="invalid-feedback">all fields is required.</div>
					</div>
					<button type="submit" class="btn send-btn w-100">Submit</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Footer -->
<footer>
	<p>&copy; 2025 Copyright @ Self&test</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Form Validation -->
<script>
function validateForm() {
	const form = document.querySelector('.needs-validation');
	form.classList.add('was-validated');
	return form.checkValidity();
}
</script>

</body>
</html>
