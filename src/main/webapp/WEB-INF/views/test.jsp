<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="body">

	<div style="border: 1px solid #DDD; width: 80%; text-align: left; display: table; margin-top: 15px; padding: 15px; background-color: #fafafb">			
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 22px; display: table; margin-top: 10px">
			${test.name}
		</div>	
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 10px">
			${test.describe}
		</div>	
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#10004; The class represented in the diagram is mandatory, but nothing prevents more classes from being created during encoding.
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#10004; Code and generate a .jar. You can use eclipse or another ide of your own.
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 10px">
			<img src="images/tax-test.png">
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 15px">
			<form action="/upload" method="POST" enctype="multipart/form-data" style="width: 250px;">  
				<label for="file">Selecionar .jar</label>
				<input type="file" id="file" name="file" accept="jar/*">
 				<input type="submit" name="submit" value="Enviar"/>
			</form>
			<form action="/send" method="post">
				<label for="file">Selecionar .jar</label>
				<input type="file" id="file" name="file" accept="jar/*">
				<button style="background-color: #4c89e3; border: 1px solid #4c89e3;font-family: 'Roboto Condensed', sans-serif; font-size: 18px; color: #FFF; padding: 8px; float: right; margin: 4px">Send code</button>
			</form>
			<button style="background-color: #dd4b39; border: 1px solid #dd4b39;font-family: 'Roboto Condensed', sans-serif; font-size: 18px; color: #FFF; padding: 8px; float: right; margin: 4px">Leave</button>				
		</div>
	</div>

</body>
</html>