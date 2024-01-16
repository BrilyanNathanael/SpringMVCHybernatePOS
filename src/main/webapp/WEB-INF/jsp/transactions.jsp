<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
    .header-table{
        background-color: #3c5c5d;
    }
    table{
        box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.1);
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
	<section class="p-5">
       	<c:if test="${listSales.size() > 0}">
		<c:forEach items="${listSales}" var="sale">
        <div class="header-table d-flex justify-content-between p-4">
            <h2 class="text-light">Transaction #${sale.saleNumber}</h2>
        </div>
		<table class="table table-hover mb-5">
			<tr class="table-secondary">
				<th colspan="6">${sale.transDate}</th>		
			</tr>
			<tr>
				<th>Item Code</th>
				<th>Description</th>
				<th>Type</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Sub Price</th>
			</tr>
			<c:forEach items="${sale.listSaleItems}" var="item" varStatus="loop">
			<tr>
				<td>${item.product.itemCode}</td>		
				<td>${item.product.description}</td>
				<td>${item.product.type}</td>
				<td>${item.quantity}</td>
				<td>${item.price}</td>
				<td>${item.quantity * item.price}</td>
			</tr>	
			</c:forEach>
			<tr>
				<td colspan="5"><b>Total Grand Price</b></td>
				<td><b>${sale.payment.amount - sale.payment.cash_in_hand - sale.tax}</b></td>
			</tr>
			<tr>
				<td colspan="5"><b>Tax</b></td>
				<td><b>${sale.tax}</b></td>
			</tr>
			<tr>
				<td colspan="5"><b>Total Grand Price + Tax</b></td>
				<td><b>${sale.payment.amount - sale.payment.cash_in_hand}</b></td>
			</tr>
			<tr>
				<td colspan="5"><b>Payment (${sale.payment.payment})</b></td>
				<td><b>${sale.payment.amount}</b></td>
			</tr>
		</table>
		</c:forEach>
	</c:if>
    </section>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
</body>
</html>