<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<c:choose>	
		<c:when test="${message != null}">  
			<div id="message" style="border: 1px dashed #E1ECF4; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #E1ECF4">			
				<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; color: #39739d">
					${message}
				</div>
			</div>
		</c:when>
	</c:choose>

	<div style="border: 1px solid #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 22px; display: table; margin-top: 10px">
			Jonas Goulart Melo
		</div>	
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 10px; font-size: 13px">
			<div style="color: #655347; background-color: #FCD2B4; display: table; padding: 5px; margin: 2px; float: left">
				Spring MVC
			</div>
			<div style="color: #655347; background-color: #FCD2B4; display: table; padding: 5px; margin: 2px; float: left">				
				JSF
			</div>
			<div style="color: #655347; background-color: #FCD2B4; display: table; padding: 5px; margin: 2px; float: left">				
				Hibernate
			</div>
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#10004; Already coded 5 specifications
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#10004; It tries to create codes with low complexity and easy maintenance
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#10004; Average of 4 for McCabe Cyclomatic Complexity Score
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#9733; The code quality is good
		</div>
	</div>
	
	<c:choose>
	
		<c:when test="${test != null}">      	
		<div style="border: 1px dashed #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 10px; color: #464646">
				You still have a code to do!
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 10px; color: #464646">
				<form action="/test" method="post">
					<button style="background-color: #f4ae01; border: 1px solid #f4ae01;font-family: 'Roboto Condensed', sans-serif; font-size: 24px; color: #FFF; padding: 8px; margin: 4px">Send code</button>
				</form>
			</div>
		</div>
   		</c:when>
   		
		<c:when test="${test == null}">
		<div style="border: 1px solid #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 20px; background-color: #fafafb">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 10px; color: #464646">
				Code and show to companies that you know what you are doing
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 4px; color: #464646">
				Encoding does not have time to send, however it is always good to send as soon as possible
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