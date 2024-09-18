package com.Pharmacy.medicine;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicineDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3308/Project";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String SELECT_ALL_MEDICINES = "SELECT * FROM Medicines";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle connection failure here
            connection = null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Handle connection driver class not found here
            connection = null;
        }
        return connection;
    }

    public List<Medicine> getAllMedicines() {
        List<Medicine> medicines = new ArrayList<>();
        Connection connection = getConnection();
        if (connection == null) {
            // Handle connection error here
            return medicines; // return empty list or null, depending on the requirement
        }
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MEDICINES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("medicineId");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String category = rs.getString("category");
                boolean availability = rs.getBoolean("availability");
                medicines.add(new Medicine(id, name, price, category, availability));
            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return medicines;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
