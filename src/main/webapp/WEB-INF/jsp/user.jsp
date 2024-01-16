<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Spring MVC Hibernate - CRUD</title>
<style type="text/css">
body {
	font-family: Arial;
	font-size: 10px;
	margin: 30px;
}

.userTable, .userTable td {
	border-collapse: collapse;
	border: 1px solid #0000FF;
	margin: 2px;
	padding: 2px 2px 2px 10px;
	font-size: 14px;
}

.userTable th {
	font-weight: bold;
	font-size: 14px;
	background-color: #5C82FF;
	color: white;
}

.userLabel {
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
}

a, a:AFTER {
	color: blue;
}
</style>
<script type="text/javascript">
    function deleteUser(userId){
        if(confirm('Do you want to delete this User ?')){
            var url = 'delete/'+userId;
            window.location.href = url;
        }
    }
    </script>
</head>
<body>

	<h2>SpringMVC-Hibernate CRUD Application</h2>
	<p style="color: green; font-weight: bold;">
		<a href="<c:url value='/home' />"> Add New User</a>
	</p>
	<c:url var="action" value="/user/add"></c:url>
	<form:form method="post" action="${action}" modelAttribute="user">
		<table>

			<c:if test="${not empty user.firstName}">
				<tr>
					<td><form:label path="id" cssClass="userLabel">
							<spring:message code="label.UserId" />
						</form:label></td>

					<td><form:input path="id" readonly="true" size="10"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>

			<tr>
				<td><form:label path="firstName" cssClass="userLabel">
						<spring:message code="label.FirstName" />
					</form:label></td>

				<td><form:input path="firstName" /></td>
			</tr>

			<tr>
				<td><form:label path="lastName" cssClass="userLabel">
						<spring:message code="label.LastName" />
					</form:label></td>

				<td><form:input path="lastName" /></td>
			</tr>

			<tr>
				<td><form:label path="dob" cssClass="userLabel">
						<spring:message code="label.DOB" />
					</form:label></td>

				<td><form:input path="dob" /></td>
			</tr>

			<tr>
				<td><form:label path="email" cssClass="userLabel">
						<spring:message code="label.Email" />
					</form:label></td>

				<td><form:input path="email" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit"
					value="<spring:message code="label.AddUser"/>" /></td>
			</tr>

		</table>
	</form:form>

	<h3>List of Users</h3>

	<c:if test="${not empty userList}">
		<table class="userTable">
			<tr>
				<th width="160">First Name</th>
				<th width="60">Last Name</th>
				<th width="80">Dob</th>
				<th width="60">Email</th>
				<th width="100">Action</th>
			</tr>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td><a href="<c:url value='/edit/${user.id}' />">${user.firstName}</a>
					</td>
					<td>${user.lastName}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.dob}" />
					</td>
					<td>${user.email}</td>
					<td><a href="<c:url value='/edit/${user.id}' />"> <spring:message
								code="label.EditUser" /> >
					</a> <a href="#" onclick="javascript:deleteUser(${user.id})"> <spring:message
								code="label.Delete" /> >
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>