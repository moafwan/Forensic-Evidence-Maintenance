<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Case Details</title>
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
            background-color: rgba(255, 255, 255,0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        p {
            color: #555;
        }

        .no-details {
            color: #f00;
            font-style: italic;
        }

        .btn {
            background-color: rgba(255, 255, 255,0.9);
            color: black;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <% String caseId = request.getParameter("caseId");

       // JDBC driver name and database URL
       String JDBC_DRIVER = "jdbc:mysql://localhost/dbmsmini";
       String DB_USER = "root";
       String DB_PASSWORD = "root123";

       Connection conn = null;
       Statement stmt = null;
       ResultSet rs = null;

       try {
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(JDBC_DRIVER, DB_USER, DB_PASSWORD);
           stmt = conn.createStatement();

           String sql = "SELECT * FROM suspecttable WHERE CASE_ID = " + caseId;
           rs = stmt.executeQuery(sql);

           if (rs.next()) { %>
               <h2>Case Details</h2>
               <p><strong>Case ID:</strong> <%= rs.getInt("CASE_ID") %></p>
               <p><strong>Name:</strong> <%= rs.getString("NAME") %></p>
               <p><strong>Address:</strong> <%= rs.getString("ADDRESS") %></p>
               <p><strong>Aadhar ID:</strong> <%= rs.getString("AADHAR_ID") %></p>
               <p><strong>Crime:</strong> <%= rs.getString("CRIME") %></p>
               <p><strong>Crime Date:</strong> <%= rs.getDate("CRIME_DATE") %></p>
           <% } else { %>
               <p class="no-details">No details found for the given case ID.</p>
           <% }
       } catch (SQLException se) {
           se.printStackTrace();
       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           try {
               if (rs != null) rs.close();
               if (stmt != null) stmt.close();
               if (conn != null) conn.close();
           } catch (SQLException se) {
               se.printStackTrace();
           }
       } %>

    <a href="javascript:history.back()" class="btn">Back</a>
</div>

</body>
</html>
