<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    
    <div style="width: 100%; display: table; background-color: rgba(255, 255, 255, 0.95); border-top: 3px solid #F48024; position: fixed;
    top:0; left: 0; text-align: center; padding-top: 18px; padding-bottom: 18px">
    	
    	<a href="/index" style="letter-spacing: -3.5px; font-size: 36px; font-weight: bold;">I loveMyCode</a>
    	 	
    	<c:choose>
			<c:when test="${user == null}">
        		<a href="/login">Entrar</a><b> &#xb7; </b><a href="/register">Register</a>
   			</c:when>
   			<c:when test="${user != null}">  					
        		<a href="/home">Hi, ${user.name.split(" ")[0]}</a><b> &#xb7; </b><a href="/exit">exit</a>
   			</c:when>
   		</c:choose>
    	
    </div>
    
</body>
</html>