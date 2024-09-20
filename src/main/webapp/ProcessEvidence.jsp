<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Evidence</title>
    <style>
         body {
            
    margin: 0;
    padding: 0;
    background-image: url('caseofficer.jpg'); 
    font-family: Arial, sans-serif;
    background-repeat: no-repeat; /* Prevent background image from repeating */
    background-size: cover; /* Cover the entire background */
    background-position: center; /* Center the background image */
    height: 100vh; /* Set the body height to 100% of viewport height */
}
        

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255,0.7);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }


        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .success-message, .error-message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 4px;
        }

        .success-message {
          
            color: black;
        }

        .error-message {
          
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Retrieve form data
            String case_id = request.getParameter("case_id");
            String evidence_id = request.getParameter("evidence_id");
            String about_evidence = request.getParameter("about_evidence");
            String contact = request.getParameter("contact");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/dbmsmini";
            String username = "root";
            String password = "root123";
            
            // SQL query to insert data into the database
            String query = "INSERT INTO evidence (cid, eid, about_evidence, contact) VALUES (?, ?, ?, ?)";
            
            try {
                // Load the MySQL driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish a connection to the database
                Connection connection = DriverManager.getConnection(url, username, password);
                
                // Create a PreparedStatement to execute the SQL query
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                // Set the parameters of the PreparedStatement
                preparedStatement.setString(1, case_id);
                preparedStatement.setString(2, evidence_id);
                preparedStatement.setString(3, about_evidence);
                preparedStatement.setString(4, contact);
                
                // Execute the query
                int rowsInserted = preparedStatement.executeUpdate();
                
                // Check if the insertion was successful
                if (rowsInserted > 0) {
                    %>
                    <h2 class="success-message">Evidence submitted successfully!</h2>
                    <%
                } else {
                    %>
                    <h2 class="error-message">Error submitting evidence!</h2>
                    <%
                }
                
                // Close the database connection
                connection.close();
            } catch (Exception e) {
                %>
                <h2 class="error-message">Error: <%= e.getMessage() %></h2>
                <%
            }
        %>
    </div>
</body>
</html>
