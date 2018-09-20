<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    
	<form action="/home" method="post">
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

</body>
</html>