<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Where's</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="body" style="margin: 0px">
	
	<center>
	<jsp:include page="header.jsp" />
	
	<div style="width: 80%; display: table; background-color: #fafafb; border: 1px solid #DDD; margin-top: 25px"> 
	<c:choose>
		<c:when test="${feature == 'index'}">
        	<jsp:include page="index.jsp" />
   		</c:when>
		<c:when test="${feature == 'home'}">
        	<jsp:include page="home.jsp" />
   		</c:when>
   		<c:when test="${feature == 'login'}">
        	<jsp:include page="login.jsp" />
   		</c:when>
   		<c:when test="${feature == 'about-us'}">
        	<jsp:include page="about-us.jsp" />
   		</c:when>
   		<c:when test="${feature == 'privacy-policy'}">
        	<jsp:include page="privacy-policy.jsp" />
   		</c:when>  
    	<c:otherwise>
        	<jsp:include page="not-found.jsp" />
    	</c:otherwise> 	
	</c:choose>
	</div>
	
	<jsp:include page="footer.jsp" />
	</center>
	
</body>
</html>