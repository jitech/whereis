<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<c:choose>	
		<c:when test="${message != null}">  
			<div id="message" style="border: 1px solid #E1ECF4; border-style: dashed; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #E1ECF4">			
				<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; color: #39739d">
					${message}
				</div>
			</div>
		</c:when>
	</c:choose>

	<c:choose>
	
		<c:when test="${user.tests != null}">
		<div style="border: 1px solid #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 22px; display: table; margin-top: 10px">
				${user.name}
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				&#10004; The coded solutions solved <fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentCodeOK()}"/> of the proposed problems
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				&#10004; Average of ${user.loadTotalComplexity()} for McCabe Cyclomatic Complexity Score
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10}">  
						&#10004; It tends to create codes with low complexity and therefore are easy to maintain
					</c:when>					
					<c:when test="${user.loadTotalComplexity() > 10 and user.loadTotalComplexity() <= 20}">  
						&#10004; Tends to create codes with medium complexity that can make maintenance a bit difficult
					</c:when>				
					<c:when test="${user.loadTotalComplexity() > 20 and user.loadTotalComplexity() <= 50}">  
						&#10004; Tends to create highly complex codes that can make it very difficult to maintain
					</c:when>				
				</c:choose>
			</div>		
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10}">  
						<b style="color: #f4ae01">&#9733;</b> The code quality is good
					</c:when>					
					<c:when test="${user.loadTotalComplexity() > 10 and user.loadTotalComplexity() <= 20}">  
						&#10004; Need to improve programming concepts
					</c:when>				
					<c:when test="${user.loadTotalComplexity() > 20 and user.loadTotalComplexity() <= 50}">  
						&#10004; Need to improve programming concepts
					</c:when>				
				</c:choose>
			</div>
		</div>
		</c:when>
		
	</c:choose>
	
	<c:choose>
	
		<c:when test="${test != null}">      	
		<div style="border: 1px dashed #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 24px; display: table; margin-top: 10px; color: #464646">
				<b>You still have a code to deliver!</b>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 10px; color: #464646">
				<form action="/test" method="post">
					<button style="background-color: #f4ae01; border: 1px solid #f4ae01;font-family: 'Roboto Condensed', sans-serif; font-size: 24px; color: #FFF; padding: 8px; margin: 4px">Take me to a test</button>
				</form>
			</div>
		</div>
   		</c:when>
   		
		<c:when test="${test == null}">
		<div style="border: 1px solid #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 24px; display: table; margin-top: 10px; color: #464646">
				<b>Show companies that you are a great java developer</b>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px; color: #464646">
				Development teams are looking for more and more professionals who are concerned about delivering quality code. <br/> Show that you are that professional!
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 10px; color: #464646">
				<form action="/test" method="post">
					<button style="background-color: #4c89e3; border: 1px solid #4c89e3;font-family: 'Roboto Condensed', sans-serif; font-size: 24px; color: #FFF; padding: 8px; margin: 4px">Start now</button>
				</form>
			</div>
		</div>
		</c:when>
		
	</c:choose>
	
</body>
</html>