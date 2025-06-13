<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Multy_Question_Insert</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Normalize CSS to fix font and layout differences across browsers -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"></script>

<style>
html, body {
	font-size: 16px;
	font-family: system-ui, -apple-system, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, sans-serif;
}

body {
	background: linear-gradient(to right, #fbc2eb, #a6c1ee);
}

.question-block {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 20px;
	position: relative;
	margin-bottom: 20px;
	cursor: move;
}

.remove-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

.input-error {
	border: 2px solid red;
}

.error-message {
	font-size: 14px;
	color: red;
	margin-top: 4px;
}

.answer-field {
	max-width: 100px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container mt-4 mb-5">
		<h2 class="text-center mb-4">Add Multiple Questions</h2>
		<h4 class="text-success text-center">${saveMsg}</h4>

		<form modelAttribute="questionForm" method="post">
			<div id="question-list">
				<!-- Initial Question Block -->
				<div class="question-block" id="q-block-0">
					<div class="mb-3">
						<label class="form-label">Question</label> <input type="text"
							placeholder="Write the Your Question ?"
							name="questions[0].question" class="form-control validate-input"
							maxlength="100">
						<div class="error-message d-none"></div>
					</div>

					<div class="row g-3">
						<div class="col-12 col-md-6">
							<label class="form-label">Option 1</label> <input type="text"
								placeholder="Enter the option1" name="questions[0].option1"
								class="form-control validate-input" maxlength="50">
							<div class="error-message d-none"></div>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label">Option 2</label> <input type="text"
								placeholder="Enter the option2" name="questions[0].option2"
								class="form-control validate-input" maxlength="50">
							<div class="error-message d-none"></div>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label">Option 3</label> <input type="text"
								placeholder="Enter the option3" name="questions[0].option3"
								class="form-control validate-input" maxlength="50">
							<div class="error-message d-none"></div>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label">Option 4</label> <input type="text"
								placeholder="Enter the option4" name="questions[0].option4"
								class="form-control validate-input" maxlength="50">
							<div class="error-message d-none"></div>
						</div>
						<div class="col-12 col-md-6 mb-2 text-center">
							<label class="form-label">Question Category</label> <select
								name="questions[0].questionCategory"
								class="form-select validate-input text-center">
								<option value="">-- Select Category --</option>
								<option value="UI">UI Full Stack</option>
								<option value="Java">Java Full Stack</option>
								<option value="Python">Python Full Stack</option>
								<option value=".Net">C# or .Net Full Stack</option>
								<option value="Technology">Other Technology &
									Innovation(SAP, AI,Software, Digital)"</option>
								<option value="General">General Knowledge & Current
									Affairs (English & Govt QA)</option>
								<option value="Lifestyle">Life & Society
									(Culture,Agriculture, Social Media, Food)</option>
								<option value="Career">Career & Professional
									Skills(Jobs, Interviews, Business)</option>
							</select>
							<div class="error-message d-none">This field is required.</div>
						</div>
					</div>


					<div class="mt-2 text-center">
						<label class="form-label">Correct Answer (A/B/C/D)</label> <input
							type="text" placeholder="Write ANS" name="questions[0].answer"
							class="form-control text-center answer-field validate-input"
							maxlength="1">
						<div class="error-message d-none"></div>
					</div>

					<div class="mt-3 text-end">
						<button type="reset" class="btn btn-outline-warning btn-sm">🔄
							Reset</button>
						<!-- onclick="resetQuestion(0)" not working function -->
					</div>
				</div>




			</div>

			<!-- Action Buttons -->
			<div class="d-grid gap-2 d-md-flex justify-content-md-center mt-4">
				<button type="button" class="btn btn-primary"
					onclick="addQuestion()">➕ Add Another Question</button>

			</div>
			<div class="mt-3 text-center">
				<button type="submit" class="btn btn-success">✅ Submit All</button>

			</div>
			<div class="mt-3 text-center">
				<a href="home" class="btn btn-info">🏠 Home</a>
			</div>
			<br>
		</form>
	</div>

	<script>
    let index = 1;

    function addQuestion() {
      const html = `
        <div class="question-block mb-4" id="q-block-${index}">
          <button type="button" class="btn btn-sm btn-danger remove-btn" onclick="removeQuestion(${index})">❌ Remove</button>
          <div class="mb-3">
            <label class="form-label">Question</label>
            <input type="text" name="questions[${index}].question" placeholder="Write the Your Question ?" class="form-control validate-input" maxlength="100">
            <div class="error-message d-none"></div>
          </div>
          <div class="row g-3">
            <div class="col-12 col-md-6">
              <label class="form-label">Option 1</label>
              <input type="text" name="questions[${index}].option1"
            	  placeholder="Enter the option1" class="form-control validate-input" maxlength="50">
              <div class="error-message d-none"></div>
            </div>
            <div class="col-12 col-md-6">
              <label class="form-label">Option 2</label>
              <input type="text"placeholder="Enter the option2" name="questions[${index}].option2" class="form-control validate-input" maxlength="50">
              <div class="error-message d-none"></div>
            </div>
            <div class="col-12 col-md-6 text-center">
              <label class="form-label">Option 3</label>
              <input type="text" placeholder="Enter the option3" name="questions[${index}].option3" class="form-control validate-input" maxlength="50">
              <div class="error-message d-none"></div>
            </div>
            <div class="col-12 col-md-6">
              <label class="form-label">Option 4</label>
              <input type="text" placeholder="Enter the option4" name="questions[${index}].option4" class="form-control validate-input" maxlength="50">
              <div class="error-message d-none"></div>
            </div>
            <div class="col-12 col-md-6 mb-2">
            <label class="form-label">Question Category</label>
            <select name="questions[${index}].questionCategory" class="form-select validate-input text-center">
              <option value="">-- Select Category --</option>
              <option value="UI">UI Full Stack</option>
				<option value="Java">Java Full
					Stack</option>
				<option value="Python">Python Full
					Stack</option>
				<option value=".Net">C# or .Net Full
					Stack</option>
				 <option value="Technology">Other Technology & Innovation(SAP, AI,Software, Digital)"</option>
              <option value="General">General Knowledge & Current Affairs (English & Govt QA)</option>
              <option value="Lifestyle">Life & Society (Culture, Agriculture, Social Media, Food)</option>
              <option value="Career">Career & Professional Skills (Jobs, Interviews, Business)</option>
            </select>
            <div class="error-message d-none">This field is required.</div>
          </div>

          </div>
          <div class="mt-2 text-center">
            <label class="form-label">Correct Answer (A/B/C/D)</label>
            <input type="text" placeholder="Write ANS" name="questions[${index}].answer" class="form-control text-center answer-field validate-input" maxlength="1">
            <div class="error-message d-none"></div>
          </div>
          <div class="mt-3 text-end">
          <button type="button" class="btn btn-outline-warning btn-sm" onclick="resetQuestion(${index})">🔄 Reset</button>
        </div>

        </div>`;
      document.getElementById("question-list").insertAdjacentHTML("beforeend", html);
      index++;
    }
    
    function resetQuestion(index) {
    	
    	  const block = document.getElementById(`q-block-${index}`);
    	  if (block) {
    	    block.querySelectorAll('input').forEach(input => input.value = '');
    	    block.querySelectorAll('.error-message').forEach(div => {
    	      div.classList.add("d-none");
    	      div.innerText = "";
    	    });
    	    block.querySelectorAll('.input-error').forEach(input => input.classList.remove("input-error"));
    	  }
    	}

    function removeQuestion(id) {
      const el = document.getElementById(`q-block-${id}`);
      if (el) el.remove();
    }

    function showError(input, message) {
      input.classList.add("input-error");
      const errorDiv = input.nextElementSibling;
      if (errorDiv && errorDiv.classList.contains("error-message")) {
        errorDiv.classList.remove("d-none");
        errorDiv.innerText = message;
      }
    }

    function clearError(input) {
      input.classList.remove("input-error");
      const errorDiv = input.nextElementSibling;
      if (errorDiv && errorDiv.classList.contains("error-message")) {
        errorDiv.classList.add("d-none");
        errorDiv.innerText = "";
      }
    }

    document.querySelector("form").addEventListener("submit", function (e) {
      let hasError = false;

      this.querySelectorAll(".validate-input").forEach(input => {
        const value = input.value.trim();
        const name = input.getAttribute("name");

        if (value === "") {
          showError(input, "This field is required");
          hasError = true;
        } else if (name.endsWith(".answer") && !/^[A-D]$/i.test(value)) {
          showError(input, "Answer must be A, B, C, or D");
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
          if (name.endsWith(".answer") && !/^[A-D]$/i.test(value)) {
            showError(e.target, "Answer must be A, B, C, or D");
          } else {
            clearError(e.target);
          }
        }
      }

      if (e.target.classList.contains("answer-field")) {
        e.target.value = e.target.value.toUpperCase().replace(/[^A-D]/g, '').substring(0, 1);
      }
    });

    /* new Sortable(document.getElementById('question-list'), {
      animation: 150,
      handle: '.question-block',
      ghostClass: 'sortable-ghost'
    }); */
  </script>
</body>
</html>
