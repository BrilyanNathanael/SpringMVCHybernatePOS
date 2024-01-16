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
<html xmlns:th="http://www.thymeleaf.org">
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
    input[type="text"]{
        background-color: whitesmoke;
    }
    .header-table{
        background-color: #3c5c5d;
        border-top-right-radius: 8px;
	    border-top-left-radius: 8px;
    }
    .body-table{
        border-bottom-right-radius: 8px;
	    border-bottom-left-radius: 8px;
    }
</style>
<script type="text/javascript">
	function changeItemCode(){
		var itemCode = document.getElementById('selectItemCode').value;
		location.replace("http://localhost:8080/MyWeb/auth/checkout?itemCode=" + itemCode);
	}
	
</script>
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

   <section class="d-flex flex-column justify-content-center align-items-center h-100">
        <div class="header-table d-flex justify-content-between p-4 w-50">
            <h2 class="text-light text-center">Add Item to Cart</h2>
        </div>
        <div class="body-table w-50 bg-white p-5">
            <c:url var="action" value="/auth/cart"></c:url>
			<form:form method="post" action="${action}" modelAttribute="cart" id="formSale">
         		<form:select path="itemCode" style="width:100%;" id="selectItemCode" class="form-select" onchange="changeItemCode()">
					<option value="">Select Item Code</option>
					<c:forEach items="${listProductId}" var="item">
						<c:choose>
						<c:when test="${item.itemCode == product.itemCode}">
						<option value="${item.itemCode}" selected="true">${item.itemCode}</option>
						</c:when>
						<c:otherwise>
						<option value="${item.itemCode}">${item.itemCode}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
				<c:if test="${product != null}">
                <div class="table-container mt-4">
                    <table class="table table-hover">
                        <thead>
                            <tr class="table-secondary">
                                <th scope="col">Item Code</th>
                                <th scope="col">Price</th>
                                <th scope="col">Description</th>
                                <th scope="col">Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                             	<th>${product.itemCode}</th>
				                <td>${product.price}</td>
				                <td>${product.description}</td>
				                <td>${product.type}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <button type="button" class="mt-3 w-100 btn btn-success" data-bs-toggle="modal" data-bs-target="#modalAddProduct">Add to Cart</button>
				</c:if>
            </form:form>
        </div>
    </section>

     <!-- Modal -->
     <div class="modal fade" id="modalAddProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
        	<c:url var="action" value="/auth/cart"></c:url>
           	<form:form method="post" action="${action}" modelAttribute="cart" id="formSale">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Quantity</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<c:url var="action" value="/auth/cart"></c:url>
            	<form:hidden path="itemCode" value="${product.itemCode}"/>
            	<form:input path="quantity" min="1" value="1" type="number" class="form-control mb-3" placeholder="Please Input Quantity"/>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success">Save</button>
            </div>
            </form:form>
        </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>



</body>
</html>