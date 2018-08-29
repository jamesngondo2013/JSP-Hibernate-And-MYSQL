<%@page import="ie.jsphibernatebootstrapitems.Product"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="ie.hibernateutils.org.DBConnUtils"%>
<%@page import ="org.hibernate.cfg.Configuration"%>
<%@page import ="org.hibernate.SessionFactory"%>
<%@page import ="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Baxter Distribution And Cleaning</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/full-width-pics.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript -->
    <script src="js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>

  </head>

  <body>
 
  <%
  	//testing
  	//DBConnUtils.getSessionFactory();
    SessionFactory factory = null;
    Session sess = null;
    Transaction tx = null;      
  
  %>
	<div class="container">
		<h1>JSP Hibernate Bootstrap MSQL</h1>
	<div class="panel panel-primary">
		<div class="panel-heading"></div>
		<div class="panel-body">
			<div class="row">
				<div class="col-sm-12">
					<form action="additems.jsp" role="form">
						<div class="form-group">
							<label>Item Name</label>
							<input type="text" class="form-control" name="productName">
						</div>
						
						<div class="form-group">
							<label>Item Price</label>
							<input type="text" class="form-control" name="productPrice">
						</div>
						
						<div class="form-group">
							<label>Item Quantity</label>
							<div>
								<select class="form-control" name="productQty">
								<option>Select Quantity</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
							</div>
							
						</div>
						<button type="submit" class="btn btn-info btn-block"><span class="glyphicon glyphicon-plus"></span> Add New Item</button>
					</form>
				</div>
					<div class="col-md-4">
						<form action="" method="get">
							<input type="text" class="form-control" name="search" placeholder="Search"/>
						</form>
					</div>
				<div class="col-sm-12" style="padding-bottom:28px;">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Item Name</th>
								<th>Item Price</th>
								<th>Item Quantity</th>
								<th>CRUD Actions</th>
							</tr>
						
						</thead>
						<tbody>
						<%
							factory = DBConnUtils.getSessionFactory();
							sess = factory.openSession();
							
							try{
							    tx = sess.beginTransaction();
								List product = sess.createQuery("From Product").list();//Product class
								String searchQuery = request.getParameter("search");
								
								for(Iterator it = product.iterator(); it.hasNext();){
								    Product prod = (Product) it.next();	
								    
								   if(prod.getProductName().equals(searchQuery)){
								       System.err.print("yes"); 
								   }
								       
								        
								 
								    
						%>
							<tr>
								<td><%= prod.getProductName()%></td>
								<td><%= prod.getProductPrice()%></td>
								<td><%= prod.getProductQty()%></td>
								<td>
									<a href="updateproductform.jsp?productId=<%= prod.getProductId()%>" class="btn btn-success" role="button"><span class="glyphicon glyphicon-edit"></span>Update Product</a>
									<a href="deleteitem.jsp?productId=<%=prod.getProductId()%>" class="btn btn-danger" role="button"><span class="glyphicon glyphicon-remove"></span>Delete Product</a>
								</td>
							</tr>
							
						<%
								}//end for
								
								tx.commit();
								
							}//end try
							catch(HibernateException ex){
							    if(tx !=null){
							        tx.rollback();
							    	ex.printStackTrace();
							    }//end if
							    
							}//end catch
							finally{
							    sess.close();
							    
							}//end finally
						%>
						</tbody>
					</table>
			
				</div>
				
			</div>
		
		</div>
	
	
	</div>
	
	
	
	
	</div>
  </body>

</html>
