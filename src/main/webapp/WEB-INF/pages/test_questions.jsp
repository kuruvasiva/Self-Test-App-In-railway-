<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Test Page</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body, html {
	margin: 0;
	padding: 0;
	background: linear-gradient(to right, #5433ff, #20bdff, #a5fecb);
}

.q-container {
	padding: 40px 20px;
	max-width: 900px;
	margin: auto;
}

.q-card {
	padding: 2rem;
	border-radius: 10px;
	background-color: silver;
	box-shadow: 2px 2px 4px white, 2px 2px 8px white;
	margin-bottom: 30px;
	box-shadow: 2px 2px 4px white, 2px 2px 8px white;
}

.q-header h3 {
	color: #dc3545;
	font-weight: 600;
}
@media (max-width: 576px) {
	.q-container {
		padding: 20px 10px;
	}

	.q-card {
		padding: 1.25rem;
	}

	.q-header h3 {
		font-size: 2.5rem;
	}

	.q-header h5 {
		font-size: 2.2rem;
	}

	.form-check-label {
		font-size: 1.1rem;
	}

	.btn {
		width: 100%;
		font-size: 5.1rem;
		padding: 0.6rem;
	}
}

</style>
</head>
<body>

	<div class="q-container">
		<c:choose>
			<c:when test="${not empty ques}">

				<form method="post" action="submitAnswer">
					<c:forEach var="que" items="${ques}">

						<div class="q-card">
							<div class="q-header text-center mb-4">
								<h3>${que.question}</h3>
								<h5 class="text-primary">
									<%-- Question ID: ${que.questionId} --%>
								</h5>
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									name="answer_${que.questionId}" id="optionA_${que.questionId}"
									value="A"> <label class="form-check-label"
									for="optionA_${que.questionId}">A. ${que.option1}</label>
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									name="answer_${que.questionId}" id="optionB_${que.questionId}"
									value="B"> <label class="form-check-label"
									for="optionB_${que.questionId}">B. ${que.option2}</label>
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									name="answer_${que.questionId}" id="optionC_${que.questionId}"
									value="C"> <label class="form-check-label"
									for="optionC_${que.questionId}">C. ${que.option3}</label>
							</div>

							<div class="form-check mb-4">
								<input class="form-check-input" type="radio"
									name="answer_${que.questionId}" id="optionD_${que.questionId}"
									value="D"> <label class="form-check-label"
									for="optionD_${que.questionId}">D. ${que.option4}</label>
							</div>

							<input type="hidden" name="questionIds" value="${que.questionId}" />

							<div class="text-danger error-msg" style="display: none;">Answer
								this question</div>

							<!-- Reset button only for this card -->
							<div class="text-end">
								<button type="button" class="btn btn-secondary"
									onclick="resetCard(this)">Reset</button>
							</div>
						</div>


					</c:forEach>

					<!-- Global Submit Button -->
					<div class="text-center">
						<button type="submit" class="btn btn-success btn-lg"
							onclick="SubmitAll(event)">Submit All</button>
					</div>
				</form>

			</c:when>

			<c:otherwise>
				<div class="text-center mb-5">
					<h2 class="text-danger text-center">Questions not founds this [${category}] category</h2>
					<h3 class="text-waring text-center">${msg}</h3>
					
					
					<br>
					<a href="home" class="btn btn-outline-danger btn-custom"> 🏠
						Home </a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<script>
    // Reset only radio buttons inside the current card
    function resetCard(button) {
        const card = button.closest('.q-card');
        const radios = card.querySelectorAll('input[type="radio"]');
        radios.forEach(radio => radio.checked = false);

        // Clear error message and styles
        const errorMsg = card.querySelector('.error-msg');
        if (errorMsg) errorMsg.style.display = 'none';

        radios.forEach(radio => {
            radio.style.outline = "none";
        });
    }

    function SubmitAll(event) {
        const questionCards = document.querySelectorAll(".q-card");
        let allAnswered = true;

        questionCards.forEach(card => {
            const radios = card.querySelectorAll(".form-check-input");
            const errorMsg = card.querySelector('.error-msg');
            const answered = Array.from(radios).some(r => r.checked);

            if (!answered) {
                allAnswered = false;
                if (errorMsg) errorMsg.style.display = 'block';

                radios.forEach(radio => {
                    radio.style.outline = "2px solid red";
                });
            } else {
                if (errorMsg) errorMsg.style.display = 'none';
                radios.forEach(radio => {
                    radio.style.outline = "none";
                });
            }
        });

        if (!allAnswered) {
            event.preventDefault(); // Prevent form submission
        }
    }

    // Add dynamic error removal on radio change
    document.addEventListener('DOMContentLoaded', function () {
        const radioButtons = document.querySelectorAll('.form-check-input');

        radioButtons.forEach(radio => {
            radio.addEventListener('change', function () {
                const card = radio.closest('.q-card');
                const radios = card.querySelectorAll('.form-check-input');
                const errorMsg = card.querySelector('.error-msg');

                const answered = Array.from(radios).some(r => r.checked);

                if (answered) {
                    if (errorMsg) errorMsg.style.display = 'none';
                    radios.forEach(r => {
                        r.style.outline = "none";
                    });
                }
            });
        });
    });
</script>
</body>
</html>
