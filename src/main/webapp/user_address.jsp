<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:User Address</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>

	<div class="container">
		<div class="row p-1">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2 mb-2">
					<div class="card">
					<div class="card-body">
					<h5 class="text-center text-primary p-1">Add Address</h5>
					<form action="">
						<div class="form-row">
						    
						    <div class="form-group">
						      <label for="inputPassword4">Address</label>
						      <input type="text" class="form-control" id="inputPassword4">
						    </div>
						    
						     <div class="form-group">
						      <label for="inputEmail4">Landmark</label>
						      <input type="text" class="form-control" id="inputEmail4">
						    </div>
						  </div>
						  
						   <div class="form-row">
						   
						   <div class="form-group">
						      <label for="inputPassword4">City</label>
						      <input type="text" class="form-control" id="inputPassword4">
						    </div>
						   
						    <div class="form-group">
						      <label for="inputEmail4">State</label>
						      <input type="text" class="form-control" id="inputEmail4">
						    </div>
						    
						    <div class="form-group">
						      <label for="inputPassword4">Pin Code</label>
						      <input type="number" class="form-control" id="inputPassword4">
						    </div>
						    </div>
						    
						    <div class="text-center mt-2">
						    	<button class="btn btn-warning text-white">Add Address</button>
						    </div>
						    
					</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>