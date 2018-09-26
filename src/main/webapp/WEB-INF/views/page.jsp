<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Where's</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$().ready(function() {
			setTimeout(function () {
				$('#message').hide();
			}, 3500);
		});
	</script>
</head>
<body class="body" style="margin: 0px">
	
	<center>
	<jsp:include page="header.jsp" />
	
	<div style="width: 80%; display: table; margin-top: 105px; margin-bottom: 105px"> 
	<c:choose>
		<c:when test="${feature == 'index'}">
        	<jsp:include page="index.jsp" />
   		</c:when>  		
   		<c:when test="${feature == 'about-us'}">
        	<jsp:include page="about-us.jsp" />
   		</c:when>
   		<c:when test="${feature == 'privacy-policy'}">
        	<jsp:include page="privacy-policy.jsp" />
   		</c:when>  
   		<c:when test="${feature == 'login' and user == null}">
        	<jsp:include page="login.jsp" />
   		</c:when>
   		<c:when test="${feature == 'home' and user != null}">
        	<jsp:include page="home.jsp" />
   		</c:when>
   		<c:when test="${feature == 'test' and user != null and test != null}">
        	<jsp:include page="test.jsp" />
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