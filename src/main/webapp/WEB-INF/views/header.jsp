<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Header</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="body">
    
    <div style="display: table; width: 100%; margin-bottom: 10px; border: 1px solid #DDD">
    	<div style="display: table; float: left; margin: 15px">
    		Hello, ${user.name}
    	</div>
    	<div style="display: table; float: right; margin: 15px">
    		<a href="/exit">Exit</a>
    	</div>
    </div>
    
</body>
</html>