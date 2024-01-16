<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    input[type="text"], input[type="password"]{
        background-color: whitesmoke;
    }
    .errorBlock{
    	color: red;
    }
</style>
</head>
<body>
    <section class="d-flex justify-content-center align-items-center h-100">
        <div class="w-50 bg-white p-5" style="border-radius: 10px;">
        	<c:if test="${error != null}">
        		<p class="errorBlock">${error}</p>
        	</c:if>
        	<c:url var="action" value="/login"></c:url>
           	<form:form method="post" action="${action}" modelAttribute="user">
           		<div class="mb-3">
				<form:input path="username" class="form-control" placeholder="Please Input Username"/>
				<form:errors path="username" cssClass="errorBlock"/>
           		</div>
           		<div class="mb-3">
				<form:input path="password" type="password" class="form-control" placeholder="Please Input Password"/>
				<form:errors path="password" cssClass="errorBlock"/>           		
           		</div>
		        <button type="submit" class="w-100 btn" style="background: rgb(148,213,224);">Login</button>
		        <p class="text-secondary text-center mt-3 mb-0">Click <a href="<c:url value='/' />" class="text-decoration-none fw-bold" style="color: salmon;">here</a> to return to the home page</p>
			</form:form>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>