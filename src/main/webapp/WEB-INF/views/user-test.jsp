<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Detail</title>
</head>
<body class="body">

	<jsp:include page="header.jsp" />

	<div style="display: table; width: 100%">
		<div style="display: table; width: 95%; text-align: left; margin: 2px">
			${test.name}
		</div>
		<div style="display: table; width: 95%; text-align: left; margin: 2px">
			${test.describe}
		</div>
		<div style="display: table; width: 95%; text-align: left; margin: 2px">
			<form action="/update-user-test" method="post" enctype="multipart/form-data" style="width: 250px;">
				<input type="hidden" id="test" name="test" value="${test.code}">  
				<label for="file">Selecionar .jar</label>
				<input type="file" id="file" name="file" accept="jar/*">
 				<input type="submit" name="submit" value="Enviar" class="button"/>
			</form>
		</div>	
	</div>
	
	<jsp:include page="footer.jsp" />

</body>
</html>