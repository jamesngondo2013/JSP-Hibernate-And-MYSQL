<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String host ="jdbc:mysql://localhost:3306/mydata";
	Connection conn = null;
	Statement statement = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(host,"root","admin");
	
	statement = conn.createStatement();
	String id = request.getParameter("u");
	int paramID = Integer.parseInt(id);
		
	String data = "delete from crud where id='"+paramID+"'";
	statement.executeUpdate(data);
	response.sendRedirect("index.jsp");
		    
	%>