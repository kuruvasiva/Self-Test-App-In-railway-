<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Result Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS & JS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: linear-gradient(to right, #a80077, #66ff00);
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
}

.result-wrapper {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2rem 1rem;
}

.result-card {
	background-color: #fff;
	padding: 2.5rem 3rem;
	border-radius: 1rem;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 800px;
	text-align: center;
	transition: all 0.3s ease;
}

.result-card h2 {
	font-size: 2.4rem;
	color: #198754;
	font-weight: 700;
}

.result-card p.lead {
	font-size: 1.25rem;
	color: #333;
	margin-top: 1rem;
}

.feedback-form {
	margin-top: 2.5rem;
}

.feedback-form h5 {
	color: #0d6efd;
	font-weight: 600;
	margin-bottom: 1rem;
}

textarea.form-control {
	resize: none;
	font-size: 1rem;
}

.btn-submit {
	margin-top: 1rem;
	padding: 0.6rem 2rem;
	font-size: 1rem;
}

/* Responsive Typography & Padding */
@media ( max-width : 992px) {
	.result-card {
		padding: 2rem;
	}
}

@media ( max-width : 768px) {
	.result-card h2 {
		font-size: 2rem;
	}
	.result-card p.lead {
		font-size: 1.1rem;
	}
}

@media ( max-width : 576px) {
	.result-card {
		padding: 1.5rem;
	}
	.result-card h2 {
		font-size: 1.7rem;
	}
	.result-card p.lead {
		font-size: 1rem;
	}
	.btn-submit {
		width: 100%;
		font-size: 1rem;
	}
}
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="result-wrapper">
			<div class="result-card">
				<h2>🎉 Your Result 🎉</h2>
				<p class="lead">${resultMsg}</p>

				<!-- Feedback Form -->
				<div class="feedback-form">
					<h5>Share your experience</h5>
					<form method="post" action="saveFeedback">
						<div class="form-floating mb-3">
							<textarea class="form-control" name="feedback"
								id="feedbackTextarea" placeholder="Write your feedback here"
								style="height: 120px" maxlength="200" required></textarea>
							<label for="feedbackTextarea">Your thoughts...</label>
						</div>
						<button type="submit" class="btn btn-outline-success btn-submit">Submit
							Feedback</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
