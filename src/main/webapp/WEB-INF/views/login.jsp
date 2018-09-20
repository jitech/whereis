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
    
    <jsp:include page="header.jsp" />
    
    <center>
    <div style="border: 1px solid #DDD; width: 70%; display: table; margin-top: 15px; background-color: #fafafb; padding-bottom: 30px">
			
		<form action="/index" method="post">
		<div style="width: 100%; text-align: center; display: table; margin-top: 20px">
			Entre e use!
		</div>
		<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">			
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<input type="text" id="email" name="email" class="input-login" placeholder="E-mail"/>
			</div>
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<input type="password" id="password" name="password" class="input-login" placeholder="password" />
			</div>
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<button type="submit" class="button">Sign in</button>
			</div>	
		</div>
		<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 5px">
			${message}
		</div>
		</form>		

	</div>
	</center>
	
	<jsp:include page="footer.jsp" />
     
</body>
</html>