package com.Pharmacy.medicine;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        if (updateUserDetails(username, email)) {
            // Update session attributes if update is successful
            session.setAttribute("username", username);
            session.setAttribute("email", email);
            response.sendRedirect("accountDetails.jsp");
        } else {
            // Handle update failure
            response.sendRedirect("editProfile.jsp?error=UpdateFailed");
        }
    }

    private boolean updateUserDetails(String username, String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Assuming you have a MySQL database
            String dbURL = "jdbc:mysql://localhost:3308/Project";
            String dbUser = "root";
            String dbPass = "root";
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "UPDATE Login SET email = ? WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, username);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}