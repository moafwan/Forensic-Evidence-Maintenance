<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Suspect Form</title>
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
            color: #333;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 20px;
            color:black;
            font-weight:bold;
        }

        .success-message {
            color: black;
        }

        .error-message {
            color: #F44336;
        }

        .back-button {
            background-color: rgba(255, 255, 255, 0.3);
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none; /* Remove default link underline */
            margin-top: 20px;
            display: inline-block;
        }

        .back-button:hover {
            background-color: rgba(255, 255, 255, 0.1); /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        
        <% 
            String caseId = request.getParameter("case_id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String aadharId = request.getParameter("aadhar_id");
            String crime = request.getParameter("crime");
            String crimeDate = request.getParameter("crime_date");

            String JDBC_DRIVER = "jdbc:mysql://localhost/dbmsmini";
            String DB_USER = "root";
            String DB_PASSWORD = "root123";

            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(JDBC_DRIVER, DB_USER, DB_PASSWORD);

                String sql = "INSERT INTO suspecttable (CASE_ID, NAME, ADDRESS, AADHAR_ID, CRIME, CRIME_DATE) VALUES (?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, caseId);
                stmt.setString(2, name);
                stmt.setString(3, address);
                stmt.setString(4, aadharId);
                stmt.setString(5, crime);
                stmt.setString(6, crimeDate);
                
                int rowsInserted = stmt.executeUpdate();

                String sqlCases = "INSERT INTO cases (CASE_ID) VALUES (?)";
                stmt = conn.prepareStatement(sqlCases);
                stmt.setString(1, caseId);
                
                int rowsInsertedCases = stmt.executeUpdate();

                if (rowsInserted > 0 && rowsInsertedCases > 0) {
        %>  
                    <p class="success-message">Suspect details inserted successfully.</p>
        <%
                } else {
        %>
                    <p class="error-message">Failed to insert suspect details.</p>
        <%
                }
            } catch (SQLException se) {
                out.println("SQL Error: " + se.getMessage());
                se.printStackTrace();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
                e.printStackTrace();
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
        <a href="javascript:history.back()" class="back-button">Back</a>
    </div>
</body>
</html>
