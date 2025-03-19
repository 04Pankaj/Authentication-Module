<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<h2>User Registration</h2>

	<%
	if (request.getParameter("submit") != null) {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "Looser@22");
			String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.executeUpdate();
			out.println("<p>Registration successful! <a href='index.jsp'>Login Here</a></p>");

		} catch (Exception e) {
			out.println("<p>Error: " + e.getMessage() + "</p>");
		}
	}
	%>


	<form method="post" action="">
		UserName: <input type="text" name="username" required><br>
		Email: <input type="email" name="email" required><br>
		Password: <input type="password" name="password" required><br>
		<input type="submit" name="submit" value="Register">
	</form>

	<a href="index.jsp">Already have an account? Login</a>
</body>
</html>