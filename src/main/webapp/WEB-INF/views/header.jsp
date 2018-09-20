<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Header</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="body" style="margin: 0px">
    
    <div style="border-bottom: 1px solid #DDD; width: 100%; display: table; background-color: #fafafb; border-top: 3px solid #F48024">
    	
    	<center>
    	<div style="display: table; width: 80%">
    		<div style="display: table; float: left; margin: 15px">
   				<c:if test="${user != null}">
   				Hello, ${user.name}
   				</c:if>
    		</div>
    	
    		<div style="display: table; float: right; margin: 15px">   		
    			<c:if test="${user != null}">
    				<a href="/exit">Exit</a>
    			</c:if>		
    		</div>
    	
    		<div style="display: table; float: right; margin: 15px;">
    			About us | Privacy policy | Terms of use
    		</div>
    	</div>
    	</center>
    	
    </div>
    
</body>
</html>