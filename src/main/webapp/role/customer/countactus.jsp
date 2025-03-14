<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #000000;
            color: #ffffff;
        }
        .container {
            width: 100%;
            text-align: center;
            padding: 40px 0;
        }
        h1 {
            font-size: 36px;
            color: #ffc107;
        }
        p {
            font-size: 18px;
            color: #ffffff;
        }
        .form-container {
            margin: 30px auto;
            width: 50%;
        }
        input[type="email"],
        input[type="text"] {
            width: 40%;
            padding: 12px;
            margin: 10px 5px;
            border-radius: 5px;
            border: none;
            outline: none;
            background-color: #333;
            color: #fff;
        }
        input[type="submit"] {
            background-color: #ffc107;
            color: #000;
            padding: 15px 40px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #e0a800; /* darker shade for hover */
        }
        .info-section {
            display: flex;
            justify-content: space-around;
            background-color: #ffc107;
            padding: 40px 0;
            color: black;
        }
        .info-box {
            text-align: center;
            width: 30%;
        }
        .info-box i {
            font-size: 40px;
            margin-bottom: 10px;
        }
        .info-box h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .info-box p {
            font-size: 16px;
            color :black;
        }

        /* Responsive for smaller screens */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
            .info-section {
                flex-direction: column;
                align-items: center;
            }
            .info-box {
                width: 80%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
 <jsp:include page="header.jsp" />
<div class="container">
    <h1>Contact Us</h1>
    <p>Any questions or remarks? Just write us a message!</p>

    <div class="form-container">
        <form action="submitForm.jsp" method="post">
            <input type="email" name="email" placeholder="Enter a valid email address" required>
            <input type="text" name="name" placeholder="Enter your Name" required><br><br>
            <input type="submit" value="SUBMIT">
        </form>
    </div>
</div>

<div class="info-section">
    <div class="info-box">
        <i>🏃‍♂️</i> <!-- Placeholder icon -->
        <h3>ABOUT CLUB</h3>
        <p>Running Guide<br>Workouts</p>
    </div>

    <div class="info-box">
        <i>☎️</i>
        <h3>PHONE (LANDLINE)</h3>
        <p>+912 3 567 8987<br>+912 5 252 3336</p>
    </div>

    <div class="info-box">
        <i>📍</i>
        <h3>OUR OFFICE LOCATION</h3>
        <p>The Interior Design Studio Company<br>
           The Courtyard, Al Quoz 1, Colorado, USA</p>
    </div>
</div>
    <jsp:include page="footer.jsp" />
</body>
</html>
