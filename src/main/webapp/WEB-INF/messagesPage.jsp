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
    <title>Messages</title>
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
<div class="container w-50 d-flex justify-content-center">
    	<div class="container m-5">    			
    		<div class="bg-light border border-2 rounded-3">
			   	<div class="container d-flex justify-content-center border-bottom p-5 bg-lightblue align-items-center">
			   		<h1>Family Messages</h1>
			   	</div>
			   	<div class="m-5 d-flex">
			   		<a href="/home"><input class="btn btn-primary" type="button" value="Home"/></a>
			   	</div>
			   	<div id="message" style="max-height:520px " class="m-2 p-5 overflow-auto vh-100 d-flex flex-column">
					   	<c:forEach var="message" items="${messages}">
						   	<div class="m-3 border border-success bg-lightblue rounded-5 px-5 pt-3">
								<h6><c:out value="${message.name}"></c:out></h6>
								<p><c:out value="${message.userMessage}"></c:out></p>
							</div>
						</c:forEach>
					<form:form class="form" action="/createMessage" method="post" modelAttribute="message">
						<form:input hidden="hidden" path="name" value="${userName}"/>
						<form:errors path="userMessage" class="p-3 my-3 text-danger"/>
						<form:input class="form-control" type="text" path="userMessage" placeholder="Message"/>
						<input class="btn btn-danger my-3" type="submit" value="Send"/>
					</form:form>
				</div>
			</div>	
		</div>
	</div>
<script>
    document.getElementById('message').scrollTop = 9999999;
</script>
</body>
</html>