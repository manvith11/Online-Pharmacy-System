package com.Pharmacy.medicine;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static {
        try {
            // Ensure the JDBC driver is loaded by the classloader
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String dbUrl = "jdbc:mysql://localhost:3308/Project";
        String dbUsername = "root"; // Replace with actual username
        String dbPassword = "root"; // Replace with actual password

        String query = "SELECT username, email FROM Login WHERE username = ? AND password = ?";

        try (Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("email", rs.getString("email"));
                // Set a cookie to remember the user's login status
                Cookie loginCookie = new Cookie("username", username);
                loginCookie.setMaxAge(3600); // Cookie expires in 1 hour (adjust as needed)
                response.addCookie(loginCookie);

                response.sendRedirect("Profile.jsp"); // Redirect to a JSP to handle dynamic content
            } else {
                // Login failed
                HttpSession session = request.getSession();
                session.setAttribute("loginError", "Invalid username or password");
                response.sendRedirect("signup.jsp"); // Redirect back to the login page
            }
        } catch (SQLException e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("loginError", "Database error occurred. Please try again.");
            response.sendRedirect("signup.jsp"); // Redirect back to the login page with an error message
        }
    }
}