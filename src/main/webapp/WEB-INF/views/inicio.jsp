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
  		<li>Testes feitos: ${user.tests}</li>
  		<li><a href="/exit">Exit</a></li>
	</ul>
	
</body>
</html>