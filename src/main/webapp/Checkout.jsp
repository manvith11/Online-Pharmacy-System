<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.Pharmacy.medicine.Medicine"%>
<%@ page import="com.Pharmacy.medicine.MedicineDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 
    <div class="container mt-5">
        <h2>Checkout</h2>
        <h4>Review Your Order</h4>
       <ul id="checkoutCartItems">
    <!-- Cart items will be listed here -->
</ul>
         <script>
    function displayCheckoutCartItems() {
        const cartItems = document.getElementById('checkoutCartItems');
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        cart.forEach(item => {
            const li = document.createElement('li');
            li.textContent = item.name + " - ₹" + item.price.toFixed(2) + " x " + item.quantity;
            cartItems.appendChild(li);
        });
    }
      // Call displayCheckoutCartItems on page load to update cart display
    window.onload = displayCheckoutCartItems;
</script>
        <h4>Enter Your Details</h4>
        <form action="processOrder.jsp" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea class="form-control" id="address" name="address" required></textarea>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="payment">Payment Method:</label>
                <select class="form-control" id="payment" name="payment">
                    <option>Credit Card</option>
                    <option>Debit Card</option>
                    <option>PayPal</option>
                    <option>Cash on Delivery</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Place Order</button>
        </form>
    </div>
   
   
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>