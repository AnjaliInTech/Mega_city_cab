<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- Footer Section Start -->
<footer style="background-color: #111; color: #fff; padding: 60px 20px 30px;">
    <div style="max-width: 1200px; margin: 0 auto; display: flex; flex-wrap: wrap; justify-content: space-between; align-items: flex-start; gap: 30px;">
        
        <!-- Company Info -->
        <div style="flex: 1 1 280px;">
            <h3 style="color: #ffc107; font-size: 28px; margin-bottom: 15px;">MEGA CITY CAB</h3>
            <p style="color: #ccc; line-height: 1.6;">Your trusted travel partner across Sri Lanka. We offer reliable, safe, and affordable rides, making your journey comfortable and convenient.</p>
        </div>

        <!-- Contact Info -->
        <div style="flex: 1 1 280px;">
            <h4 style="color: #ffc107; margin-bottom: 15px;">Contact Us</h4>
            <ul style="list-style: none; padding: 0; color: #ccc;">
                <li style="margin-bottom: 10px;">
                    <span style="margin-right: 10px;">📞</span> <strong>Hotline:</strong> (074) 3814222
                </li>
                <li style="margin-bottom: 10px;">
                    <span style="margin-right: 10px;">📧</span> <strong>Email:</strong> info@megacitycab.com
                </li>
                <li style="margin-bottom: 10px;">
                    <span style="margin-right: 10px;">🏢</span> <strong>Address:</strong> 123, Main Street, Colombo, Sri Lanka
                </li>
            </ul>
        </div>

        <!-- Social Media & Newsletter -->
        <div style="flex: 1 1 280px;">
            <h4 style="color: #ffc107; margin-bottom: 15px;">Follow Us</h4>
            <div style="display: flex; gap: 15px; margin-bottom: 20px;">
                <a href="#" style="display: inline-flex; align-items: center; justify-content: center; background: #ffc107; color: #111; width: 40px; height: 40px; border-radius: 50%; transition: 0.3s;">
                    <img src="${pageContext.request.contextPath}/images/facebook.png" alt="Facebook" style="width: 20px;">
                </a>
                <a href="#" style="display: inline-flex; align-items: center; justify-content: center; background: #ffc107; color: #111; width: 40px; height: 40px; border-radius: 50%; transition: 0.3s;">
                    <img src="${pageContext.request.contextPath}/images/instagram.png" alt="Instagram" style="width: 20px;">
                </a>
                <a href="#" style="display: inline-flex; align-items: center; justify-content: center; background: #ffc107; color: #111; width: 40px; height: 40px; border-radius: 50%; transition: 0.3s;">
                    <img src="${pageContext.request.contextPath}/images/twitter.png" alt="Twitter" style="width: 20px;">
                </a>
            </div>

            <!-- Newsletter -->
            <h4 style="color: #ffc107; margin-bottom: 10px;">Subscribe</h4>
            <form style="display: flex;">
                <input type="email" placeholder="Your email" style="flex: 1; padding: 10px; border: none; border-radius: 5px 0 0 5px;">
                <button type="submit" style="background-color: #ffc107; color: #111; border: none; padding: 10px 20px; border-radius: 0 5px 5px 0; cursor: pointer;">Join</button>
            </form>
        </div>

    </div>

    <!-- Divider -->
    <div style="border-top: 1px solid #333; margin-top: 40px; padding-top: 20px; text-align: center; color: #555;">
        © 2025 <strong style="color: #ffc107;">Mega City Cab</strong>. All Rights Reserved.
    </div>
</footer>
<!-- Footer Section End -->
   

</body>
</html>