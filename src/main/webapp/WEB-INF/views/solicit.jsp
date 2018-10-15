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
    
    <form action="/reset/solicit" method="post" style="width: 230px; border: 1px solid #eae9e9; padding: 30px; padding-bottom: 50px; margin-top: 100px; background-color: #fff; box-shadow: 0 3px 8px 0 rgba(115,143,147,.4)">   
		<div style="text-align: center; display: table; margin-top: 20px; font-size: 24px; letter-spacing: -2px">
			@Secured("JAVA_EXPERT")
		</div>
		<div style="text-align: center; font-size: 16px; display: table; margin-top: 10px">	
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<input type="text" id="email" name="email" class="input-login" placeholder="email" />
			</div>
			<div style="width: 100%; text-align: center; font-size: 16px; display: table; margin-top: 10px">	
				<button type="submit" class="button" style="width: 100%; background-color: #5fba7d; border: 1px solid #5fba7d">Solicit new password</button>
			</div>	
		</div>
		<div style="text-align: center; font-size: 16px; display: table; margin-top: 5px">
			${message}
		</div>
	</form>	

</body>
</html>