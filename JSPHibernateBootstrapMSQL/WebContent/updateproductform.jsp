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
	  SessionFactory factory = null;
	  Session sess = null;
	  Transaction tx = null;
  
	  String prodId = request.getParameter("productId");
	  int myproductId = Integer.parseInt(prodId);
  
  %>
  
  <div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">Product Update Form</div>
		<div class="panel-body"></div>
		
	</div>
			<div class="row">
				<div class="col-sm-12">
					<form action="editproducts.jsp" role="form">
					
					<%
							factory = DBConnUtils.getSessionFactory();
							sess = factory.openSession();
							
							try{
							    tx = sess.beginTransaction();
								Object obj = sess.load(Product.class, myproductId);
								
								Product prod = (Product) obj;
								
						%>
					
						<div class="form-group">
							<input type="hidden" name="id" value="<%= prod.getProductId()%>" class="form-control">
							
							<label>Item Name</label>
							<input type="text" class="form-control" name="productName" value="<%= prod.getProductName()%>">
						</div>
						
						<div class="form-group">
							<label>Item Price</label>
							<input type="text" class="form-control" name="productPrice" value="<%= prod.getProductPrice()%>">
						</div>
						
						<div class="form-group">
							<label>Item Quantity</label>
							<input type="text" class="form-control" name="productQty" value="<%= prod.getProductQty()%>">
						</div>
						<%
							}//end try
							catch(HibernateException ex){
							    
							    if(tx!=null){
							        tx.rollback();
							        ex.printStackTrace();
							        
							    }//end if
							    
							}//end catch
							finally{
							    sess.close();
							}
						
						%>
						
						<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-plus"></span> Update Product</button>
					</form>
				</div>
				
			</div>
	</div>
  </body>

</html>
