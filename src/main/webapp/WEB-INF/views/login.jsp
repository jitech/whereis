<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logar</title>
</head>
<body>
    
    <form action="/inicio" method="post">
    	<input type="text" id="email" name="email" value="jgm.melo@uol.com.br"/>
    	<input type="password" id="password" name="password" value="123"/>
    	<button type="submit">Entrar</button>
    </form>
    
    ${message}
    
</body>
</html>