<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
    <p>This is your home page.</p>
    <a href="logout.jsp">Logout</a>
</body>
</html>
