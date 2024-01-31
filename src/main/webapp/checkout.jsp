<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CartDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online-Book:Cart</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #e0e0e0;">
<%@include file="all_component/navbar.jsp" %>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
	    <c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
	    <c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
					<table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">Book Name</th>
						      <th scope="col">Author</th>
						      <th scope="col">Price</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						  <% 
						  	
						  User u=(User)session.getAttribute("userobj");
						  
						  CartDaoImpl dao=new CartDaoImpl(DBConnect.getConn());
						  List<Cart> cart=dao.getBookbyUser(u.getId());
						  double totalPrice=0.00;
						  
						  for(Cart c:cart)
						  { 
						  	totalPrice=c.getTotalPrice();
						  %>
							<tr>
							      <th scope="row"><%=c.getBookName()%></th>
							      <td><%=c.getAuthor()%></td>
							      <td><%=c.getBprice() %></td>
							      <td>
							      	<a href="remove_book?bid=<%=c.getbId()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" class="btn btn-danger">Remove</a>
							      </td>
						    </tr>
						  <% 
						  }
						  %>
						  <tr>
							      <th scope="row">Total Price</th>
							      <td></td>
							      <td></td>
							      <td>
							      	<%=totalPrice %>
							      </td>
						    </tr>
						  
						 
						  </tbody>
					</table>
				</div>
			</div>
			</div>
			
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
							
							<input type="hidden" value="${userobj.id}" name="id">
							
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputName">Name</label>
						      <input type="text" class="form-control" id="inputName" name="userName" value="${userobj.name}" required="required">
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputEmail">Email</label>
						      <input type="email" class="form-control" id="inputEmail" name="email" value="${userobj.email}" required="required">
						    </div>
						  </div>
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputPhoneNo">Phone Number</label>
						      <input type="number" class="form-control" id="inputPhoneNo" name="phone" value="${userobj.phno}" required="required" >
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputPassword4">Address</label>
						      <input type="text" class="form-control" id="inputPassword4" name="address" required="required">
						    </div>
						  </div>
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">Landmark</label>
						      <input type="text" class="form-control" id="inputEmail4" name="landmark" required="required">
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputPassword4">City</label>
						      <input type="text" class="form-control" id="inputPassword4" name="city" required="required">
						    </div>
						  </div>
						   <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">State</label>
						      <input type="text" class="form-control" id="inputEmail4" name="state" required="required">
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputPassword4">Pin Code</label>
						      <input type="number" class="form-control" id="inputPassword4" name="pin" required="required">
						    </div>
						  </div>
						  <div class="form-group"> 
						  <label>Payment Mode</label>
						  <select class="form-control" name="paymentType">
						  	<option value="noSelect">--select--</option>
						  	<option value="COD">Cash on Delivery</option>
						  </select>
						  </div>
						  
						  <div class="text-center mt-2">
						  	<button class="btn btn-warning">Order Now</button>
						  	<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
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