<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:Index</title>
<%@include file="all_component/allCSS.jsp" %>
<style type="text/css">
.back-img{
background: url("img/book3.jpeg");
height: 30vh;
width: 100%;
background-repeat: no-repeat;
background-size: cover;
}
.crd-ho:hover{
background: #9e9e9e;
}
</style>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>
<%
	User u=(User)session.getAttribute("userobj");
%>

<div class="container-fluid back-img">
	<h2 class="text-center text-success p-2">Online Book Store</h2>
</div>
<% Connection conn=DBConnect.getConn();
	//out.println(conn);
%>
<!-- Resent Book Start -->
<div class="cotainer">
	<h3 class="text-center p-2">Recent Book</h3>
	<div class="row">
		<%
		BookDaoImpl dao2=new BookDaoImpl(DBConnect.getConn());
		List<BookDetails> list2=dao2.getResentBooks();
		for(BookDetails b2:list2){
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b2.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
					<p><%=b2.getBookName() %></p>
					<p><%=b2.getAuthor() %></p>
					<p>
					<%
					if(b2.getBookCategory().equals("Old"))
					{%>
					Category: <%=b2.getBookCategory() %></p>
						<div class="row">
						<a href="viewbooks.jsp?bookId=<%=b2.getBookId() %>" class="btn btn-success btn-sm"><i class="fa-solid fa-circle-info ml-1"></i> View details</a>
						<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign ml-1"></i> <%=b2.getPrice() %></a>
					</div>
					<p>
					<%}else{%>
						Category: <%=b2.getBookCategory() %></p>
					<div class="row">
					
					<%
						if(u==null)
						{
					%>
						<a href="login.jsp" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-plus ml-1"></i> Add Cart</a>
					<% 
						}
						else
						{
					%>
						<a href="cart?bId=<%=b2.getBookId() %>&&userId=<%=u.getId() %>" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-plus ml-1"></i> Add Cart</a>
					<% 		
						}
					%>
					
						<a href="viewbooks.jsp?bookId=<%=b2.getBookId() %>" class="btn btn-success btn-sm "><i class="fa-solid fa-circle-info ml-1"></i> View details</a>
						<a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-indian-rupee-sign ml-1"></i> <%=b2.getPrice() %></a>
					</div>
					<%}
					%>
					
				</div>
			 </div>
			</div>
		<%
		}
		%>
</div>
	<div class="text-center">
		<a href="all_recent_books.jsp" class="btn btn-danger btn-sm mt-1">View All</a>
	</div>
</div>

<!-- Resent Book End -->
<hr>
<!-- New Book Start -->
<div class="cotainer">
	<h3 class="text-center p-2">New Book</h3>
	<div class="row">
	
	<%
		BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		List<BookDetails> list=dao.getNewBooks();
		for(BookDetails b:list){
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
					<p><%=b.getBookName() %></p>
					<p><%=b.getAuthor() %></p>
					<p>Category: <%=b.getBookCategory() %></p>
					<div class="row">
					<%
						if(u==null)
						{
					%>
						<a href="login.jsp" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-plus ml-1"></i> Add Cart</a>
					<% 
						}
						else
						{
					%>
						<a href="cart?bId=<%=b.getBookId() %>&&userId=<%=u.getId() %>" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-plus ml-1"></i> Add Cart</a>
					<% 		
						}
					%>
						
						<a href="viewbooks.jsp?bookId=<%=b.getBookId() %>" class="btn btn-success btn-sm "><i class="fa-solid fa-circle-info ml-1"></i> View details</a>
						
						<a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-indian-rupee-sign ml-1"></i> <%=b.getPrice() %></a>
					</div>
				</div>
			 </div>
			</div>
		<%
		}
		%>
	</div>
	
	<div class="text-center">
		<a href="all_new_books.jsp" class="btn btn-danger btn-sm mt-1">View All</a>
	</div>
</div>

<!-- New Book End -->
<hr>
<!-- Old Book Start -->
<div class="cotainer">
	<h3 class="text-center p-2">Old Book</h3>
	<div class="row">
		<%
		BookDaoImpl dao3=new BookDaoImpl(DBConnect.getConn());
		List<BookDetails> list3=dao3.getOldBooks();
		for(BookDetails b:list3)
		{%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
					<p><%=b.getBookName() %></p>
					<p><%=b.getAuthor() %></p>
					<p>Category: <%=b.getBookCategory() %></p>
					<div class="row">
						<a href="viewbooks.jsp?bookId=<%=b.getBookId() %>" class="btn btn-success btn-sm "><i class="fa-solid fa-circle-info ml-1"></i> View details</a>
						<a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-indian-rupee-sign ml-1"></i> <%=b.getPrice() %></a>
					</div>
				</div>
			 </div>
			</div>
		<% }%>
	</div>
	<div class="text-center">
		<a href="all_old_books.jsp" class="btn btn-danger btn-sm mt-1 mb-2">View All</a>
	</div>
</div>

<!-- Old Book End -->

<%@include file="all_component/footer.jsp" %>
</body>
</html>