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
		<h3>Update/ Edit </h3>
		<p><br/></p>
	</div>
</div>

<%
	String host ="jdbc:mysql://localhost:3306/mydata";
	Connection conn = null;
	Statement statement = null;
	ResultSet res = null;
	PreparedStatement prepstatement = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(host,"root","admin");
%>
<form action="" method="post">
	<%
		statement = conn.createStatement();
		String id = request.getParameter("u");
		int paramID = Integer.parseInt(id);
		String data = "Select * from crud where id='"+paramID+"'";
		res = statement.executeQuery(data);
		
		while(res.next()){
		    
	%>
	<input value="<%=res.getString("id") %>" type="hidden" name="id" />
	
	<div class="form-group">
		<label>Name</label>
		<input type="text" class="form-control" name="name" value="<%=res.getString("name") %>"/>
	</div>
	<div class="form-group">
		<label>Email</label>
		<input type="text" class="form-control" name="email" value="<%=res.getString("email") %>"/>
	</div>
	<div class="form-group">
		<label>Phone</label>
		<input type="text" class="form-control" name="phone" value="<%=res.getString("phone") %>"/>
	</div>
	<div class="form-group">
		<label>Address</label>
		<textarea class="form-control" name="addr"> <%=res.getString("address") %></textarea>
	</div>
	<%
		}
	%>
	<button type="submit" class="btn btn-warning">Update</button>
	<a href="index.jsp" class="btn btn-default">Back</a>
</form>
<jsp:include page="footer.jsp" />
</html>

<%
	String ID = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");

	if(name!=null && email!=null && phone!=null && addr!=null){
	    
		String query = "update crud set name=?,email=?,phone=?,address=? where id='"+ID+"'";;
		prepstatement = conn.prepareStatement(query);
		prepstatement.setString(1, name);
		prepstatement.setString(2, email);
		prepstatement.setString(3, phone);
		prepstatement.setString(4, addr);
		
		prepstatement.executeUpdate();
		response.sendRedirect("index.jsp");
	}
%>


