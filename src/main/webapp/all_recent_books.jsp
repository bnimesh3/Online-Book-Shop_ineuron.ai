<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Books</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body>

<%
	User u=(User)session.getAttribute("userobj");
%>

<%@include file="all_component/navbar.jsp" %>
<h3 class="text-center p-2">Recent Books</h3>
<div class="container-fluid">
	<div class="row p-3">
		<%
		BookDaoImpl dao2=new BookDaoImpl(DBConnect.getConn());
		List<BookDetails> list2=dao2.getAllRecentBooks();
		for(BookDetails b2:list2){
	%>
		<div class="col-md-3">
			<div class="card crd-ho mt-2">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b2.getPhotoName() %>" style="width:120px; height:175px" class="img-thumblin">
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
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>