<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	Hello! ${user.name}
	<ul>
  		<li><a href="/test/create">Create Test</a></li>
  		<li><a href="/user/list">Users</a></li>
  		<li><a href="/exit">Exit</a></li>
	</ul>
	
	<c:forEach var="user" items="${users}">
		
		Report for user: <b>${user.name}</b> 
		<br/>
	
		<c:forEach var="test" items="${user.tests}">
		
			<c:choose>
    			<c:when test="${test.complexity >= 1 && test.complexity <= 10}">
					<p>It's very good code!</p>
    			</c:when>  
    			<c:when test="${test.complexity >= 11 && test.complexity <= 21}">
					<p>It's medium good code!</p>
    			</c:when>    
    			<c:when test="${test.complexity >= 21 && test.complexity <= 50}">
					<p>It's bad code!</p>
    			</c:when> 
    			<c:when test="${test.complexity > 50}">
					<p>It's very bad code!</p>
    			</c:when> 
			</c:choose>
			
			<c:choose>
    			<c:when test="${test.status == 'OK'}">
					<p>The algorithm does what needs to be done!</p>
    			</c:when>  
    			<c:when test="${test.status == 'NOK'}">
					<p>The algorithm does't what needs to be done!</p>
    			</c:when>  
			</c:choose>
			
		</c:forEach>
	</c:forEach>

</body>
</html>