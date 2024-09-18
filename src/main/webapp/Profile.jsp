<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #add8e6; /* Light blue background */
        }
        .container {
            display: flex;
            max-width: 1200px;
            margin: auto;
            overflow: hidden;
            height: 100vh; /* Full viewport height */
        }
        .left, .right {
            flex: 1;
        }
        .user-info {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #add8e6;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .user-info img {
            width: 20px;
            height: 20px;
            vertical-align: middle;
            margin-right: 5px;
        }
        .user-info span {
            font-size: 14px;
            font-weight: bold;
        }
        .medicines-pic {
            width: 100%;
            animation: slideIn 2s infinite;
        }
        @keyframes slideIn {
            from {
                transform: translateY(-100%);
            }
            to {
                transform: translateY(0);
            }
        }
        .welcome-description {
            color: #004d99; /* Adjust the color as needed */
            padding: 20px;
            font-size: 20px;
            text-align: center;
        }
        .search-button {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 16px;
        }
        .contact-info {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
 
<div class="container">
    <div class="left">
        <img src="medicines-pic.webp" alt="Medicines" class="medicines-pic">
    </div>
    <div class="right">
        <div class="user-info">
            <!-- Add a link around the image to make it clickable -->
            <a href="accountDetails.jsp">
                <img src="my profile.webp" alt="Profile Icon">
            </a>
            <span id="username"><c:out value="${sessionScope.username}"/></span>
        </div>
        <div class="welcome-description">
            <h1>Welcome to the Online Medicine Supply System</h1>
            <p>Order your medicines and get them delivered to your doorstep. Join our community to discuss health-related topics.</p>
            <!-- Add the Explore the Medicines button -->
            <button onclick="exploreMedicines()" class="btn btn-primary">Explore the Medicines</button>
            <!-- Search Medicines button -->
            <button onclick="searchMedicines()" class="btn btn-info search-button">Search Medicines</button>
        </div>
    </div>
</div>


<!-- Display website details and contact information -->
<div class="welcome-description">
    <h1>Welcome to <%= request.getAttribute("websiteName") %></h1>
    <p><%= request.getAttribute("description") %></p>
</div>
<!-- Contact information -->
<div class="contact-info">
    <p>Email: <%= request.getAttribute("email") %></p>
    <p>Phone: <%= request.getAttribute("phone") %></p>
    <p>Address: <%= request.getAttribute("address") %></p>
</div>

<script>
    function exploreMedicines() {
        window.location.href = "medicinesList.jsp"; // Link to the medicines list page
    }
    function searchMedicines() {
        window.location.href = "search.jsp"; // Link to the search page
    }
    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return decodeURIComponent(c.substring(nameEQ.length,c.length));
        }
        return null;
    }

    window.onload = function() {
        var username = getCookie("username");
        if(username) {
            document.getElementById("username").textContent = username;
        }
    };

</script>
</body>
</html>
