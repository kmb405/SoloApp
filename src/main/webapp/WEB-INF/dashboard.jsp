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
    <title>Dashboard</title>
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

    <div class="d-flex justify-content-center">
    	<div class="container m-5">
    		<div class="">
    			<div class="bg-light border border-2 rounded-3">
				   	<div class="container d-flex justify-content-between border-bottom p-5 bg-lightblue align-items-center">
				   		<h1>Dashboard</h1>
				   		<a href=""><img width="20px" alt="Notfication" src="images/notifications.png" class=""></a>
				   	</div>
				   	<div class="d-flex justify-content-end">
				   		<a href="/logout"><button class="btn btn-primary m-4">Logout</button></a>
				   	</div>
    				<div class="row px-5 d-inline-flex wrap-content">
    				<h3 class="mb-5 text-center">Welcome to Your Daily Planner!</h3>
					  <div class="col pb-5">
					  	<a class="text-decoration-none" href="/calendar/${userId}">
					    	<div class="card">
							    <div class="card-header">
							    	<h5 class="card-title">Calendar</h5>
							  	</div>
						        <div class="card-body">
							        <img width="245px" height="210px" class="p-3" src="images/download.png"/>
						         </div>
						    </div>
					    </a>
					  </div>
					 <div class="col pb-5">
					  	<a class="text-decoration-none" href="/tasks/<%= formattedDate %>/${userId}">
					    <div class="card">
						    <div class="card-header">
						    	<h5 class="card-title">Tasks</h5>
						  	</div>
							      <div class="card-body">
								        <img width="245px" height="210px"class="p-3" src="images/todos.png"/>
								  </div>
						    </div>
						    </a>
					  </div>
					  <div class="col pb-5">
					  	<a class="text-decoration-none" href="/messages">
					    <div class="card">
						    <div class="card-header">
						    	<h5 class="card-title">Messages</h5>
						  	</div>
							      <div class="card-body">
								        <img width="245px" height="210px"class="p-3" src="images/messages.png"/>
								  </div>
						    </div>
						    </a>
					  	</div>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
</body>
</html>