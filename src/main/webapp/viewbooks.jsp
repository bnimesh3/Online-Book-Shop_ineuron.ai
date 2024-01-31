<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
	<%
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		BookDetails b=dao.getBookById(bookId);
	%>
<div class="container p-3">
	<div class="row">
		<div class="col-md-6 text-center p-5 border bg-white">
			<img src="book/<%=b.getPhotoName() %>" style="height: 150px; width: 150px"></img><br>
			<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName() %></span></h4>
			<h4>Author: <span class="text-success"><%=b.getAuthor() %></span></h4>
			<h4>Category: <span class="text-success"><%=b.getBookCategory() %></span></h4>
		</div>
		
		<div class="col-md-6 text-center p-5 border bg-white">
		<h2><%=b.getBookName() %></h2>
		
		<%
			if("Old".equals(b.getBookCategory()))
			{
		%>
		<h4 class="text-success">Contact to Seller</h4>
		<h5 class="text-success"><i class="fa-sharp fa-solid fa-envelope"></i> EMail: <%=b.getUserEmail() %></h5>
		<%
			}
		%>
		
		<div class="row p-3">
		<div class="col-md-4 text-danger text-center p-2">
			<i class="fa-solid fa-money-bill-wave fa-2x"></i>
			<p>Cash on Delivery</p>
		</div>
		<div class="col-md-4 text-danger text-center p-2">
			<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
			<p>Return Available</p>
		</div>
		<div class="col-md-4 text-danger text-center p-2">
			<i class="fa-solid fa-truck fa-2x"></i>
			<p>Free Shipping</p>
		</div>
			 	
		</div>
		<div class="text-center p-2">
			<%
				if("Old".equals(b.getBookCategory()))
				{
			%>
			<a href="index.jsp" class="btn btn-primary"><i class="fa-sharp fa-solid fa-cart-shopping"></i> Continue Shopping</a>
			<%
				}
				else
				{
			%>
			<a href="" class="btn btn-primary"><i class="fa-sharp fa-solid fa-cart-shopping"></i> Add Cart</a>
			<%
				}
			%>
			<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
		</div>
		</div>
	</div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>