<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            margin: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 16px;
            color: #666;
        }
        .logout-btn {
            display: inline-block;
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #d32f2f;
        }
        .edit-btn {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Account Details</h1>
        <% 
            // Ensure that user is logged in
            String username = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("email");
            if (username == null || email == null) {
                // Redirect to login page if the session does not exist
                response.sendRedirect("login.html");
            } else {
                // Get session creation time
                long creationTime = session.getCreationTime();
                java.util.Date date = new java.util.Date(creationTime);
        %>
                <p>Username: <%= username %></p>
                <p>Email: <%= email %></p>
                <p>Session ID: <%= session.getId() %></p>
                <p>Session started at: <%= date.toString() %></p> <!-- Display session start date and time -->
                <!-- Logout Button -->
                <form action="LogoutServlet" method="GET">
                    <button type="submit" class="logout-btn">Logout</button>
                </form>
                <form action="editProfile.jsp" method="GET">
                    <button type="submit" class="edit-btn">Edit Profile</button>
                </form>
        <% 
            } 
        %>
    </div>
</body>
</html>