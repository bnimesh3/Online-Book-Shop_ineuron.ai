<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderDaoIMPL"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:Order Books</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>

		<c:if test="${empty userobj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>

	<div class="container p-1">
	<h4 class="text-center text-primary mt-2">Your Order</h4>
		<table class="table table-striped mt-3">
			  <thead class="bg-primary text-white">
			    <tr>
			      <th scope="col">Order Id</th>
			      <th scope="col">Name</th>
			      <th scope="col">Book Name</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Payment Type</th>
			    </tr>
			  </thead>
			  <tbody>
			  
			  <%
			  	User u=(User) session.getAttribute("userobj");
			  	BookOrderDaoIMPL dao=new BookOrderDaoIMPL(DBConnect.getConn());
			  	List<BookOrder> blist=dao.getBook(u.getEmail());
			  	for(BookOrder b:blist){
			  %>
			  
			    <tr>
			      <th scope="row"><%=b.getOrder_id()%></th>
			      <td><%=b.getUserName()%></td>
			      <td><%=b.getBookName() %></td>
			      <td><%=b.getAuthor() %></td>
			      <td><%=b.getPrice() %></td>
			      <td><%=b.getPaymentType() %></td>
			    </tr>
			    <%
			   	} 
			    %>
			   
			  </tbody>
		</table>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>