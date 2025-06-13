<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Question</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: linear-gradient(to right, #1fa2ff, #12d8fa, #a6ffcb);
	margin: 0;
	padding: 0;
}

.form-container {
	max-width: 900px;
	margin: 40px auto;
	padding: 30px;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.form-label {
	font-weight: 500;
}

.input-error {
	border: 2px solid red !important;
}

.error-message {
	color: red;
	font-size: 0.875rem;
	margin-top: 4px;
	display: none;
}

@media ( max-width : 576px) {
	.form-container {
		padding: 20px;
	}
	label.form-label, .form-control {
		display: block;
		width: 100% !important;
		margin-bottom: 12px;
	}
	.row, .text-center.d-flex, .row.mb-4 .col-12 {
		flex-direction: column !important;
		width: 100% !important;
		display: flex !important;
	}
	.btn {
		width: 100% !important;
		margin-bottom: 10px;
	}
	.text-center.mb-3 a.btn {
		width: 100% !important;
	}
}
</style>
</head>
<body>

	<div class="container-fluid px-3">
		<div class="form-container">
			<h2 class="text-center mb-4">Enter Update Question Data</h2>
			<h4 class="text-center text-success mb-3">${updateMsg}</h4>

			<frm:form modelAttribute="UpdateQue">
				<frm:input path="user.userId" type="hidden" />
				<frm:input path="user.userName" type="hidden" />
				<div class="row mb-3">
					<div class="col-12 d-flex justify-content-center">
						<div class="text-center text-primary col-12 col-sm-6 col-md-4">
							<label class="form-label">Question Id</label>
							<frm:input path="questionId" readonly="true"
								cssClass="form-control answer-input text-center validate-input" />
						</div>
					</div>
				</div>
				<!-- Question -->
				<div class="mb-3">
					<label class="form-label">Question</label>
					<frm:input path="question" cssClass="form-control validate-input"
						maxlength="100" placeholder="Enter the your Correct queston ?" />
					<div class="error-message">This field is required.</div>
				</div>
				<!-- Options -->
				<div class="row">
					<div class="col-12 col-sm-6 mb-3">
						<label class="form-label">Option A</label>
						<frm:input path="option1" cssClass="form-control validate-input"
							maxlength="50" placeholder="Enter Option A" />
						<div class="error-message">This field is required.</div>
					</div>
					<div class="col-12 col-sm-6 mb-3">
						<label class="form-label">Option B</label>
						<frm:input path="option2" cssClass="form-control validate-input"
							maxlength="50" placeholder="Enter Option B" />
						<div class="error-message">This field is required.</div>
					</div>
					<div class="col-12 col-sm-6 mb-3">
						<label class="form-label">Option C</label>
						<frm:input path="option3" cssClass="form-control validate-input"
							maxlength="50" placeholder="Enter Option C" />
						<div class="error-message">This field is required.</div>
					</div>
					<div class="col-12 col-sm-6 mb-3">
						<label class="form-label">Option D</label>
						<frm:input path="option4" cssClass="form-control validate-input"
							maxlength="50" placeholder="Enter Option D" />
						<div class="error-message">This field is required.</div>
					</div>
					<div class="col-md-6 mb-2 text-center">
						<label class="form-label">Question Category</label>
						<frm:select path="questionCategory"
							cssClass="form-select validate-input text-center">
							<frm:option value="" label="-- Select Category --" />
							<frm:option value="UI" label="UI Full Stack " />
							<frm:option value="Java" label="Java Full Stack " />
							<frm:option value="Python" label="Python Full Stack " />
							<frm:option value=".Net" label=" Java Full Stack C# or .NET" />
							<frm:option value="Technology"
								label=" Other Technology & Innovation(SAP, AI,Software, Digital)" />
							<frm:option value="General"
								label="General Knowledge & Current Affairs (English&Govt QA)" />
							<frm:option value="Lifestyle"
								label="Life & Society(Culture,Agriculture,SocialMedia,food)" />
							<frm:option value="Career"
								label="Career & Professional Skills(Jobs,interviews,business)" />
						</frm:select>
						<div class="error-message">This field is required.</div>
					</div>
				</div>

				<!-- Answer -->
				<div class="row mb-3">
					<div class="col-12 d-flex justify-content-center">
						<div class="text-center col-12 col-sm-6 col-md-2">
							<label class="form-label">Answer (A/B/C/D)</label>
							<frm:input path="answer"
								cssClass="form-control answer-input text-center validate-input"
								maxlength="1" placeholder="Enter A,B,C,or D" />
							<div class="error-message">Answer must be A, B, C, or D.</div>
						</div>
					</div>
				</div>

				<!-- Buttons -->
				<div
					class="text-center mb-4 d-flex flex-wrap gap-2 justify-content-center">
					<button type="submit" class="btn btn-success px-4">Update</button>
					<button type="reset" class="btn btn-outline-danger  px-4">Reset</button>
				</div>
			</frm:form>

			<!-- Show Questions -->
			<div class="text-center mb-3 me-2">
				<a href="fetch_total" class="btn btn-primary"> 📊 Fetch Total
					Data</a> <a href="adminPage" class="btn btn-primary">🏠 Admin Home</a>
			</div>

		</div>
	</div>

	<!-- JS Validation -->
	<script>
    function showError(input, message) {
      input.classList.add("input-error");
      const errorDiv = input.nextElementSibling;
      if (errorDiv && errorDiv.classList.contains("error-message")) {
        errorDiv.textContent = message;
        errorDiv.style.display = "block";
      }
    }

    function clearError(input) {
      input.classList.remove("input-error");
      const errorDiv = input.nextElementSibling;
      if (errorDiv && errorDiv.classList.contains("error-message")) {
        errorDiv.style.display = "none";
        errorDiv.textContent = "";
      }
    }

    document.querySelector("form").addEventListener("submit", function (e) {
      let hasError = false;
      this.querySelectorAll(".validate-input").forEach(input => {
        const value = input.value.trim();
        const name = input.getAttribute("name");
        if (value === "") {
          showError(input, "This field is required.");
          hasError = true;
        } else if (name.endsWith("answer") && !/^[A-D]$/i.test(value)) {
          showError(input, "Answer must be A, B, C, or D.");
          hasError = true;
        } else {
          clearError(input);
        }
      });
      if (hasError) e.preventDefault();
    });

    document.addEventListener("input", function (e) {
      if (e.target.classList.contains("validate-input")) {
        const value = e.target.value.trim();
        const name = e.target.getAttribute("name");
        if (value !== "") {
          if (name.endsWith("answer") && !/^[A-D]$/i.test(value)) {
            showError(e.target, "Answer must be A, B, C, or D.");
          } else {
            clearError(e.target);
          }
        }
      }
      if (e.target.classList.contains("answer-input")) {
        e.target.value = e.target.value.toUpperCase().replace(/[^A-D]/g, '').substring(0, 1);
      }
    });
  </script>
</body>
</html>
