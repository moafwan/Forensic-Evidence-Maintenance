<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('loginimg.jpg'); 
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        h1 {
            text-align: center;
        }
        form {
            text-align: center;
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid black;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form method="post" action="">
            Username: <input type="text" name="username"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" value="Login">
        </form>

     
        <%
            String loginUsername = request.getParameter("username");
            String loginPassword = request.getParameter("password");

            if(loginUsername != null && loginPassword != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini", "root", "root123");
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Users WHERE username = ?");
                    stmt.setString(1, loginUsername);
                    ResultSet rs = stmt.executeQuery();
                    
                    if(rs.next()) {
                        String dbPassword = rs.getString("password");
                        if(loginPassword.equals(dbPassword)) {
                            // Redirect to welcome_admin.html upon successful login
                            response.sendRedirect("welcome_admin.html");
                        } else {
                            out.println("Invalid password!");
                        }
                    } else {
                        out.println("Invalid username!");
                    }
                    
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
            }
        %>
    </div>
</body>
</html>
