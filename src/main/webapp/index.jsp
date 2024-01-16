<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<title>Point of Sales</title>
<style>
    *{
        font-family: 'Poppins', 'sans-serif';
    }
    body{
        height: 85vh;
        background: rgb(148,213,224);
        background: linear-gradient(45deg, rgba(148,213,224,1) 54%, rgba(108,162,172,1) 91%);
    }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-transparant">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="<c:url value='/' />">.:: PoS ::.</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <c:if test="${userContext != null}">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                <a class="nav-link" href="<c:url value='/auth/checkout' />">Checkout</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="<c:url value='/auth/cart' />">Cart</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="<c:url value='/auth/product' />">Products</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="<c:url value='/auth/transaction' />">Transactions</a>
                </li>
            </ul>  
            <c:url var="action" value="/logout"></c:url>          
    		<form:form method="post" action="${action}">
				<button type="submit" style="background:rgb(148,213,224);">Logout</button>
			</form:form>
            </c:if>
            </div>
        </div>
    </nav>
          
    <section class="p-5 d-flex flex-column justify-content-center align-items-center h-100">
    	<c:choose>
    		<c:when test="${userContext == null}">
        		<h1 class="fw-bold" style="font-size: 3.5rem;">Hi Anonymous!</h1>    	
		        <h1 class="fw-bold" style="font-size: 3.5rem;">Welcome to the <span style="color:salmon;">Point of Sales</span></h1>
		        <p class="text-secondary">Please login to access more.</p>
		        <button class="fw-bold"><a href="<c:url value='/login' />" class="text-decoration-none text-dark w-100 h-100">LOGIN</a></button>
    		</c:when>
    		<c:otherwise>
    			<h1 class="fw-bold" style="font-size: 3.5rem;">Hi ${userContext}!</h1>    	
		        <h1 class="fw-bold" style="font-size: 3.5rem;">Welcome to the <span style="color:salmon;">Point of Sales</span></h1>
		        <p class="text-secondary">You can checkout something in here.</p>
		        <button class="fw-bold"><a href="<c:url value='/auth/checkout' />" class="text-decoration-none text-dark w-100 h-100">CHECKOUT</a></button>
    		</c:otherwise>
    	</c:choose>
    </section>
    <footer>
        <p class="fw-medium text-center">
            &copy; Brilyan Nathanael Rumahorbo 2024
        </p>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>