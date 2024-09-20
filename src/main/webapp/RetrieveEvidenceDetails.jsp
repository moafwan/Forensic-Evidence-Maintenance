<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evidence Details</title>
    <style>
        body {
             font-family: Arial, sans-serif;
           background-image: url('caseofficer.jpg');
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Align items vertically */
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-repeat:no-repeat;
             background-size: cover; /* Cover the entire background */
    background-position: center;
   
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255,0.8);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        p {
            margin-bottom: 10px;
        }
        .error-message {
            color: #ff0000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Evidence Details</h2>
        <%  
            // Retrieve evidence ID from the form submission
            String evidence_id = request.getParameter("evidence_id");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/dbmsmini";
            String username = "root";
            String password = "root123";
            
            // SQL query to retrieve evidence details based on evidence ID
            String query = "SELECT * FROM evidence WHERE eid = ?";
            
            try {
                // Load the MySQL driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish a connection to the database
                Connection connection = DriverManager.getConnection(url, username, password);
                
                // Create a PreparedStatement to execute the SQL query
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                // Set the parameter of the PreparedStatement
                preparedStatement.setString(1, evidence_id);
                
                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();
                
                // Display evidence details if found
                if (resultSet.next()) {
                    %><p><strong>Case ID:</strong> <%= resultSet.getString("cid") %></p>
                    <p><strong>Evidence ID:</strong> <%= resultSet.getString("eid") %></p>
                    <p><strong>About Evidence:</strong> <%= resultSet.getString("about_evidence") %></p>
                    <p><strong>Contact For Evidence:</strong> <%= resultSet.getString("contact") %></p><%
                } else {
                    %><p class="error-message">No evidence found with the provided ID.</p><%
                }
                
                // Close the database connection
                connection.close();
            } catch (Exception e) {
                %><p class="error-message">Error: <%= e.getMessage() %></p><%
            }
        %>
    </div>
</body>
</html>
