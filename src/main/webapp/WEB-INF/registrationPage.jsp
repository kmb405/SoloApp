<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
    <style>
	body {
	  background-image: url(/images/background.png);
	}
	</style>
</head>
<body>
	<div class="container  d-flex justify-content-center">
		<div class="container m-5 w-50">
			<div class="bg-light border border-2 rounded-3">
				<div class="container flex-column d-flex justify-content-center border-bottom p-5 bg-lightblue align-items-center">
					<h1>Family Connect</h1>
			     </div>
			     <div class="px-5 m-5">     
			     	<h2>Register</h2>
    
			    	<p><form:errors path="user.*"/></p>
			    
				    <form:form class="form" method="POST" action="/register" modelAttribute="user">
				        <h5 class="p-3">
				            <form:label class="p-2" path="username">Username:</form:label>
				            <form:errors path="username"/>
				            <form:input class="form-control" path="username"/>
				        </h5>
				        <h5 class="p-3">
				            <form:label class="p-2" path="password">Password:</form:label>
				            <form:errors path="password"/>
				            <form:password class="form-control" path="password"/>
				        </h5>
				        <h5 class="p-3">
				            <form:label class="p-2" path="passwordConfirmation">Password Confirmation:</form:label>
				            <form:errors path="passwordConfirmation"/>
				            <form:password class="form-control" path="passwordConfirmation"/>
				        </h5>
				        <input class="my-5 btn btn-danger form-control" type="submit" value="Register!"/>
				    </form:form>
			   	</div>
			</div>
		</div>
	</div>
</body>
</html>