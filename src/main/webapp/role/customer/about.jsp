<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taxi Company Section</title>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #ffffff;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 40px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.content {
    max-width: 50%;
}

.content .highlight {
    color: #ffcc00;
    font-weight: bold;
    font-size: 1rem;
    display: flex;
    align-items: center;
}

.content .highlight::before {
    content: "•";
    color: #ffc107;
    font-size: 16px;
    margin-right: 10px;
}

.content h2 {
    font-size: 60px;
    font-weight: 800;
    color: #000;
    line-height: 75px;
    margin-bottom: 20px;
}

.content p {
    font-size: 16px;
    color: #555;
    line-height: 26px;
}

.btn {
    display: inline-block;
    background-color: #ffc107;
    color: #000;
    font-size: 1.2rem;
    font-weight: bold;
    padding: 15px 30px;
    border-radius: 50px;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
}

.btn:hover {
    background-color: #e29400;
    transform: scale(1.05);
}

.image {
    max-width: 45%;
}

.image img {
    width: 100%;
    border-radius: 10px;
    display: block;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

/* Why Choose Us Section */
/* Why Choose Us Section */
.why-choose-us {
    background-color: #111;
    color: #fff;
    text-align: center;
    padding: 60px 20px;
}

.why-choose-us h2 {
    font-size: 48px;
    font-weight: bold;
    margin-bottom: 20px;
}

.benefits {
    display: flex;
    justify-content: space-between;
    max-width: 1000px;
    margin: auto;
}

.benefit-item {
    flex: 1;
    padding: 20px;
    text-align: center;
}

.benefit-item img {
    width: 100px;  /* පින්තූර ප්‍රමාණය */
    height: 100px;
    margin-bottom: 15px;
    background-color: #ffc107;
    border-radius: 50%;
    padding: 15px;
    
}

.benefit-item h3 {
    font-size: 22px;
    margin: 10px 0;
    font-weight: bold;
}

.benefit-item p {
    font-size: 16px;
    color: #ccc;
    line-height: 24px;
}

/* Responsive Design */
@media (max-width: 900px) {
    .benefits {
        flex-direction: column;
    }
    .benefit-item {
        margin-bottom: 20px;
    }
}

    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
    <div class="content">
        <p class="highlight">Few words about Mega City Cab</p>
        <h2>Learn About Our Taxi Company</h2>
        <p><strong>Mega City Cab</strong> offers reliable and comfortable transportation services, tailored to make your journey through Sri Lanka unforgettable. Whether you need a quick ride or a guided tour of the most beautiful spots, our experienced drivers are here to ensure a safe and enjoyable experience. Discover the charm of Sri Lanka with us!</p>
        <a href="#" class="btn">Contact Us</a>
    </div>
    <div class="image">
        <img src="${pageContext.request.contextPath}/images/img-about-5.jpg" alt="Taxi Image">
    </div>
</div>

<!-- Why Choose Us Section -->
<div class="why-choose-us">
    <p class="highlight">Conexi benefit list</p>
    <h2>Why choose us</h2>
    <div class="benefits">
        <div class="benefit-item">
            <img src="${pageContext.request.contextPath}/images/913402.png" alt="Safety Guarantee">
            <h3>Safety Guarantee</h3>
            <p>We prioritize your safety with every ride, ensuring peace of mind on your journey.</p>
        </div>
        <div class="benefit-item">
            <img src="${pageContext.request.contextPath}/images/1464628.png" alt="DBS Cleared Drivers">
            <h3>DBS Cleared Drivers</h3>
            <p>Our drivers are fully DBS checked, offering you trustworthy and professional service.</p>
        </div>
        <div class="benefit-item">
            <img src="${pageContext.request.contextPath}/images/1076765.png" alt="Free Quotation">
            <h3>Free Quotation</h3>
            <p>Request a quote with no obligation, and discover our competitive rates.</p>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
