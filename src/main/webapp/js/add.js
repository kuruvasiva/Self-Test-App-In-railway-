document.getElementById("enquiryForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission

    let isValid = true;

    // Student Name Validation
    let studentName = document.getElementById("studentName").value.trim();
    if (studentName === "" || studentName.length < 3) {
        document.getElementById("nameError").textContent = "Name must be at least 3 characters.";
        isValid = false;
    } else {
        document.getElementById("nameError").textContent = "";
    }

    // Phone Number Validation
    let stPhno = document.getElementById("stPhno").value.trim();
    let phonePattern = /^[0-9]{10}$/;
    if (!phonePattern.test(stPhno)) {
        document.getElementById("phoneError").textContent = "Enter a valid 10-digit phone number.";
        isValid = false;
    } else {
        document.getElementById("phoneError").textContent = "";
    }

    // Class Mode Validation
    let classmode = document.getElementById("classmode").value;
    if (classmode === "") {
        document.getElementById("classmodeError").textContent = "Please select a class mode.";
        isValid = false;
    } else {
        document.getElementById("classmodeError").textContent = "";
    }

    // Course Name Validation
    let courseName = document.getElementById("courseName").value.trim();
    if (courseName === "") {
        document.getElementById("courseError").textContent = "Course Name is required.";
        isValid = false;
    } else {
        document.getElementById("courseError").textContent = "";
    }

    // Enquiry Status Validation
    let enqueryStatus = document.getElementById("enqueryStatus").value;
    if (enqueryStatus === "") {
        document.getElementById("statusError").textContent = "Please select an enquiry status.";
        isValid = false;
    } else {
        document.getElementById("statusError").textContent = "";
    }

    // User ID Validation
    let userId = document.getElementById("userId").value.trim();
    if (userId === "" || isNaN(userId) || userId <= 0) {
        document.getElementById("userIdError").textContent = "Enter a valid User ID.";
        isValid = false;
    } else {
        document.getElementById("userIdError").textContent = "";
    }

    if (isValid) {
        alert("Form submitted successfully!");
        document.getElementById("enquiryForm").reset(); // Reset form after successful validation
    }
});
