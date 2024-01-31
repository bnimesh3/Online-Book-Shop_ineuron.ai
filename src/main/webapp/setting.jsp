<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:User-Setting</title>
<%@include file="all_component/allCSS.jsp" %>
<style type="text/css">
	a{
		text-decoration:none;
		color:black;
	}
	a:hover {
		text-decoration: none;
	}
</style>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>

<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"/>
</c:if>

	<div class="container">

		<h3 class="text-center">Hello ${userobj.name}</h3>
		
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h5>Sell Old Book</h5>
						</div>
					</div>
					
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_book.jsp">
					
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h5>Old Book</h5>
						</div>
					</div>
					
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h5>Login & Security (Edit Profile)</h5>
						</div>
					</div>
					
				</a>
			</div>
			
			
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h5>My Order</h5>
							<p>Track Your Order</p>
						</div>
					</div>
					
				</a>
			</div>
			
			<div class="col-md-6 mt-3">
				<a href="help_line.jsp">
					
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user-circle fa-3x"></i>
							</div>
							<h5>Help Center</h5>
							<p>24*7 Service</p>
						</div>
					</div>
					
				</a>
			</div>
			
		</div>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>