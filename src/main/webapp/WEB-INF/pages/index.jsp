<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Self Test</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
<link rel="icon" type="image" href="images/my_image.png">

<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: white;
	color: blue;
	text-align: center;
}

body {
	
}
</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="./"> <img alt=""
					src="images/testlogo.png" width="80px" height="80px">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div
					class="collapse navbar-collapse d-flex flex-row flex-wrap gap-4 me-auto"
					id="navbarSupportedContent">
					<ul
						class="navbar-nav me-auto mb-2 mb-lg-0 d-flex flex-row flex-wrap gap-4 me-auto">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="home">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Services</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							href="contact">Contact</a></li>
					</ul>
					<a href="login" class="btn btn-danger">Login</a>
				</div>
			</div>
		</nav>

		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="3000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/banner7.jpg" class="d-block w-100" alt="..."
						height="285.3px">
				</div>
				<div class="carousel-item">
					<img src="images/banner1.jpg" class="d-block w-100" alt="..."
						height="285.3px">
				</div>
				<div class="carousel-item">
					<img src="images/nl.jpg" class="d-block w-100" alt="..."
						height="285.3px">
				</div>
				<div class="carousel-item">
					<img src="images/ss.jpg" class="d-block w-100" alt="..."
						height="285.3px">
				</div>
			</div>

			<!-- Controls -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<div>

			<h2 class="text-center">Available Categories creating Own
				Question & Answers</h2>

			<div class="row g-3">
				<!-- Programming -->
				<div class="col-12 col-md-6">
					<img src="images/langs.png" class="img-fluid w-100 d-block mx-auto"
						style="max-height: 300px;" alt="Programming">
				</div>

				<!-- Current Affairs -->
				<div class="col-12 col-md-6">
					<img src="images/current.png"
						class="img-fluid w-100 d-block mx-auto" style="max-height: 300px;"
						alt="Current Affairs">
				</div>

				<!-- Culture -->
				<div class="col-12 col-md-6">
					<img src="images/culture.jpg"
						class="img-fluid w-90 d-block mx-auto" style="max-height: 300px;"
						alt="Culture">
				</div>

				<!-- Career -->
				<div class="col-12 col-md-6">
					<img src="images/career.png" class="img-fluid w-90 d-block mx-auto"
						style="max-height: 300px;" alt="Career">
				</div>
			</div>

		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<br>
	<br>
	<br>
	<div class="footer">
		<p>@2025 Copyright @ Self&test</p>
	</div>

</body>
</html>