<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Login</title>
</head>
<body>
  <h2>Login</h2>
  
   <%
        if(request.getParameter("submit") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "Looser@22");
                String query = "SELECT * FROM users WHERE username=? AND password=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    session.setAttribute("username", username);
                    response.sendRedirect("homePage.jsp");
                } else {
                    out.println("<p>Invalid username or password.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        }
    %>

 <form method="post">
        UserName: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" name="submit" value="Login">
    </form>
    <a href="register.jsp">New User? Register Here</a>
</body>
</html>