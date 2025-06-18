 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Test Page</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body, html {
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #5433ff, #20bdff, #a5fecb);
      font-family: Arial, sans-serif;
    }

    .q-container {
      padding: 40px 20px;
      max-width: 1000px;
      margin: auto;
    }

    .q-card {
      background-color: silver;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
      padding: 2rem;
      margin-bottom: 30px;
    }

    .q-header h3 {
      color: #dc3545;
      font-weight: 600;
    }

    .q-header h5 {
      color: #0d6efd;
    }

    .form-check-input {
      transform: scale(1.2);
      margin-right: 10px;
    }

    .form-check-label {
      font-size: 1.1rem;
    }

    .btn {
      font-size: 1rem;
      padding: 0.6rem 1.2rem;
    }

    .btn-custom {
      padding: 0.5rem 1.2rem;
    }

    .error-msg {
      font-size: 1rem;
      color: red;
      margin-top: 10px;
    }

    /* Tablets */
    @media (max-width: 768px) {
      .q-card {
        padding: 1.5rem;
      }

      .q-header h3 {
        font-size: 1.4rem;
        text-align: center;
      }

      .q-header h5 {
        font-size: 1.2rem;
        text-align: center;
      }

      .btn {
        width: 30%;
        font-size: 1rem;
      }
    }

    /* Mobiles */
    @media (max-width: 576px) {
      .q-container {
        padding: 20px 10px;
      }

      .q-card {
        padding: 1.2rem;
      }

      .q-header h3 {
        font-size: 1.2rem;
      }

      .q-header h5 {
        font-size: 1rem;
      }

      .form-check-label {
        font-size: 1rem;
      }

      .btn {
        font-size: 1rem;
        width: 40%;
        padding: 0.5rem;
      }

      .btn-custom {
        font-size: 1rem;
        width: 40%;
        margin-top: 1rem;
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
                <h5 class="text-primary"></h5>
              </div>

              <div class="form-check mb-2">
                <input class="form-check-input" type="radio" name="answer_${que.questionId}" id="optionA_${que.questionId}" value="A">
                <label class="form-check-label" for="optionA_${que.questionId}">A. ${que.option1}</label>
              </div>

              <div class="form-check mb-2">
                <input class="form-check-input" type="radio" name="answer_${que.questionId}" id="optionB_${que.questionId}" value="B">
                <label class="form-check-label" for="optionB_${que.questionId}">B. ${que.option2}</label>
              </div>

              <div class="form-check mb-2">
                <input class="form-check-input" type="radio" name="answer_${que.questionId}" id="optionC_${que.questionId}" value="C">
                <label class="form-check-label" for="optionC_${que.questionId}">C. ${que.option3}</label>
              </div>

              <div class="form-check mb-4">
                <input class="form-check-input" type="radio" name="answer_${que.questionId}" id="optionD_${que.questionId}" value="D">
                <label class="form-check-label" for="optionD_${que.questionId}">D. ${que.option4}</label>
              </div>

              <input type="hidden" name="questionIds" value="${que.questionId}" />

              <div class="text-danger error-msg" style="display: none;">Answer this question</div>

              <div class="text-end">
                <button type="button" class="btn btn-secondary" onclick="resetCard(this)">Reset</button>
              </div>
            </div>
          </c:forEach>

          <div class="text-center mt-4">
            <button type="submit" class="btn btn-success btn-lg" onclick="SubmitAll(event)">Submit All</button>
          </div>
        </form>
      </c:when>

      <c:otherwise>
        <div class="text-center mb-5">
          <h2 class="text-danger">Questions not found in this [${category}] category</h2>
          <h3 class="text-warning">${msg}</h3>
          <br>
          <a href="home" class="btn btn-outline-danger btn-custom">🏠 Home</a>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

  <script>
    function resetCard(button) {
      const card = button.closest('.q-card');
      const radios = card.querySelectorAll('input[type="radio"]');
      radios.forEach(radio => radio.checked = false);

      const errorMsg = card.querySelector('.error-msg');
      if (errorMsg) errorMsg.style.display = 'none';

      radios.forEach(radio => radio.style.outline = "none");
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
          radios.forEach(radio => radio.style.outline = "2px solid red");
        } else {
          if (errorMsg) errorMsg.style.display = 'none';
          radios.forEach(radio => radio.style.outline = "none");
        }
      });

      if (!allAnswered) {
        event.preventDefault();
      }
    }

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
            radios.forEach(r => r.style.outline = "none");
          }
        });
      });
    });
  </script>
</body>
</html>
