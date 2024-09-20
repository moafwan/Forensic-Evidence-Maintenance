<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    String crimeDate = request.getParameter("crimeDate");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    List<Object[]> cases = new ArrayList<>();
    try {
        // Establish connection
        Class.forName("com.mysql.cj.jdbc.Driver"); // Assuming MySQL
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini", "root", "root123");
        
        // Prepare and execute query
        stmt = conn.prepareStatement("SELECT CASE_ID, CRIME_DATE FROM suspecttable WHERE CRIME_DATE = ?");
        stmt.setDate(1, Date.valueOf(crimeDate));
        rs = stmt.executeQuery();
        
        // Process results
        while (rs.next()) {
            Object[] caseData = new Object[2];
            caseData[0] = rs.getInt("CASE_ID");
            caseData[1] = rs.getDate("CRIME_DATE");
            cases.add(caseData);
        }
    } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
        e.printStackTrace(); // Handle exceptions properly in production
    } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (Exception e) { /* ignored */ }
        try { if (stmt != null) stmt.close(); } catch (Exception e) { /* ignored */ }
        try { if (conn != null) conn.close(); } catch (Exception e) { /* ignored */ }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
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



        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
        }

         table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto; /* Center the table */
            background-color: rgba(255, 255, 255,0.7);  /* Table background color */
            border: 2px solid #e0e0e0; /* Table border color */
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0; /* Add borders between cells */
        }

        th {
            background-color: #f0f0f0; /* Light gray background for header row */
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Alternate row color */
        }

        tr:hover {
            background-color: #f0f0f0; /* Highlight row on hover */
        }

        .back-btn {
            text-align: center;
            margin-top: 20px;
        }

        .back-btn button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: rgba(255, 255, 255,0.7);
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .back-btn button:hover {
            background-color: rgba(255, 255, 255,1.0);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Results</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Case ID</th>
                    <th>Crime Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Object[] caseData : cases) {
                %>
                <tr>
                    <td><%= caseData[0] %></td>
                    <td><%= caseData[1] %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="back-btn">
            <button onclick="goBack()">Back</button>
        </div>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
