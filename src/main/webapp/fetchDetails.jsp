<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String query = request.getParameter("query");
    String dbUrl = "jdbc:mysql://localhost:3308/Project";
    String dbUsername = "root";
    String dbPassword = "root";
    ArrayList<String> results = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Medicines WHERE name LIKE ?");
        ps.setString(1, "%" + query + "%");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            results.add("<div style='border: 1px solid #ccc; padding: 10px; margin-top: 5px;'>"
                        + "<h4>" + name + "</h4>"
                        + "<p>Price: " + price + "</p>"
                        + "</div>");
        }
        con.close();
    } catch (Exception e) {
        results.add("Error: " + e.getMessage());
    }

    for (String result : results) {
        out.println(result);
    }
%>