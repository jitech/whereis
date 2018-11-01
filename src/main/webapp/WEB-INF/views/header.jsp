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
    top:0; left: 0; padding-top: 18px; padding-bottom: 18px; box-shadow: 0 4px 12px 0 rgba(0,0,0,.05)!important;">
    	
    	<c:choose>
			<c:when test="${user == null}">
        		<a href="/index" style="letter-spacing: -3.5px; font-size: 36px; font-weight: bold; margin-right: -100px">I loveMyCode</a>
   			</c:when>
   			<c:when test="${user != null}">  					
        		<a href="/home" style="letter-spacing: -3.5px; font-size: 36px; font-weight: bold; margin-right: -100px">I loveMyCode</a>
   			</c:when>
   		</c:choose>
    	
    	 	
    	<div style="float: right; margin-right: 15px; margin-top: 12px">
    	<c:choose>
			<c:when test="${user == null}">
        		<a href="/login">Entrar</a><b> &#xb7; </b><a href="/register">Register</a>
   			</c:when>
   			<c:when test="${user != null}">  					
        		<a href="/exit" style="letter-spacing: -0.6px;">exit</a>
   			</c:when>
   		</c:choose>
   		</div>
    	
    </div>
    
</body>
</html>