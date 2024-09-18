<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup/Login - WEATHER INFO</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        header, footer {
            background-color: #004d99;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
        }
        section {
            background-color: #ffffff;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 300px; /* Adjust width as needed */
        }
        form input, form button {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        form button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            opacity: 0.9;
        }
        footer {
            margin-top: 20px;
        }
        .toggle {
            color: #004d99;
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>ONLINE MEDICINE SUPPLY SYSTEM</h1>
    </header>

    <section id="signupSection">
        <h2>Signup</h2>
        <form action="SignupServlet" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <button type="submit">Sign Up</button>
        </form>
        <p class="toggle" onclick="toggleForms()">Already a user? Log in</p>
    </section>

   <section id="loginSection" style="display:none;">
    <h2>Login</h2>
    <form action="LoginServlet" method="POST">
        <label for="loginUsername">Username:</label>
        <input type="text" id="loginUsername" name="username" required>
        <label for="loginPassword">Password:</label>
        <input type="password" id="loginPassword" name="password" required>
        <button type="submit">Log In</button>
    </form>
    <p class="toggle" onclick="toggleForms()">New user? Sign up</p>
    <!-- Display login error message if it exists -->
    
</section>

    <footer>
        <p>&copy; 2024 ONLINE MEDICINE SUPPLY SYSTEM. All rights reserved.</p>
    </footer>
     <!-- Display success message if signup was successful -->
    <% if ("true".equals(request.getParameter("success"))) { %>
    <p style="color: green;">Signup successful!</p>
    <% } %>
 <!-- Display login error message if it exists -->
<c:if test="${not empty sessionScope.loginError}">
    <p id="loginError" style="color: red;">${sessionScope.loginError}</p>
</c:if>

<script>
    // Function to display login error message after form submission
    window.onload = function() {
        var loginError = '<%= session.getAttribute("loginError") %>';
        if (loginError) {
            document.getElementById('loginError').style.display = 'block';
        }
    }

    function toggleForms() {
        var signupSection = document.getElementById('signupSection');
        var loginSection = document.getElementById('loginSection');
        if (signupSection.style.display === 'none') {
            signupSection.style.display = 'block';
            loginSection.style.display = 'none';
        } else {
            signupSection.style.display = 'none';
            loginSection.style.display = 'block';
        }
    }
</script>

</body>
</html>