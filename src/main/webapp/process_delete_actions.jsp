<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=officer_actions.jsp"> <!-- Redirect back to main page after 3 seconds -->
    <title>Delete Case</title>
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
            padding: 20px;
           background-color: rgba(255, 255, 255,0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .back-button {
            background-color:rgba(255, 255, 255,0.9);
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
            background-color: #965b76; /* Darker shade on hover */
        }
    </style>
</head>

<body>
<div class="container">
<%
    String caseId = request.getParameter("caseId");

    // JDBC driver name and database URL
    String JDBC_DRIVER = "jdbc:mysql://localhost/dbmsmini";
    String DB_USER = "root";
    String DB_PASSWORD = "root123";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(JDBC_DRIVER, DB_USER, DB_PASSWORD);

        // Prepare statement for deletion
        String sql = "DELETE FROM suspecttable WHERE CASE_ID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, caseId);

        // Execute the statement
        int rowsDeleted = stmt.executeUpdate();

        if (rowsDeleted > 0) {
            out.println("<h2>Case ID: " + caseId + " deleted successfully.</h2>");
        } else {
            out.println("<h2>Failed to delete Case ID: " + caseId + ".</h2>");
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
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
