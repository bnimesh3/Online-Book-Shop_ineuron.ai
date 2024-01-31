<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Edit_Books</title>
<%@include file="allCSS.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp" %>
<div class="conainer">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center">Edit Books</h3>
					
					<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
						BookDetails b=dao.getBookById(id);
					%>
					
					<form action="../edit_books" method="post">
					<input type="hidden" name="id" value="<%=b.getBookId()%>">
					<div class="form-group">
						<lable for="exampleInputEmail1">Book Name*</lable>
						<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="email-help " value="<%=b.getBookName()%>">
					</div>
					
					<div class="form-group">
						<lable for="exampleInputEmail1">Author Name*</lable>
						<input name="aname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="email-help" value="<%=b.getAuthor()%>">
					</div>
					
					<div class="form-group">
						<lable for="exampleInputPassword1">Price*</lable>
						<input name="price" type="number" class="form-control" id="exampleInputPassword1"value="<%=b.getPrice()%>">
					</div>
					
					<div class="form-group">
						<lable for="inputState">Book Status</lable>
						<select id="inputState" name="status" class="form-control">
							<% if("Active".equals(b.getStatus())) {
							%>
							
							<option value="Active">Active</option>
							<option value="InActive">Inactive</option>
							
							<% 
							} else{
							%>
							<option value="Active">Active</option>
							<%
							}
							%>
						</select>
					</div>
					
					<button type="submit" class="btn btn-primary">Update</button>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>
<div style="margin-top:50px">
	<%@include file="footer.jsp" %></div>
</body>

</html>