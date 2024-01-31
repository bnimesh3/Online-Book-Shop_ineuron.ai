<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Book:Register</title>
</head>
<%@include file="all_component/allCSS.jsp"%>

<body style="background-color: #e0e0e0;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Registration</h3>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="r" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter Full Name
									</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="name">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone Number
									</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phno">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label class="form-check-label"
									for="exampleCheck1">agree terms & condition</label>
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<p>If you already Registered.<br><a href="login.jsp">Login here</a></p>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>