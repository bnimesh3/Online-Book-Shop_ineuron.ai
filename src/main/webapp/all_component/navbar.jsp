<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="container-fluid"
	style="height: 10px; background-color: #004d40"></div>

<div class="container-fluid p-3 bg-light">

	<div class="row">

		<div class="col-md-3">
			<h3>
				<i class="fa-solid fa-book"></i>Online Book
			</h3>
		</div>

		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2" type="search"  name="ch" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary" type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
			</form>
		</div>
		
		<c:if test="${not empty userobj}">
		
			<div class="col-md-3">
			
				<a href="checkout.jsp" ><i class="fa-solid fa-cart-plus fa-2x"></i></a>
				<a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> ${userobj.name}</a> 
				<a href="l" class="btn btn-primary"><i class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
			</div>
			
		</c:if>
		
		<c:if test="${empty userobj}">
		
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login </a> 
				<a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		
		</c:if>
		

	</div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="./index.jsp">Home</a></li>
				<li class="nav-item active"><a class="nav-link" href="all_new_books.jsp">New
						Book</a></li>
				<li class="nav-item active"><a class="nav-link" href="all_recent_books.jsp">Recent
						Book</a></li>
				<li class="nav-item active"><a class="nav-link" href="all_old_books.jsp"
					tabindex="-1" aria-disabled="true">Old Book</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
					<i class="fa-solid fa-gear"></i> Setting
				</a>
				<button class="btn btn-light my-2 my-sm-0 ml-5" type="submit">
					<i class="fa-solid fa-phone"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>