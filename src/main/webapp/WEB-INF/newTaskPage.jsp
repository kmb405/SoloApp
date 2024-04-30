<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Task</title>
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
    <%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String formattedDate = sdf.format(date);
	%>
   	<div class="container w-50 d-flex justify-content-center">
    	<div class="container m-5">
    		<div class="">
    			<div class="bg-light border border-2 rounded-3">
				   	<div class="container d-flex justify-content-center border-bottom p-5 bg-lightblue align-items-center">
				   		<h1>New Task</h1>
				   	</div>
				   	<div class="mx-5 mt-5 d-flex justify-content-between">
				   		<a href="/tasks/<%= formattedDate %>/${userId}"><input class="btn btn-primary" type="button" value="Tasks"/></a>
				   	</div>
				   	<form:form action="/createTask" method="post" modelAttribute="task">
					   	<div class="mx-5 mt-5 row">
					    	<form:label path="user" class="col-sm-2 col-form-label"><strong>Person</strong></form:label>
					    	<div class="col-sm-10">
					    	<form:errors path="user" class="text-danger m-5"/>
							    <form:select class="form-select" path="user" aria-label="Default select example">
							    	<c:forEach var="user" items="${users}">
										<form:option path="user" value="${user.id }"><c:out value = "${user.username}"/></form:option>
									</c:forEach>
								</form:select>
							</div>
					   </div>
					   	<div class="mx-5 mt-4 row">
					    	<form:label path="tasktype" class="col-sm-2 col-form-label"><strong>Task</strong></form:label>
					    	<div class="col-sm-10">
					    	<form:errors path="tasktype" class="text-danger m-5" />
							    <form:select class="form-select" path="tasktype" aria-label="Default select example">
									<form:option value="Task">Task</form:option>
									<form:option value="Chore">Chore</form:option>
									<form:option value="Reminder">Reminder</form:option>
								</form:select>
					    	</div>
					   </div>
					  	<div class="mx-5 my-4 row">
					    	<form:label for="description" path="description" class="col-sm-2 col-form-label"><strong>Description</strong></form:label>
						    <div class="col-sm-10">
						    <form:errors path="description" class="text-danger m-3" />
						      <form:input type="text" path="description" class="form-control" id="task"/>
						    </div>
					   </div>
					   <div class="mx-5 my-4 row">
					    	<form:label for="taskdate" path="taskdate" class="col-sm-2 col-form-label"><strong>Date</strong></form:label>
						    <div class="col-sm-10">
						    <form:errors path="taskdate" class="text-danger m-3" />
						      <form:input type="date" class="form-control" id="taskdate" path="taskdate"/>
						    </div>
					   </div>
					   <div class="mx-5 my-4 row">
					    	<form:label for="tasktime" path="tasktime" class="col-sm-2 col-form-label"><strong>Time</strong></form:label>
						    <div class="col-sm-10">
						    <form:errors path="tasktime" class="text-danger m-3" />
						      <form:input type="time" class="form-control" id="tasktime" path="tasktime"/>
						    </div>
					   </div>
					   <div class="mx-5 my-4 row">
					    	<form:label for="repeat" path="taskrepeat" class="col-sm-2 col-form-label"><strong>Repeat</strong></form:label>
						    <div class="col-sm-10">
						    <form:errors path="taskrepeat" class="text-danger text-center m-3" />
						      <form:select class="form-select" path="taskrepeat" aria-label="Default select example">
									<form:option value="1">Daily</form:option>
									<form:option value="7">Weekly</form:option>
									<form:option value="30">Monthly</form:option>
								</form:select>
						    </div>
					   </div>
					   <div class="mx-5 my-4 row">
					    	<form:label for="repeatUntil" path="repeatUntil" class="col-sm-2 col-form-label"><strong>Repeat Until</strong></form:label>
						    <div class="col-sm-10">
						    <form:errors path="repeatUntil"  class="text-danger m-3"/>
						      <form:input type="date" class="form-control" id="repeatUntil" path="repeatUntil"/>
						    </div>
					   </div>
					<!--    <div class="m-5 row">
					    	<div class="form-check form-switch">
							  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							  <label class="form-check-label" for="flexSwitchCheckDefault">All Day</label>
							</div>
					   </div>  -->
					   <div class="d-flex justify-content-end m-5">
						   <input type="submit" value="submit" class=" btn btn-primary""/>
					   </div>
					</form:form>
    			</div>
    		</div>
    	</div>
    </div>
</body>
</html>