<%@page import="org.hibernate.cache.ReadWriteCache.Item"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="ie.hibernateutils.org.DBConnUtils"%>
<%@page import="ie.jsphibernatebootstrapitems.Product"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	SessionFactory factory = null;
	Session ss = null;
	Transaction tx = null;
	
	String id = request.getParameter("productId");
	int myproductId = Integer.parseInt(id);
 	
 	factory = DBConnUtils.getSessionFactory();
 	ss = factory.openSession();
 	
 	try{
 	   	  tx = ss.beginTransaction();
		  Object p = ss.get(Product.class, myproductId);
		  Product prod = (Product)p;
		 
		  ss.delete(prod);
		  
		  tx.commit();
		  
		  if(ss!=null){
		 	   out.println("Record Deleted!!");
		 	   response.sendRedirect("index.jsp");
		 	}		
			
 	}
 	catch(HibernateException ex){
 	   

	    if(tx!=null){
	        tx.rollback();
	        ex.printStackTrace();
	        
	    }//end if
 	}
 	finally{
	    ss.close();
	}
 	
 
 %>   


</body>
</html>