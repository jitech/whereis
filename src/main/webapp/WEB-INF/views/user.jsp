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
		<div style="border: 1px solid #DDD; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 22px; display: table; margin-top: 10px">
				${in.name}
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				&#10004; The coded solutions solved <fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${in.loadPercentCodeOK()}"/> of the proposed problems
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				&#10004; Average of ${in.loadTotalComplexity()} for McCabe Cyclomatic Complexity Score
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				<c:choose>
					<c:when test="${in.loadTotalComplexity() > 0 and in.loadTotalComplexity() <= 10}">  
						&#10004; It tends to create codes with low complexity and therefore are easy to maintain
					</c:when>					
					<c:when test="${in.loadTotalComplexity() > 10 and in.loadTotalComplexity() <= 20}">  
						&#10004; Tends to create codes with medium complexity that can make maintenance a bit difficult
					</c:when>				
					<c:when test="${in.loadTotalComplexity() > 20 and in.loadTotalComplexity() <= 50}">  
						&#10004; Tends to create highly complex codes that can make it very difficult to maintain
					</c:when>	
					<c:when test="${in.loadTotalComplexity() > 50}">  
						&#10004; Tends to create very highly complex codes that can make it very difficult to maintain
					</c:when>				
				</c:choose>
			</div>	
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
				<i class="fa fa-clock-o"></i> Tends to be agile upon delivery
			</div>	
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">				
				<c:choose>
					<c:when test="${in.loadTotalComplexity() > 0 and in.loadTotalComplexity() <= 10 and in.loadPercentCodeOK() == 1}">  
						<b style="color: #f4ae01">&#9733;</b> The code quality is good	
					</c:when>				
				</c:choose>
			</div>
		</div>
		</c:when>
		
	</c:choose>
	
</body>
</html>