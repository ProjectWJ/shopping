<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;

	String dbURL = "jdbc:mariadb://localhost:3307/SW2";
	String dbID = "root";
	String dbPassword = "123456";
	
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
%>
</body>
</html>