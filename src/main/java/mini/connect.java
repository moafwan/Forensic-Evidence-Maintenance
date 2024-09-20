package mini;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

public class connect {
	public static void main(String[] args) {
		
	

        String url = "jdbc:mysql://localhost:3306/forensic";
        String user = "root";
        String password = "root123";

        try {
            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(url, user, password);

            // If the connection is successful
            if (connection != null) {
                System.out.println("Connected to the database!");
                
            }
        } catch (SQLException e) {
            // Handle any errors
            System.err.println("Failed to connect to the database!");
            e.printStackTrace();
        }

    
}
}