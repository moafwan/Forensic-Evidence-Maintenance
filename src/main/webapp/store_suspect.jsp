<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/dbmsmini";
    String username = "root";
    String password = "root123";
    
    // Get form data
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    
    InputStream fingerprint; // Removed explicit initialization
    Part filePart = request.getPart("fingerprint");
    fingerprint = filePart.getInputStream();
    
   
 

    	String query = "insert into Suspects(FINGERPRINT,NAME,ADDRESS) values('"+fingerprint+"','"+name+"','"+address+");";
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini", "root", "root123");
    	System.out.println("Connection Established successfully");
    	PreparedStatement st = con.prepareStatement(query);
    	st.executeUpdate(query);
        st.close();
        con.close();
    %>