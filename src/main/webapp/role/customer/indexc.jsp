<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Booking - Explore Sri Lanka</title>
    <link rel="stylesheet" href="styles.css">
    <style type="text/css">
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #222;
    color: white;
}



.hero {
    position: relative;
    width: 100%;
    height: 630px;
    background: url("${pageContext.request.contextPath}/images/Untitled-design-scaled.jpg") center/cover no-repeat;
    display: flex;
    align-items: center;
    padding: 0 5%;
}

.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);


    top: 0;
    left: 0;
}

.content {
    position: relative;
    z-index: 2;
    max-width: 500px;
}

.content h4 {
    font-size: 18px;
    color: #fff;
}

.content h1 {
    font-size: 60px;
    font-weight: bold;
    margin: 10px 0;
}



.content p {
    font-size: 16px;
    margin-bottom: 20px;
}

.btn {
    display: inline-block;
    padding: 12px 25px;
    background: transparent;
    border: 2px solid white;
    color: white;
    text-decoration: none;
    font-size: 18px;
}

.car-image img {
    position: absolute;
    right: 10%;
    bottom: 10%;
    width: 400px;
    z-index: 2;
}

.whatsapp {
    position: fixed;
    bottom: 20px;
    right: 20px;
}

.whatsapp img {
    width: 50px;
}
    
    </style>
</head>
<body>
  <jsp:include page="header.jsp" />

    <section class="hero">
        <div class="overlay"></div>
        <div class="content">
            <h4>Most Trusted Cab</h4>
            <h1>EXPLORE SRI LANKA WITH EASE<span class="dot">.</span></h1>
            <p>Book your perfect ride today and embark on a journey of comfort and convenience</p>
            <a href="" class="btn">Book Now</a>
        </div>
        
        
    </section>
</body>
</html>
