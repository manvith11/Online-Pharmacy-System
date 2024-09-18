<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%@ page import="com.Pharmacy.medicine.Medicine"%>

<%
    // Retrieve parameters from the request
    String name = request.getParameter("name");
    double price = Double.parseDouble(request.getParameter("price"));
    int id = Integer.parseInt(request.getParameter("id"));

    // Retrieve the cart from the session or create a new one if it doesn't exist
    List<Medicine> cart = (List<Medicine>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<Medicine>();
        session.setAttribute("cart", cart);
    }

    // Create a new Medicine object and add it to the cart
    Medicine newItem = new Medicine(id, name, price, "", true); // Assuming category and availability are not needed here
    cart.add(newItem);

    // Redirect back to the medicines list page after adding to cart
    response.sendRedirect("medicinesList.jsp");
%>
