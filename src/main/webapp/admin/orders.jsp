<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderDaoIMPL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCSS.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
	<h3 class="text-center">Hello Admin</h3>
	
		<c:if test="${empty userobj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
	
	<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  	
  	<%
  		BookOrderDaoIMPL dao=new BookOrderDaoIMPL(DBConnect.getConn());
  		List<BookOrder> blist=dao.getBook();
  		for(BookOrder b:blist)
  		{
  		%>
  			 <tr>
    
		      <th scope="row"><%=b.getOrder_id()%></th>
		      <td><%=b.getUserName() %></td>
		      <td><%=b.getEmail() %></td>
		      <td><%=b.getFullAdd() %></td>
		      <td><%=b.getPhno() %></td>
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
	<div style="margin-top:8px">
	<%@include file="footer.jsp" %>
	</div>
</body>

</html>