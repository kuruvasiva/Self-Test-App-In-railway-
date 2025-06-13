<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Error-Something Went Wrong</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #fffff;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.error-box {
	background: white;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0px 0px 15px gray,8px 8px 25px silver;
	text-align: center;
	width: 100%;
	max-width: 500px;
	padding: 2rem;
}

#status {
	font-size: 25px;
	color: #dc3545;
}

.error-box h4 {
	font-size: 1.5rem;
	margin-top: 1rem;
}

.error-box p {
	font-size: 1rem;
	margin-top: 1rem;
	color: #333;
}

.error-box a.btn {
	margin-top: 1.5rem;
	width: 100%;
}

@media ( max-width : 576px) {
	.error-box h1 {
		font-size: 3rem;
	}
	.error-box h4 {
		font-size: 1.2rem;
	}
	.error-box p {
		font-size: 0.95rem;
	}
}
</style>
</head>
<body>

	<div class="error-box">
		<h1 style='font-size: 80px; color: white; text-shadow: 2px 2px #90d4f5; flex-wrap: wrap; font-weight: bold';>
			<img alt="" src="images/testlogo.png" width="100px" height="100px">⚠️
			${status}
		</h1>

		<h4>Oops! Something went wrong.</h4>
		<div class="table-responsive">
			<h3 class="text-center text-danger">${errMsg}${msg}${err}</h3>

			<table class="table">
				<tr>
					<td>Status</td>
					<td>::<b id="status"> ${status}</b></td>
				</tr>
				<tr>
					<td>Time Stamp:</td>
					<td>:: ${timestamp}</td>
				</tr>
				<tr>
					<td>Error Message</td>
					<td>:: ${message}</td>
				</tr>
				<tr>
					<td>Type</td>
					<td>:: ${type}</td>
				</tr>
				<tr>
					<td>Path</td>
					<td>:: <u>${path}</u></td>
				</tr>
				<tr>
					<td>Trace</td>
					<td>:: ${trace}</td>
				</tr>
			</table>
		</div>
		<p>
			<c:choose>
				<c:when test="${not empty errorMessage}">
					<h1 class="text-cneter text-danger">${errorMessage}</h1>
				</c:when>
				<c:otherwise>
                An unexpected error has occurred. Please try again later.
            </c:otherwise>
			</c:choose>

		</p>

		<a href="home" class="btn btn-primary">Go Back to Home</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>