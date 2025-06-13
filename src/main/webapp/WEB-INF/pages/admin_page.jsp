<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
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
			<a class="navbar-brand" href="./"> <img src="images/testlogo.png"
				alt="Logo" width="100px" height="100px" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div
				class="collapse navbar-collapse d-flex flex-row flex-wrap gap-4 me-auto"
				id="navbarNav">
				<!-- Navbar Icons -->
				<div
					class="nav-icons d-flex flex-row flex-wrap gap-4 me-auto mb-2 mb-lg-0">
					<a href="multiInsertByAdmin" class="btn btn-outline-success"> ➕
						Insert Multiple Questions </a> <a class="btn btn-success"
						href="fetch_total_ques">Questions Data</a> <a class="btn btn-info"
						href="totalResults">User Test Result</a> <a
						class="btn btn-primary" href="total_user_detals">Users Data</a> <a
						class="btn btn-outline-warning" href="contact">Contact</a>
				</div>
				<a href="home" class="btn btn-outline-info btn-custom"> 🏠 Home
				</a>
			</div>
		</nav>

		<div class="">
			<h2 class="text-center text-danger mb-2">${deleteMsg}</h2>
			<h2 class="text-center text-success mb-3">${updateMsg}</h2>
			<h2 class="text-center text-success mb-3">${saveMsg}</h2>
			<c:choose>
				<c:when test="${not empty quesDataList}">
					<div class="table-responsive table-secondary">
						<table
							class="table table-bordered table-striped table-hover align-middle text-center">
							<thead class="table-danger">
								<tr>
									<th>Question Id</th>
									<th>Question</th>
									<th>Option 1</th>
									<th>Option 2</th>
									<th>Option 3</th>
									<th>Option 4</th>
									<th>Category</th>
									<th>Answer</th>
									<th>Insert UserId</th>
									<th>Insert UserName</th>
									<th colspan="2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="q" items="${quesDataList}">
									<tr class="table-primary">
										<td>${q.questionId}</td>
										<td>${q.question}</td>
										<td>${q.option1}</td>
										<td>${q.option2}</td>
										<td>${q.option3}</td>
										<td>${q.option4}</td>
										<td>${q.questionCategory}</td>
										<td>${q.answer}</td>
										<td>${q.user.userId}</td>
										<td>${q.user.userName}</td>
										<td><a href="updateQuestionByAdmin?qId=${q.questionId}"
											class="btn btn-outline-success btn-sm"> Edit</a></td>
										<td><a href="deleteQuestionByAdmin?qId=${q.questionId}"
											class="btn btn-outline-danger btn-sm"
											onclick="confirmDelete(event, this.href)"> Delete </a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:when test="${not empty totalResults}">
					<h2 class="text-center text-primary mb-2">User Total Test
						Results</h2>
					<div class="table-responsive table-secondary">
						<table
							class="table table-bordered table-striped table-hover align-middle text-center">
							<thead class="table-secondary">
								<tr>
									<th>Result Id</th>
									<th>Option category</th>
									<th>Your Feedback</th>
									<th>ExamCount</th>
									
									<th>Questions Attempted</th>
									<th>Correct Answers</th>
									<th>Result Percentage</th>
									<th>User Id</th>
									<th>UserName</th>
									<th colspan="2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="${totalResults}">
									<tr class="table-primary">
										<td>${r.resultId}</td>
										<td>${r.category}</td>
										<td>${r.userThoughts}</td>
										<td>${r.examCount}</td>
										<td>${r.questionsAttempted}</td>
										<td>${r.correctAnswers}</td>
										<td>${r.resultPercentage}</td>
										<td>${r.user.userId}</td>
										<td>${r.user.userName}</td>
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
				<c:when test="${not empty listOfUsers}">
					<h2 class="text-center text-primary mt-2 mb-3">Welcome All
						Users Admin Page</h2>
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-hover w-100 align-middle text-center">
							<thead class="table-danger">
								<tr>
									<th>UserId</th>
									<th>User Name</th>
									<th>User Email</th>
									<th>User Phno</th>
									<th>User Password</th>
									<th>User Location</th>
									<th>Usage Purpose</th>
									<th>User Active</th>
									<th>Opening Date</th>
									<th>Lostly Opened</th>
									<th>User Role</th>
									<th>Profile Image</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${listOfUsers}">
									<tr class="table-primary">
										<td>${u.userId}</td>
										<td>${u.userName}</td>
										<td>${u.userEmail}</td>
										<td>${u.userPhno}</td>
										<td>${u.userPassword}</td>
										<td>${u.userLocation}</td>
										<td>${u.usagePurpose}</td>
										<td>${u.userActive}</td>
										<td>${u.openingDate}</td>
										<td>${u.lostlyOpened}</td>
										
										<td>${u.userRole}</td>
										<td><img
											src="${pageContext.request.contextPath}/user/photo/${u.userId}"
											width="100" height="100" /></td>

										<td><a href="deleteUserByAdmin?userId=${u.userId}"
											class="btn btn-outline-danger btn-sm"
											onclick="confirmDelete(event, this.href)">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<h4 class="text-danger text-center">❌ No Questions Found or
						User Results found or User Data</h4>
					<h3 class="text-success text-center">If you want question data
						or results data or User Data click above buttons</h3>

					<div class="text-center mt-2">
						<a href="saveQuestion" class="btn btn-primary btn-lg me-4">➕
							Insert Question</a>
					</div>
				</c:otherwise>
			</c:choose>

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
