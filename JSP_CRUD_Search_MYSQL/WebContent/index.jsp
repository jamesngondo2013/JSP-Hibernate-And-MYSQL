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
<div>
		<h3>JSP CRUD Search App</h3>
		<p><br/></p>
</div>
<div class="row">
	<div class="col-md-4">
	</div>
	<div class="col-md-4">
		<form action="" method="get">
			<input type="text" class="form-control" name="search" placeholder="Search"/>
		</form>
	</div>
	<div class="col-md-4 text-right">
		<a href="addnew.jsp" class="btn btn-primary">Add New</a>
		<p></p>
	</div>
</div>
<table class="table table-bordered table-striped table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<th class="text-center">Action</th>
		</tr>
	</thead>
	<tbody>
		<%
		String host ="jdbc:mysql://localhost:3306/mydata";
		Connection conn = null;
		Statement statement = null;
		ResultSet res = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(host,"root","admin");
		statement = conn.createStatement();
		String data;
		String searchQuery = request.getParameter("search");
		if(searchQuery!=null){
		    data = "Select * from crud where name like '%"+searchQuery+"%' or email like '%"+searchQuery+"%' or phone like '%"+searchQuery+"%' or address like '%"+searchQuery+"%'";
		}
		else{
		    data = "Select * from crud order by id asc";
		}
		res = statement.executeQuery(data);
		
		while(res.next()){
		    
		%>
		<tr>
			<td><%=res.getString("id") %></td>
			<td><%=res.getString("name") %></td>
			<td><%=res.getString("email") %></td>
			<td><%=res.getString("phone") %></td>
			<td><%=res.getString("address") %></td>
			<td>
				<a href="edit.jsp?u=<%=res.getString("id") %>" class="btn btn-warning">Edit</a>
				<a href="delete.jsp?u=<%=res.getString("id") %>" class="btn btn-danger">Delete</a>
			</td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>
<jsp:include page="footer.jsp" />
</html>