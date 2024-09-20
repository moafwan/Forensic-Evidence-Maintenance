<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evidence Form</title>
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
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form {
            display: grid;
            grid-gap: 20px;
        }

        label {
            font-size: 16px;
            color: #333;
        }

        select,
        input[type="text"] {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: rgba(255, 255, 255, 0.3);
            color: black;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Evidence Form</h2>
        <form action="ProcessEvidence.jsp" method="post">
            <label for="case_id">Case ID:</label>
            <select id="case_id" name="case_id">
                <% 
                    try {
                        // Establish database connection
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini", "root", "root123");

                        // Query to retrieve Case IDs from the 'cases' table
                        String query = "SELECT case_id FROM cases";
                        PreparedStatement pstmt = con.prepareStatement(query);
                        ResultSet rs = pstmt.executeQuery();

                        // Populate the dropdown options with retrieved Case IDs
                        while(rs.next()) {
                            String caseId = rs.getString("case_id");
                %>
                            <option value="<%= caseId %>"><%= caseId %></option>
                <%
                        }
                        // Close database connection
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>

            <label for="evidence_id">Evidence ID:</label>
            <input type="text" id="evidence_id" name="evidence_id">

            <label for="about_evidence">About Evidence:</label>
            <input type="text" id="about_evidence" name="about_evidence">

            <label for="contact">Contact for Evidence:</label>
            <input type="text" id="contact" name="contact">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
