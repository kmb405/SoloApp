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
    <title>Calendar</title>
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
    <div class="d-flex justify-content-center">
    	<div class="container m-5">
    		<div class="">
    			<div class="bg-light border border-2 rounded-3">
				   	<div class="container d-flex justify-content-center border-bottom p-5 bg-lightblue align-items-center">
				   		<h1>Calendar</h1>
				   	</div>
				   	<div class="mx-5 mt-5 d-flex justify-content-between">
				   		<a href="/home"><input class="btn btn-primary" type="button" value="Home"/></a>
				   	</div>
				      <header class="d-flex justify-content-center p-4 align-items-center flex-column">
							<h3 class="current-date"></h3>
					        <div class="icons">
					          <span id="prev" class="material-symbols-rounded">&#60; </span>
					          <span id="next" class="material-symbols-rounded">	&#62;</span>
					        </div>
				      </header>
				      <div class="calendar">
				        <ul class="weeks">
				          <li>Sun</li>
				          <li>Mon</li>
				          <li>Tue</li>
				          <li>Wed</li>
				          <li>Thu</li>
				          <li>Fri</li>
				          <li>Sat</li>
				        </ul>
				        <ul class="days"></ul>
				      </div>
    				</div>
    			</div>
    		</div>
    	</div>
    	<script src="/js/script.js"></script>
    	<script>
	    	daysTag.addEventListener('click', (event) => {
	    	    const day = event.target;
	    	    if (day.classList.contains('day')) {
	    	        // Retrieve the numeric value of the selected day
	    	        const selectedDay = parseInt(day.textContent);
	    	        // Get the numeric value of the current month
	    	        const selectedMonth = currMonth + 1; // Adding 1 to match JavaScript's month indexing (0-based)
	    	        // Get the numeric value of the current year
	    	        const selectedYear = currYear;
	    	        if (selectedMonth < 10 && selectedDay < 10) {
	    	            window.location.href = "/tasks/"+ selectedYear + "-0" + selectedMonth + "-0" + selectedDay + "/" + ${userId};    	        	
	    	        } else if(selectedMonth < 10) {
	    	            window.location.href = "/tasks/"+ selectedYear + "-0" + selectedMonth + "-" + selectedDay + "/" + ${userId};
	    	        } else if(selectedDay < 10) {
	    	            window.location.href = "/tasks/"+ selectedYear + "-" + selectedMonth + "-0" + selectedDay + "/" + ${userId};
	    	        } else {
	    	        	window.location.href = "/tasks/"+ selectedYear + "-0" + selectedMonth + "-" + selectedDay + "/" + ${userId};
	    	        }
	    	    }
	    	});
    	</script>
  </body>
</html>