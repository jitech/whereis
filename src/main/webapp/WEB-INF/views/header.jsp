<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    
    <div style="width: 100%; display: table; background-color: #FFF; border-top: 3px solid #F48024;position: fixed;
    top:0; left: 0; background-image: url('https://cdn.sstatic.net/img/hero/pattern.svg?v=13ca42e6c21d'); box-shadow: 0 1px 0 rgba(12,13,14,0.1), 0 1px 6px rgba(59,64,69,0.1);
    ">
    	
    	<div style="display: table; width: 80%">

    		<div style="display: table; float: left; margin: 15px;">
    			<a href="/index" style="letter-spacing: -2.5px; font-size: 22px; font-weight: bold; margin-right: 35px">
    				<img src="images/icon.svg" width="18.5px">I loveMyCode
    			</a>	   			
    		</div>

    		<div style="display: table; float: right; margin: 20px">   			
    			<c:choose>
					<c:when test="${user == null}">
        				<a href="/login">Entrar</a>
        				<b> &#xb7; </b>
        				<a href="/register">Register</a>
   					</c:when>
   					<c:when test="${user != null}">  					
        				<a href="/home">Hi, ${user.name.split(" ")[0]}</a>
        				<b> &#xb7; </b>
        				<a href="/exit">exit</a>
   					</c:when>
   				</c:choose>
    		</div>
    	</div>
    	
    </div>
    
</body>
</html>