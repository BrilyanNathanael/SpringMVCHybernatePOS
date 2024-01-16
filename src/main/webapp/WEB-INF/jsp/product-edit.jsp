<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
    .shadow{
    	box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.1);
    }
    input[type="text"], input[type="number"]{
        background-color: whitesmoke;
    }
    .header-table{
        background-color: #3c5c5d;
        border-top-right-radius: 8px;
    	border-top-left-radius: 8px;
    }
    .edit-form{
    	border-bottom-right-radius: 8px;
    	border-bottom-left-radius: 8px;
    }
    .errorBlock{
    	color: red;
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
	
	<section class="shadow p-5 d-flex flex-column align-items-center">
	     <div class="header-table d-flex justify-content-between p-4 w-50">
	         <h2 class="text-light">Edit Product</h2>
	     </div>
		<div class="p-5 w-50 edit-form" style="background:white;">
			<c:url var="action" value="/auth/product/${product.itemCode}"></c:url>
			<form:form method="post" action="${action}" commandName="product">
				<div class="mb-3">
					<form:input path="itemCode" class="form-control" id="inputItemCode"/>
				</div>
				<div class="mb-3">
					<form:input path="price" type="number" class="form-control" placeholder="Please Input Price"/>
					<form:errors path="price" cssClass="errorBlock"/>
				</div>
				<div class="mb-3">
					<form:input path="description" class="form-control" placeholder="Please Input Description"/>
					<form:errors path="description" cssClass="errorBlock"/>
				</div>
				<div class="mb-3">
					<form:input path="type" class="form-control" placeholder="Please Input Type"/>
					<form:errors path="type" cssClass="errorBlock"/>
				</div>
				<div class="mb-3 d-flex flex-column">
					<form:label path="tax" cssClass="userLabel">
						<spring:message code="label.Taxable" />
					</form:label>
					<div class="d-flex">
						<form:radiobutton path="tax" value="0" class="form-check-input"/> Yes 
						<form:radiobutton path="tax" value="-1" class="ms-4 form-check-input"/> No
					</div>
				</div>
				<button class="btn btn-success w-100">Update</button>
			</form:form>
		
		</div>
	</section>
	
	<script>
		var itemCode = document.getElementById("inputItemCode");
		itemCode.setAttribute("readonly", "readonly");
	</script>
</body>
</html>