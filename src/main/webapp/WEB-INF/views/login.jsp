<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="body">
    
    <form action="/index" method="post">
    	<input type="text" id="email" name="email" value="jgm.melo@uol.com.br"/>
    	<input type="password" id="password" name="password" value="123"/>
    	<button type="submit" class="button">Entrar</button>
    </form>
    
    ${message}
    
    <jsp:include page="footer.jsp" />
    
</body>
</html>