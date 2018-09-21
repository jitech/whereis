<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    
    <div style="border-bottom: 1px solid #DDD; width: 100%; display: table; background-color: #fafafb; border-top: 3px solid #F48024">
    	
    	<div style="display: table; width: 80%">

    		<div style="display: table; float: left; margin: 15px;">
    			<a href="/about-us">About us</a> &#xb7; <a href="/privacy-policy">Privacy policy</a> &#xb7; Terms of use
    		</div>

    		<div style="display: table; float: right; margin: 15px">   			
    			<c:choose>
					<c:when test="${user == null}">
        				<a href="/login">Entrar</a>
   					</c:when>
   					<c:when test="${user != null}">
        				<a href="/exit">Exit</a>
   					</c:when>
   				</c:choose>
    		</div>
    		
    		<div style="display: table; float: right; margin: 15px">
   				<c:if test="${user != null}">
   					Hello, ${user.name}
   				</c:if>
    		</div>
    	</div>
    	
    </div>
    
</body>
</html>