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
    <title>ToDo List</title>
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
			   		<h1>ToDo List</h1>
			   	</div>
			   	<div class="mx-5 mt-5 d-flex justify-content-between">
			   		<a href="/home"><input class="btn btn-primary" type="button" value="Home"/></a>
			   		<a href="/newTask"><input class="btn btn-success" type="button" value="+ Add"/></a>
			   	</div>
   				<div class="container p-5 list-group">
   					<c:forEach var="task" items="${tasks}">
   						<div class="p-2">
	   						<a href="/task/${task.id}"><button type="button" class="list-group-item list-group-item-action btn rounded">&#9830; <c:out value="${task.description}"></c:out></button></a>
   						</div>
   					</c:forEach>
				</div>
   			</div>
    	</div>
    </div>
</body>
</html>