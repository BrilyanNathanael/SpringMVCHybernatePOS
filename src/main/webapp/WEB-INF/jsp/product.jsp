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
    .header-table{
        background-color: #3c5c5d;
    }
    table{
        box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.1);
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
	<section class="p-5">
        <div class="header-table d-flex justify-content-between p-4">
            <h2 class="text-light">Manage Products</h2>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalAddProduct">
                Add New Product
            </button>
        </div>
        <c:if test="${not empty productList}">
        <table class="table table-hover">
            <thead>
              <tr>
				<th>Item Code</th>
				<th>Price</th>
				<th>Description</th>
				<th>Type</th>
				<th>Taxable</th>
				<th>Action</th>
              </tr>
            </thead>
            <tbody>
        	<c:forEach items="${productList}" var="product">
              <tr>
                <th>${product.itemCode}</th>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>${product.type}</td>
                <td>
        			<c:choose>
						<c:when test="${product.tax == 0}">
							Yes		
						</c:when>
						<c:otherwise>
							No
						</c:otherwise>
					</c:choose>
                </td>
				<td>
					<a href="<c:url value='/auth/product/${product.itemCode}' />" class="btn btn-success"> <spring:message
								code="label.Show" /> >
					</a> 
					<a href="#" onclick="javascript:deleteProduct('${product.itemCode}')" class="btn btn-danger"> <spring:message
								code="label.Delete" /> >
					</a>
				</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          </c:if>
    </section>
    
    <!-- Modal -->
    <div class="modal fade" id="modalAddProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
           	<c:url var="action" value="/auth/product"></c:url>
			<form:form method="post" action="${action}" commandName="product">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Product</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
					<div class="mb-3">
						<form:input path="itemCode" class="form-control" placeholder="Please Input Item Code"/>
						<form:errors path="itemCode" cssClass="errorBlock"/>
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
	<script type="text/javascript">
		var err = document.getElementsByClassName("errorBlock")
		if(err.length > 0){
			var myModal = new bootstrap.Modal(document.getElementById("modalAddProduct"), {});
			myModal.show();
		}
		
	    function deleteProduct(itemCode){
	    	if(confirm('Are you sure want to delete this product?')){
		       var url = 'delete-product/'+itemCode;
		       window.location.href = url;
	    	}
	    }
	</script>
</body>
</html>