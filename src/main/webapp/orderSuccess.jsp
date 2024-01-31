<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:Order Success</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>

	<div class="container text-center mt-5 mb-5">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed</h2>
		<h5>With in 7 Days Your Product will be Delivered in Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-5 mb-5 ">Home</a>
		<a href="order.jsp" class="btn btn-danger mt-5 mb-5">View Order</a>
	</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>