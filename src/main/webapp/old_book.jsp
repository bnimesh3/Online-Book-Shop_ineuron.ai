<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:Old-Book</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

			<c:if test="${not empty succMsg}">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" scope="session"/>
			</c:if>

	<div class="container p-5">
	<div class="text-center">
		<h5 class="text-primary">Old Books</h5>
	</div>
		<table class="table table-striped">
		  <thead class="bg-primary text-white">
		    <tr>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Category</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  	User u=(User)session.getAttribute("userobj");
		  	String email=u.getEmail();
		  	BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		  	List<BookDetails> list=dao.getBookByOld(email, "old");
		  	for(BookDetails b:list)
		  	{%>
		  		<tr>
			      <td><%=b.getBookName()%></td>
			      <td><%=b.getAuthor() %></td>
			      <td><%=b.getPrice() %></td>
			      <td><%=b.getBookCategory() %></td>
			      <td><a href="delete_old_book?email=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
			    </tr>
		  	<%}
		  %>
		    
		    
		  </tbody>
	</table>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>