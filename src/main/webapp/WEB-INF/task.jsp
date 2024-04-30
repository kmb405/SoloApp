<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
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
    		<div class="">
    			<div class="bg-light border border-2 rounded-3">
				   	<div class="container d-flex justify-content-center border-bottom p-5 bg-lightblue align-items-center">
				   		<h1><c:out value="${task.tasktype}"/></h1>
				   	</div>
				   	<div class="m-5 d-flex justify-content-between">
				   		<a href="/home"><input class="btn btn-primary" type="button" value="Home"/></a>
				   		<div>
					   		<a href="/editTask/${task.id}"><input class="btn btn-success" type="button" value="+ Edit"/></a>
					   		<a href="/deleteTask/${task.id}"><input class="btn btn-danger" type="button" value="+ Delete"/></a>
				   		</div>
				   	</div>
    				<div class="container">
					  	<div class="m-5 row">
						    <div class="border rounded bg-white">
						    	<label for="task" class="py-3"><strong>Task: </strong><c:out value="${task.description}"/></label>						      
						    </div>
					   </div>
					   <div class="m-5 row">
						    <div class="p-3 border rounded bg-white">
						    	<label for="taskdate"><strong>Date: </strong><c:out value="${task.taskdate}"/></label>	
						    </div>
					   </div>
					   <div class="m-5 row">
						    <div class=" border rounded bg-white">
						    	<label for="tasktime" class="py-3"><strong>Time: </strong><c:out value="${task.tasktime}"/></label>						      
						    </div>
					   </div>
					   <div class="m-5 row">
						    <div class="border rounded bg-white">
						    	<label for="repeat" class="py-3">
						    		<strong>Repeat: </strong>
						    		<c:if test="${task.taskrepeat== 1}">
						    			Daily
						    		</c:if>
						    		<c:if test="${task.taskrepeat== 7}">
						    			Weekly
						    		</c:if>
						    		<c:if test="${task.taskrepeat== 30}">
						    			Monthly
						    		</c:if>
						    	</label>
						      
						    </div>
					   </div>
					   <div class="m-5 row">
						    <div class=" border rounded bg-white">
						    	<label for="repeatUntil" class="py-3"><strong>Until: </strong><c:out value="${task.repeatUntil}"/>
						    		<c:if test="${fn:length(task.repeatUntil) > 15}">
								      	${fn:substring(task.repeatUntil,0,10)}
								   	</c:if>				    		
						    	</label>						      
						    </div>
					   </div>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
</body>
</html>