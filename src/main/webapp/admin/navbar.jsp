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

		<div class="col-md-3">
		
			<c:if test="${not empty userobj}">
				<a  class="btn btn-success"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-success"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a> 
			</c:if>
			
			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a> 
			<a href="../register.jsp"
				class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
			</c:if>
			
			
		</div>

	</div>

</div>

<!--logout modal -->
	<!-- Button trigger modal -->



<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <div class="text-center">
	        	<h4>Do You want logout</h4>
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	<a href="../l" type="button" class="btn btn-primary text-white">Logout</a>
	      </div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
<!--End logout modal -->

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
					aria-current="page" href="home.jsp">Home</a></li>
				</ul>
			
		</div>
	</div>
</nav>