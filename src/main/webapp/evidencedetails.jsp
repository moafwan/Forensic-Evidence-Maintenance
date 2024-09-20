<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException"%>
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

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background: rgba(255, 255, 255,0.9);
            color: black;
            border: none;
            padding: 10px;
            border-radius: 3px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Select Evidence ID</h2>
        <form action="RetrieveEvidenceDetails.jsp" method="post">
            <label for="evidence_id"></label>
            <select id="evidence_id" name="evidence_id">
                <% 
                    // Establish database connection
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
                        String sql = "SELECT eid FROM evidence"; // Change 'evidence_table' to your actual table name
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String evidenceId = rs.getString("eid");
                %>
                            <option value="<%= evidenceId %>"><%= evidenceId %></option>
                <%
                        }
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
                    }
                %>
            </select>
            <input type="submit" value="Retrieve Details">
        </form>
    </div>
</body>
</html>
