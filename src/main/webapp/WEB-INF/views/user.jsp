<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

	<c:choose>
	
		<c:when test="${in.tests != null}">
		<div style="border: 1px solid #eae9e9; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #f8f8f8">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 24px; display: table; margin-top: 0px; letter-spacing: -0.5px">
				${in.name}
			</div>				
			<div style="border: 0px solid #DDD; width: 100%; color: #535a60; text-align: left; font-size: 16px; display: table; margin-top: 2px">				
				<c:choose>
					<c:when test="${in.loadTotalComplexity() > 0 and in.loadTotalComplexity() <= 10 and in.loadPercentCodeOK() == 1}">  
						<b style="color: #f4ae01">&#9733;</b> Code well
					</c:when>				
				</c:choose>
			</div>			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 25px; font-style: italic;">
				"I'm Java Developer at 2010. My expertise are Spring MVC and microservices, Mongo DB and Maria DB."
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 25px">
				&#xb7; The coded solutions solved <fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${in.loadPercentCodeOK()}"/> of the proposed problems.
			</div>
			<div style="border: 0px solid #DDD; width: 100%; font-size: 16px; display: table; margin-top: 5px">
				&#xb7; Average of ${in.loadTotalComplexity()} for McCabe Cyclomatic Complexity Score.
			</div>
			<div style="border: 0px solid #DDD; width: 100%; font-size: 16px; display: table; margin-top: 5px">
				<c:choose>
					<c:when test="${in.loadTotalComplexity() > 0 and in.loadTotalComplexity() <= 10}">  
						&#xb7; Codes with low complexity and therefore are easy to maintain.
					</c:when>					
					<c:when test="${in.loadTotalComplexity() > 10 and in.loadTotalComplexity() <= 20}">  
						&#xb7; Codes with medium complexity that can make maintenance a bit difficult.
					</c:when>				
					<c:when test="${in.loadTotalComplexity() > 20 and in.loadTotalComplexity() <= 50}">  
						&#xb7; Highly complex codes that can make it very difficult to maintain.
					</c:when>	
					<c:when test="${in.loadTotalComplexity() > 50}">  
						&#xb7; Very highly complex codes that can make it very difficult to maintain.
					</c:when>				
				</c:choose>
			</div>			
			<div style="border: 0px solid #DDD; width: 100%; color: #535a60; text-align: right; font-size: 10px; display: table; margin-top: 20px;">				
				SÃO PAULO, SP - BRAZIL
			</div>					
		</div>
		</c:when>
		
	</c:choose>
	
</body>
</html>