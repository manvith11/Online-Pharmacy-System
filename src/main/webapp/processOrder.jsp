<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String paymentMethod = request.getParameter("payment");

            // Basic validation
            if(name == null || address == null || email == null || paymentMethod == null ||
               name.isEmpty() || address.isEmpty() || email.isEmpty() || paymentMethod.isEmpty()) {
                out.println("<h3>Error: All fields are required!</h3>");
                out.println("<a href='Checkout.jsp' class='btn btn-primary'>Go Back to Checkout</a>");
            } else {
                // Process the order here
                // For demonstration, just display the received info
                out.println("<h2>Order Confirmation</h2>");
                out.println("<p><strong>Name:</strong> " + name + "</p>");
                out.println("<p><strong>Address:</strong> " + address + "</p>");
                out.println("<p><strong>Email:</strong> " + email + "</p>");
                out.println("<p><strong>Payment Method:</strong> " + paymentMethod + "</p>");

                // Additional processing based on payment method
                if(paymentMethod.equals("Credit Card")) {
                    out.println("<p>Processing credit card payment...</p>");
                    // Add credit card processing logic here
                } else if(paymentMethod.equals("Debit Card")) {
                    out.println("<p>Processing debit card payment...</p>");
                    // Add debit card processing logic here
                } else if(paymentMethod.equals("PayPal")) {
                    out.println("<p>Processing PayPal payment...</p>");
                    // Add PayPal processing logic here
                } else if(paymentMethod.equals("Cash on Delivery")) {
                    out.println("<p>No payment needed now. Pay on delivery.</p>");
                } else {
                    out.println("<p>Unknown payment method. Please try again.</p>");
                }

                out.println("<a href='Profile.jsp' class='btn btn-success'>Go to Home</a>");
            }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>