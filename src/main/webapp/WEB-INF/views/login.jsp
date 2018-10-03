<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    
	<form action="/home" method="post" style="width: 230px; background-color: #fafafb; border: 2px dashed #DDD; padding: 30px; padding-bottom: 50px; margin-top: 100px">
		<div style="text-align: center; display: table; margin-top: 20px; font-size: 24px; letter-spacing: -2px">
			@Secured("JAVA_EXPERT")
		</div>
		<div style="text-align: center; font-size: 16px; display: table; margin-top: 10px">			
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<input type="text" id="email" name="email" class="input-login" placeholder="e-mail"/>
			</div>
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<input type="password" id="password" name="password" class="input-login" placeholder="password" />
			</div>
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<button type="submit" class="button" style="width: 100%;">Sign in</button>
			</div>	
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<a href="/solicit">Forgot password?</a>
			</div>
		</div>
		<div style="text-align: center; font-size: 16px; display: table; margin-top: 5px">
			${message}
		</div>
	</form>

</body>
</html>