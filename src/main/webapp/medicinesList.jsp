<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.Pharmacy.medicine.Medicine"%>
<%@ page import="com.Pharmacy.medicine.MedicineDAO" %>

<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicines List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .medicine-container {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .buy-button, .cart-button {
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <h1>Medicines List</h1>
                <%
                    MedicineDAO medicineDao = new MedicineDAO();
                    List<Medicine> medicines = medicineDao.getAllMedicines();
                    boolean cartEmpty = true; // flag to track if cart is empty
                    for (Medicine medicine : medicines) {
                %>
                <div class="medicine-container">
                    <h3><%= medicine.getName() %>:</h3>
                    <p><%= medicine.getName() %> - ₹<%= String.format("%.2f", medicine.getPrice()) %></p>
                   <button class="btn btn-success buy-button" onclick="addToCart('<%= medicine.getName() %>', <%= medicine.getPrice() %>, '<%= medicine.getMedicineId() %>')">Buy</button>

                </div>
                <%
                        cartEmpty = false; // at least one medicine is available
                    }
                %>
                <%
                    // Enable the Go to Checkout button only if the cart is not empty
                    if (!cartEmpty) {
                %>
                <button class="btn btn-warning cart-button" onclick="window.location.href='Checkout.jsp'">Go to Checkout</button>
                <%
                    }
                %>
            </div>
            <div class="col-md-4">
                <div class="sticky-top" style="top: 20px;">
                    <h4>Shopping Cart</h4>
                    <ul id="cartItems">
                        <!-- Cart items will be listed here -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="lastViewedMessage" class="alert alert-info" style="margin-top: 20px;"></div>
<script>
function addToCart(medicineName, price, medicineId) {
    // Existing addToCart code...
    
    // Set a cookie for the last viewed item
    document.cookie = "lastViewed=" + encodeURIComponent(medicineName) + ";max-age=" + (60 * 60 * 24 * 30) + ";path=/"; // Expires in 30 days
}
    function addToCart(medicineName, price, medicineId) {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        let item = {
            id: medicineId,
            name: medicineName,
            price: price,
            quantity: 1  // Assuming you're adding one item at a time
        };

        // Check if the item already exists in the cart
        let existingItem = cart.find(x => x.id === item.id);
        if (existingItem) {
            existingItem.quantity += 1;  // Increment quantity if item exists
        } else {
            cart.push(item);  // Add new item to cart
        }

        localStorage.setItem('cart', JSON.stringify(cart));  // Store updated cart in local storage
        displayCartItems();  // Update cart display
    }

    function displayCartItems() {
        const cartItems = document.getElementById('cartItems');
        cartItems.innerHTML = '';  // Clear existing cart items
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        cart.forEach(item => {
            const li = document.createElement('li');
            li.textContent = item.name + " - ₹" + item.price.toFixed(2) + " x " + item.quantity;
            cartItems.appendChild(li);
        });
    }

    // Call displayCartItems on page load to update cart display
    window.onload = displayCartItems;
</script>
<script>
    function getCookie(name) {
        let cookieArray = document.cookie.split(';');
        for(let i = 0; i < cookieArray.length; i++) {
            let cookiePair = cookieArray[i].split('=');
            if(name == cookiePair[0].trim()) {
                return decodeURIComponent(cookiePair[1]);
            }
        }
        return null;
    }

    function displayLastViewed() {
        const lastViewed = getCookie("lastViewed");
        if(lastViewed) {
            const messageElement = document.getElementById("lastViewedMessage");
            messageElement.textContent = "Last interested in: " + lastViewed;
        }
    }

    window.onload = function() {
        displayCartItems(); // Existing function to display cart items
        displayLastViewed(); // New function to display last viewed item
    };
</script>
    <!-- JavaScript for handling cart functionality -->
    
</body>
</html>
