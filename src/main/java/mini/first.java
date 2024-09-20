package mini;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class first {
    public static List<Integer> fetchCaseIds() {
        List<Integer> caseIds = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/dbmsmini";
        String user = "root";
        String password = "root123";

        try {
            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(url, user, password);

            // If the connection is successful
            if (connection != null) {
                System.out.println("Connected to the database!");

                // Fetch case IDs
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT CASE_ID FROM cases");

                // Extract case IDs from the result set and add them to the list
                while (resultSet.next()) {
                    int caseId = resultSet.getInt("CASE_ID");
                    caseIds.add(caseId);
                }
            }
        } catch (SQLException e) {
            // Handle any errors
            System.err.println("Failed to connect to the database!");
            e.printStackTrace();
        }

        return caseIds;
    }

    public static void main(String[] args) {
        List<Integer> caseIds = fetchCaseIds();
        // Do something with the retrieved case IDs
        System.out.println("Retrieved case IDs: " + caseIds);
    }
}
