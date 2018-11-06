<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div style="width: 90%; text-align: left; display: table; margin-top: 15px; padding: 40px; background-color: #fff;">
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 22px; display: table; margin-top: 10px">
			${test.name}
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 10px; color: #535a60; font-size: 18px">			
			${test.describe}<br/>
		</div>	
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 20px">			
			&#10004; The class represented in the diagram is mandatory, but nothing prevents more classes from being created during encoding.
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 10px">
			&#10004; Code and generate a .jar. You can use ide of your own.
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 15px">
			<img src="images/tax-test.png">
		</div>
		<div style="border: 0px solid #DDD; width: 100%; text-align: left; display: table; margin-top: 15px">
			<form action="/send" method="post" enctype="multipart/form-data">
				<label for="file">Selecionar .jar</label>
				<input type="file" id="file" name="file" accept="jar/*" required>
				<button type="submit" style="background-color: #4c89e3; border: 1px solid #4c89e3;font-family: 'Roboto Condensed', sans-serif; font-size: 18px; color: #FFF; padding: 8px; float: right; margin: 4px;">Send code</button>
			</form>
		</div>
	</div>

</body>
</html>