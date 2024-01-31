<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
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
<title>All New Books</title>
<%@include file="all_component/allCSS.jsp" %>
<style>
	#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

<%
	User u=(User)session.getAttribute("userobj");
%>

<c:if test="${not empty addCart}">
	<div id="toast"> ${addCart} </div>

	<script type="text/javascript">
			showToast();
			function showToast(content)
			{
			    $('#toast').addClass("display");
			    $('#toast').html(content);
			    setTimeout(()=>{
			        $("#toast").removeClass("display");
			    },2000)
			}	
	</script>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<h3 class="text-center p-2">New Books</h3>
<div class="container-fluid">
	<div class="row p-3">
		<%
		BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		List<BookDetails> list=dao.getAllNewBooks();
		for(BookDetails ba:list){
	%>
		<div class="col-md-3">
			<div class="card crd-ho mt-2">
				<div class="card-body text-center">
					<img alt="" src="book/<%=ba.getPhotoName() %>" style="width:120px; height:175px" class="img-thumblin">
					<p><%=ba.getBookName() %></p>
					<p><%=ba.getAuthor() %></p>
					<p>Category: <%=ba.getBookCategory() %></p>
					<div class="row">
						
						<%
						if(u==null)
						{
					%>
						<a href="login.jsp" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-plus ml-1"></i> Add Cart</a>
					<% 
						}
						else
						{
					%>
						<a href="cart?bId=<%=ba.getBookId() %>&&userId=<%=u.getId() %>" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-plus ml-1"></i> Add Cart</a>
					<% 		
						}
					%>
						
						<a href="viewbooks.jsp?bookId=<%=ba.getBookId() %>" class="btn btn-success btn-sm "><i class="fa-solid fa-circle-info ml-1"></i> View details</a>
						<a href="" class="btn btn-danger btn-sm "><i class="fa-solid fa-indian-rupee-sign ml-1"></i> <%=ba.getPrice() %></a>
					</div>
				</div>
			 </div>
			</div>
		<%
		}
		%>
	</div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>