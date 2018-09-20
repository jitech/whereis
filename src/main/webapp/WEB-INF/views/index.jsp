<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Início</title>
</head>
<body class="body">

	<jsp:include page="header.jsp" />

	<div style="display: table; width: 100%; margin-bottom: 10px; border: 1px solid #DDD">
    	<div style="display: table; width: 100%; float: left; font-size: 13px; margin: 15px">
    		
			<center>
			
			<div style="border: 1px solid #DDD; padding: 1px; width: 490px; display: table">		
				<form action="/search-user" method="post">			
    				<input type="text" id="email" name="email" value="jgm.melo@uol.com.br" placeholder="Coloque o e-mail aqui" class="input-search" style="height: 40px; width: 416.5px; float: left; border: 0px; margin-left: 8px"/>
    				<button type="submit" class="button" style="height: 42px; float: left">Buscar</button>  			
    			</form>
    		</div>
    		
    		<div style="border: 1px solid #DDD; padding: 1px; width: 490px; display: table">
    			<form action="/create-user-test" method="get">
    				<input type="text" id="email" name="email" value="jgm.melo@uol.com.br" placeholder="Coloque seu e-mail aqui" class="input-search" style="height: 40px; width: 384.7px; float: left; border: 0px; margin-left: 8px"/>  				
    				<button type="submit" class="button" style="height: 42px; float: left">Create Test</button>
    			</form>
    		</div>	
    			
    		</center>
    		
    		<br/><br/>
    		
    		<c:forEach var="user" items="${users}">
				
			<c:choose>
    			<c:when test="${user.tests.size() > 0}">
    					
    				<div style="display: table; width: 100%">			
						<b>NÚMERO DE TESTES FEITOS:</b> ${user.tests.size()}
					</div>
					
					<c:choose>
    					<c:when test="${user.loadTotalComplexity() >= 1 && user.loadTotalComplexity() <= 10}">
							<p>&#10004; Em geral possui métodos simples, baixa complexidade e baixo risco.</p>
    					</c:when>  
    					<c:when test="${user.loadTotalComplexity() >= 11 && user.loadTotalComplexity() <= 21}">
							<p>Em geral possui métodos razoavelmente complexos, moderada complexidade e moderado risco.</p>
    					</c:when>    
    					<c:when test="${user.loadTotalComplexity() >= 21 && user.loadTotalComplexity() <= 50}">
							<p>Em geral possui métodos muito complexos, alta complexidade e elevado risco.</p>
    					</c:when> 
    					<c:when test="${user.loadTotalComplexity() > 50}">
							<p>Em geral possui métodos de altíssima complexidade, altíssima complexidade e bastante instável.</p>
    					</c:when>				
					</c:choose>
					
					<c:choose>
    					<c:when test="${user.loadTestNOK() > 0}">
							<p>&#10004; ${user.loadTestNOK()/user.tests.size() * 100}% dos testes não tiveram seus requisitos atendidos.</p>
    					</c:when>
    					<c:when test="${user.loadTestNOK() == 0}">
							<p>&#10004; Todas os testes atenderam os requisitos especificados.</p>
    					</c:when>				
					</c:choose>
					
				</c:when>
			</c:choose>
		
		</c:forEach>
    		
    	</div>
    </div>

	<jsp:include page="footer.jsp" />

</body>
</html>