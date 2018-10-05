<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>

 	<c:choose>	
		<c:when test="${message != null}">
			<div id="message" style="border-left: 4px solid #7ab800; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 15px; padding-left: 45px; padding-right: 45px; background-color: #EEE">			
				<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 18px; display: table;">
					${message}
				</div>
			</div>
		</c:when>
	</c:choose>


	<c:choose>
	
		<c:when test="${user.tests != null}">
		<div style="border: 1px solid #DDD; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #FFF">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 12px; display: table; margin-top: 0px; color: #A4A4A4">
				RESUME<b> &#xb7; </b>MEMBER SINCE 2018
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 24px; display: table; margin-top: 10px; letter-spacing: -0.5px">
				${user.name}
			</div>			
			<div style="border: 0px solid #DDD; width: 100%; color: #535a60; text-align: left; font-size: 16px; display: table; margin-top: 2px">				
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10 and user.loadPercentCodeOK() == 1}">  
						<b style="color: #f4ae01">&#9733;</b> The code's good	
					</c:when>				
				</c:choose>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 25px; font-style: italic;">
				"I'm Java Developer at 2010. My expertise are Spring MVC and microservices, Mongo DB and Maria DB."
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 25px">
				&#xb7; The coded solutions solved <fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentCodeOK()}"/> of the proposed problems.
			</div>
			<div style="border: 0px solid #DDD; width: 100%; font-size: 16px; display: table; margin-top: 5px">
				&#xb7; Average of ${user.loadTotalComplexity()} for McCabe Cyclomatic Complexity Score.
			</div>
			<div style="border: 0px solid #DDD; width: 100%; font-size: 16px; display: table; margin-top: 5px">
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10}">  
						&#xb7; Codes with low complexity and therefore are easy to maintain.
					</c:when>					
					<c:when test="${user.loadTotalComplexity() > 10 and user.loadTotalComplexity() <= 20}">  
						&#xb7; Codes with medium complexity that can make maintenance a bit difficult.
					</c:when>				
					<c:when test="${user.loadTotalComplexity() > 20 and user.loadTotalComplexity() <= 50}">  
						&#xb7; Highly complex codes that can make it very difficult to maintain.
					</c:when>	
					<c:when test="${user.loadTotalComplexity() > 50}">  
						&#xb7; Very highly complex codes that can make it very difficult to maintain.
					</c:when>				
				</c:choose>
			</div>			
		</div>
		</c:when>
		
	</c:choose>
	
	<c:choose>
	
		<c:when test="${test != null}">      	
		<div style="border: 2px dashed #DDD; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #fafafb">			
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
		<form action="/test" method="post">
		<div style="border: 1px solid #DDD; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #fff;">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 30px; display: table; margin-top: 10px; color: #464646">
				<b>Show companies that you are a great java developer!</b>
			</div>
			<div style="width: 100%; font-size: 18px; display: table; margin-top: 5px; color: #535a60">
				<center>
				Development teams are looking for professionals who know the technology well and are able to deliver high quality codes.
				</center>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 30px; color: #464646">	
				<button style="background-color: #4c89e3; border: 1px solid #4c89e3;font-family: 'Roboto Condensed', sans-serif; font-size: 20px; color: #FFF; padding: 12px; margin: 4px">Show that you are that professional</button>				
			</div>
		</div>
		</form>
		</c:when>
		
	</c:choose>
	
</body>
</html>