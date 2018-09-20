<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Create</title>
</head>
<body class="body">

	<jsp:include page="header.jsp" />

	<form action="/create-user-test" method="post">
    	<div style="display: table">
    		Clique em "Ir para o teste" para iniciar.
    	</div>
    	<button type="submit" class="button">Ir para o teste</button>
    </form>
    
    <jsp:include page="footer.jsp" />

</body>
</html>