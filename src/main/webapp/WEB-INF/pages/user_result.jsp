<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>QuesInsertPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #d9a7c7, #fffcdc);
}

.admin-title {
	font-size: 1.8rem;
	font-weight: bold;
	margin-bottom: 30px;
	color: #333;
	text-align: center;
}

@media ( min-width : 768px) {
	.admin-box {
		padding: 50px;
	}
	.btn-custom {
		font-size: 1.1rem;
	}
}
</style>
</head>
<body>
	<div class="container">
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="./"> <img
					src="images/testlogo.png" alt="Logo" width="100px" height="100px" />
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse d-flex flex-row flex-wrap gap-4 me-auto" id="navbarNav">
					<!-- Navbar Icons -->
					<div
						class="nav-icons d-flex flex-row flex-wrap gap-4 me-auto mb-2 mb-lg-0">
						<a href="multiInsert" class="btn btn-outline-success"> ➕
							Insert Multiple Questions </a> <a class="btn btn-outline-warning" 
							href="contact">Contact</a>
					</div>
					<a href="home" class="btn btn-info btn-custom"> 🏠 Home </a>
				</div>
		</nav>

		<div class="">
			<h2 class="text-center text-primary mb-2">All Questions by User</h2>

			<h2 class="text-center text-danger mb-2">${deleteMsg}</h2>
			<h2 class="text-center text-success mb-3">${updateMsg}</h2>
			<h2 class="text-center text-success mb-3">${saveMsg}</h2>
			
			<c:choose>
				<c:when test="${not empty resutlByUser}">
					<div class="table-responsive table-secondary">
						<table
							class="table table-bordered table-striped table-hover align-middle text-center">
							<thead class="table-secondary">
								<tr>
									<th>Result Id</th>
									<th>Result Percentage</th>
									<th>Option category</th>
									<th>Your Feedback</th>
									<th>ExamCount</th>
									<th colspan="2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="${resutlByUser}">
									<tr class="table-primary">
										<td>${r.resultId}</td>
										<td>${r.resultPercentage}</td>
										<td>${r.category}</td>
										<td>${r.userThoughts}</td>
										<td>${r.examCount}</td>
										<td><a href="updateResultByUser?rId=${r.resultId}"
											class="btn btn-outline-success btn-sm"> Edit</a></td>
										<td><a href="deleteResultByUser?rId=${r.resultId}"
											class="btn btn-outline-danger btn-sm"
											onclick="confirmDelete(event, this.href)"> Delete </a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<h4 class="text-danger text-center">❌ No results Found</h4>
				</c:otherwise>
			</c:choose>

			<!-- Buttons -->
			<div class="text-center mt-2">
				<a href="saveQuestion" class="btn btn-primary btn-lg me-4">➕
					Insert Question</a>
			</div>
		</div>


	</div>

	<!-- Footer -->
	<br>
	<div class="footer">
		<p>@2025 Copyright @ Self&test</p>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11">
		/*  this is swal delete from pop  */
		</script> 
		
	<script>
  function confirmDelete(event, url) {
    event.preventDefault();
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No'
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = url;
      }
    });
  }
</script>
</body>
</html>
