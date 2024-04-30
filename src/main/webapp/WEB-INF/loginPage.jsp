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
    <title>Login</title>
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
				<header class="container flex-column d-flex justify-content-center border-bottom p-5 bg-lightblue align-items-center">
					<h1>Family Connect</h1>
			     </header>
			     <div class="p-5 m-5">     
			     	<h2>Login</h2>
			    	<c:if test="${logoutMessage != null}">
			        	<c:out value="${logoutMessage}"></c:out>
			    	</c:if>
			    
				    <c:if test="${errorMessage != null}">
				        <c:out value="${errorMessage}"></c:out>
				    </c:if>
				    <form class="form" method="POST" action="/login">
				        <h4 class="p-3">
				            <label for="username" class="py-2">Username</label><br/>
				            <input class="form-control" type="text" id="username" name="username"/>
				        </h4>
				        <h4 class="px-3">
				            <label for="password" class="py-2">Password</label><br/>
				            <input class="form-control" type="password" id="password" name="password"/>
				        </h4>
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        <input class="my-5 btn btn-danger form-control" type="submit" value="Login!"/>
				    </form>
				    <div class="mx-5 d-flex justify-content-center">
			   			<a href="/register" class="text-primary"><strong>Register</strong></a>
			   		</div>
			    </div>
		    </div>
    	</div>
    </div>
</body>
</html>