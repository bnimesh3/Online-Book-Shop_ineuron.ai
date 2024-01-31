<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:Sell-Book</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2 mb-2">
					<div class="card-body">
						
						<h5 class="text-center text-primary p-1">Sell Old Books</h5>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg} </p>
						<c:remove var="succMsg" scope="session"/>
						</c:if> 
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg} </p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="addOldBook" method="post" enctype="multipart/form-data">
					
							<input type="hidden" value="${userobj.email}" name="user">
					
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
								<label>Upload Photo</label>
								<input name="bimg" type="file" class="form-control-file">
							</div>
							
							<div class="form-group mt-2">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>
					</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>