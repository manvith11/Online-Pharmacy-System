package com.Pharmacy.medicine;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Database credentials should be securely managed, not hard-coded
        String dbUrl = "jdbc:mysql://localhost:3308/Project";
        String dbUsername = "root"; // Replace with actual username
        String dbPassword = "root"; // Replace with actual password

        String query = "INSERT INTO Login (username, password, email) VALUES (?, ?, ?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            log("Driver not found", e);
            response.sendRedirect("signupError.html"); // Redirect to an error page
            return;
        }

        try (Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.executeUpdate();

            // Redirect to signup.jsp with success parameter
            response.sendRedirect("signup.jsp?success=true");

        } catch (SQLException e) {
            log("Database error", e);
            response.sendRedirect("signupError.html"); // Redirect to an error page
        } catch (Exception e) {
            log("General error", e);
            response.sendRedirect("signupError.html"); // Redirect to an error page
        }
    }
}
