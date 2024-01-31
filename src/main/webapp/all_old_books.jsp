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
<title>All Old Books</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<h3 class="text-center p-2">Old Books</h3>
<div class="container-fluid">
	<div class="row p-3">
		<%
		BookDaoImpl dao3=new BookDaoImpl(DBConnect.getConn());
		List<BookDetails> list3=dao3.getAllOldtBooks();
		for(BookDetails b:list3)
		{%>
		<div class="col-md-3">
			<div class="card crd-ho mt-2">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName() %>" style="width:120px; height:175px" class="img-thumblin">
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
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>