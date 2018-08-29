<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp" />
<p><br/></p>
<div class=""row>
	<div class="col-md-6">
		<h3>Add New Member</h3>
		<p><br/></p>
	</div>
</div>
<form action="" method="post">
	<div class="form-group">
		<label>Name</label>
		<input type="text" class="form-control" name="name" placeholder="Your name"/>
	</div>
	<div class="form-group">
		<label>Email</label>
		<input type="text" class="form-control" name="email" placeholder="Your email"/>
	</div>
	<div class="form-group">
		<label>Phone</label>
		<input type="text" class="form-control" name="phone" placeholder="Your phone"/>
	</div>
	<div class="form-group">
		<label>Address</label>
		<textarea class="form-control" name="addr" placeholder="Your address"></textarea>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
	<a href="index.jsp" class="btn btn-default">Back</a>
</form>
<jsp:include page="footer.jsp" />
</html>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");

	String host ="jdbc:mysql://localhost:3306/mydata";
	Connection conn = null;
	PreparedStatement statement = null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	if(name!=null && email!=null && phone!=null && addr!=null){
	    conn = DriverManager.getConnection(host,"root","admin"); 
	    
		String data = "insert into crud(name,email,phone,address) values(?,?,?,?)";
		statement = conn.prepareStatement(data);
		statement.setString(1, name);
		statement.setString(2, email);
		statement.setString(3, phone);
		statement.setString(4, addr);
		
		statement.executeUpdate();
		response.sendRedirect("index.jsp");
	}
%>



