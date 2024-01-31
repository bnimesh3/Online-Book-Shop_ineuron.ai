<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add_Books</title>
<%@include file="allCSS.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp" %>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
<div class="conainer">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center">Add Books</h3>
					
					<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg} </p>
					<c:remove var="succMsg" scope="session"/>
					</c:if> 
					
					<c:if test="${not empty failedMsg }">
					<p class="text-center text-danger">${failedMsg} </p>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<form action="../add_books" method="post" enctype="multipart/form-data">
					
					<div class="form-group">
						<label for="exampleInputEmail1">Book Name*</label>
						<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="email-help">
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Author Name*</label>
						<input name="aname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="email-help">
					</div>
					
					<div class="form-group">
						<label for="exampleInputPassword1">Price*</label>
						<input name="price" type="number" class="form-control" id="exampleInputPassword1">
					</div>
					
					<div class="form-group">
						<label for="inputState">Book Categories</label>
						<select id="inputState" name="btype" class="form-control">
							<option selected>---select---</option>
							<option value="new">New</option>
							<option value="new">Old</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="inputState">Book Status</label>
						<select id="inputState" name="status" class="form-control">
							<option selected>---select---</option>
							<option value="active">Active</option>
							<option value="inactive">Inactive</option>
						</select>
					</div>
					
					<div class="form-group">
						<label>Upload Photo</label>
						<input name="bimg" type="file" class="form-control-file">
					</div>
					
					<button type="submit" class="btn btn-primary">Add</button>
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