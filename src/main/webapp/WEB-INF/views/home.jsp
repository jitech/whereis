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
			<div id="message" style="border: 1px solid #E1ECF4; border-style: dashed; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #E1ECF4">			
				<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; color: #39739d">
					${message}
				</div>
			</div>
		</c:when>
	</c:choose>

	<c:choose>
	
		<c:when test="${user.tests != null}">
		<div style="border: 2px dashed #DDD; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 22px; display: table; margin-top: 10px">
				${user.name}
			</div>
			<div style="border: 0px solid #DDD; width: 100%; color: #535a60; text-align: left; font-size: 16px; display: table; margin-top: 2px">				
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10 and user.loadPercentCodeOK() == 1}">  
						<b style="color: #f4ae01">&#9733;</b> The code quality is good	
					</c:when>				
				</c:choose>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 25px">
				The coded solutions solved <fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentCodeOK()}"/> of the proposed problems
			</div>
			<div style="border: 0px solid #DDD; width: 100%; font-size: 16px; display: table; margin-top: 5px">
				Average of ${user.loadTotalComplexity()} for McCabe Cyclomatic Complexity Score
			</div>
			<div style="border: 0px solid #DDD; width: 100%; font-size: 16px; display: table; margin-top: 5px">
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10}">  
						Codes with low complexity and therefore are easy to maintain
					</c:when>					
					<c:when test="${user.loadTotalComplexity() > 10 and user.loadTotalComplexity() <= 20}">  
						Codes with medium complexity that can make maintenance a bit difficult
					</c:when>				
					<c:when test="${user.loadTotalComplexity() > 20 and user.loadTotalComplexity() <= 50}">  
						Highly complex codes that can make it very difficult to maintain
					</c:when>	
					<c:when test="${user.loadTotalComplexity() > 50}">  
						Very highly complex codes that can make it very difficult to maintain
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
		<div style="border: 2px dashed #DDD; width: 70%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #fafafb; background-image: url('https://cdn.sstatic.net/img/hero/pattern.svg?v=13ca42e6c21d')">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 28px; display: table; margin-top: 10px; color: #464646">
				<b>Show companies that you are a great java developer</b>
			</div>
			<div style="border-top: 2px dotted #DDD; width: 100%; font-size: 18px; display: table; margin-top: 20px; padding-top: 15px; color: #464646">
				<center>
				Development teams are looking for professionals who know the technology well and are able to deliver high quality codes.
				</center>
			</div>
			<div style="width: 100%; font-size: 20px; display: table; padding-top: 15px; color: #464646">
				<center>
				Show that you are that professional!
				</center>
			</div>
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px; color: #464646">	
				<input type="checkbox" id="ativo" name="ativo" value="true" required/>I agree to the <a href="/terms-of-use">terms of use</a>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 30px; color: #464646">	
				<button style="background-color: #4c89e3; border: 1px solid #4c89e3;font-family: 'Roboto Condensed', sans-serif; font-size: 24px; color: #FFF; padding: 8px; margin: 4px">Start test now</button>				
			</div>
		</div>
		</form>
		</c:when>
		
	</c:choose>
	
</body>
</html>