<%@page import="ie.hibernateutils.org.DBConnUtils"%>
<%@page import="ie.jsphibernatebootstrapitems.Product"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%
 	String productName = request.getParameter("productName");
 	String productPrice = request.getParameter("productPrice");
 	double price = Double.parseDouble(productPrice);
 	String productQty = request.getParameter("productQty");
 	int quantity = Integer.parseInt(productQty);
 
 	SessionFactory factory = null;
 	Session ss = null;
 	Product products;
 	
 	factory = DBConnUtils.getSessionFactory();
 	ss = factory.openSession();
 	products = new Product(productName,price,quantity);
 	ss.getTransaction().begin();
 	ss.save(products);
 	ss.beginTransaction().commit();
 	
 	if(ss!=null){
 	   out.println("Record Saved!!");
 	   response.sendRedirect("index.jsp");
 	}
 	
 
 %>   
