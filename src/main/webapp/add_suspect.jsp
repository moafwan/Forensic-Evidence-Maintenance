<%@ page import="java.sql.*, java.io.*, javax.servlet.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Suspect</title>
<style>
    /* Add your CSS styling here */
</style>
</head>
<body>
<%
    InputStream fingerprintStream = null;
    String name = request.getParameter("name");
    String address = request.getParameter("address");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        // Get the fingerprint data from the uploaded file
        Part filePart = request.getPart("fingerprint");
        if (filePart != null) {
            fingerprintStream = filePart.getInputStream();
        }
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini", "root", "root123");
        
        // Insert the values into the Suspects table
        String sql = "INSERT INTO Suspects (FINGERPRINT, NAME, ADDRESS) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        
        // Set fingerprint as input stream
        stmt.setBlob(1, fingerprintStream);
        stmt.setString(2, name);
        stmt.setString(3, address);
        
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0) {
            out.println("<h2>Suspect Added Successfully!</h2>");
        } else {
            out.println("<h2>Failed to add suspect.</h2>");
        }
    } catch (Exception e) {
        out.println("<h2>An error occurred: " + e.getMessage() + "</h2>");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) { /* ignored */ }
        try { if (stmt != null) stmt.close(); } catch (Exception e) { /* ignored */ }
        try { if (conn != null) conn.close(); } catch (Exception e) { /* ignored */ }
        try { if (fingerprintStream != null) fingerprintStream.close(); } catch (Exception e) { /* ignored */ }
    }
%>
</body>
</html>
