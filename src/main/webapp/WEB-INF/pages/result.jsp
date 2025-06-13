<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Result Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
          /*   background-color: #f8f9fa; */
            background: linear-gradient(to right, #a80077, #66ff00);
        }
        .result-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 20px;
        }
        .result-card {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px #0f9b0f;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        .feedback-form {
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class="result-container">
    <div class="result-card">
        <h2 class="text-success mb-3">🎉 Your Result 🎉</h2>
        <p class="lead text-dark">
            ${resultMsg}
        </p>

        <!-- Share your experience -->
        <div class="feedback-form">
            <h5 class="text-primary mb-3">Share your experience</h5>
            <form method="post" action="saveFeedback">
                <div class="form-floating mb-3">
                    <textarea class="form-control" name="feedback" placeholder="Write your feedback here" id="feedbackTextarea" style="height: 120px" maxlength="200" required></textarea>
                    <label for="feedbackTextarea">Your thoughts...</label>
                </div>
                <button type="submit" class="btn btn-outline-success">Submit Feedback</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
