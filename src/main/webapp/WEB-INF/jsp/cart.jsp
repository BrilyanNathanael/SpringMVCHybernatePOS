<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
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
    .header-table{
        background-color: #3c5c5d;
    }
    table{
        box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.1);
    }
</style>
<script>
	function changePayment(){
		var typePayment = document.getElementById('typePayment');
		var colPayment = document.getElementById('colPayment');
		var totalPayment = document.getElementById('totalPayment');
		var amount = document.getElementById('amount');
		if(typePayment.value == 'cash'){
			amount.value = "";
			amount.removeAttribute("readonly");
		}else{
			amount.value = totalPayment.innerText;
			amount.setAttribute("readonly", "readonly");
		}
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
	<section class="p-5">
        <div class="header-table d-flex justify-content-between p-4">
            <h2 class="text-light">My Cart</h2>
        </div>
        <c:url var="action" value="/auth/transaction"></c:url>
		<form:form method="post" action="${action}" modelAttribute="payment">
        <table class="table table-hover">
            <thead>
				<tr>
					<th>Item Code</th>
					<th>Description</th>
					<th>Type</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Sub Price</th>
				</tr>
            </thead>
            <tbody>
	        	<c:if test="${myCart.listCarts.size() > 0}">
				<c:forEach items="${myCart.listCarts}" var="cart" varStatus="loop">
				<tr>
					<td>${cart.product.itemCode}</td>	
					<td>${cart.product.description}</td>
					<td>${cart.product.type}</td>
					<td>${cart.quantity}</td>
					<td>${cart.price}</td>
					<td>${cart.quantity * cart.price}</td>
				</tr>			
				</c:forEach>
				<tr>
					<td colspan="5"><b>Total Grand Price</b></td>
					<td>${totalGrandPrice}</td>
				</tr>
				<tr>
					<td colspan="5"><b>Tax</b></td>
					<td>${tax}</td>
				</tr>
				<tr>
					<td colspan="5"><b>Total Grand Price + Tax</b></td>
					<td id="totalPayment">${totalGrandPrice + tax}</td>
				</tr>
				<tr>
					<td>Type Payment</td>
					<td>
						<form:select path="payment" id="typePayment" onchange="changePayment()" class="form-select">
							<option value="cash">Cash</option>
							<option value="qris">QRis</option>
						</form:select>
					</td>
					<td id="colPayment" colspan="4" style="padding-right: 10px;">
						<form:input path="amount" class="form-control" style="width:100%;" placeholder="Please input amount" id="amount" type="number" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<center>
					<a href='<c:url value="/auth/checkout"></c:url>' class="btn btn-warning w-100">Add more item</a>				
					</center>
					</td>
					<td colspan="4">
						<button class="btn btn-success w-100">Pay</button>
					</td>
				</tr>
				</c:if>
				<c:if test="${myCart.listCarts == null}">
					<tr>
						<td colspan="7"><center>There is nothing in here...</center></td>
					</tr>
					<tr>
						<td colspan="7">
						<center>
						<a href="<c:url value="/auth/checkout"></c:url>" class="btn btn-success">Add item to cart</a>				
						</center>
						</td>
					</tr>
				</c:if>
            </tbody>
          </table>
          </form:form>
    </section>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
</body>
</html>