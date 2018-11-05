<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<style type="text/css">
		.flex-wrapper {
  display: flex;
  flex-flow: row nowrap;
}

.single-chart {
  width: 100%;
  justify-content: space-around ;
}

.circular-chart {
  display: block;
  margin: 15px auto;
  max-width: 100%;
  max-height: 200px;
}

.circle-bg {
  fill: none;
  stroke: #eee;
  stroke-width: 3.8;
}

.circle {
  fill: none;
  stroke-width: 2.8;
  stroke-linecap: round;
  animation: progress 1s ease-out forwards;
}

@keyframes progress {
  0% {
    stroke-dasharray: 0 100;
  }
}

.circular-chart.orange .circle {
  stroke: #ff9f00;
}

.circular-chart.green .circle {
  stroke: #4CC790;
}

.circular-chart.red .circle {
  stroke: #dd4b39;
}

.percentage {
  fill: #707070;
  font-family: 'Roboto Condensed', sans-serif;
  font-size: 0.5em;
  text-anchor: middle;
  color: #ff9f00;
}

.range {
  fill: #707070;
  font-family: 'Roboto Condensed', sans-serif;
  font-size: 0.20em;
  text-anchor: middle;
  color: #ff9f00;
}

.text {
  fill: #707070;
  font-family: 'Roboto Condensed', sans-serif;
  font-size: 0.12em;
  text-anchor: middle;
}

.pw-icon-clock:before {
    content: '\e805';
}
	</style>
</head>
<body>

 	<c:choose>	
		<c:when test="${message != null}">			
			<div id="message" style="border: 1px solid #eae9e9; border-left: 3px solid #F48024; width: 100%; text-align: left; display: table; margin-top: 15px; padding: 15px; background-color: #fff;">		
				<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; color: #707070">
					${message}
				</div>
			</div>
		</c:when>
	</c:choose>
	
		<div style="width: 60%; text-align: left; display: table; margin-top: 15px; background-color: #fff;">
			
			<div style="width: 100%; text-align: left; font-size: 32px; margin-bottom: 0px; display: table; color: #464646; letter-spacing: -2px">
				<b>Me, ${user.name}</b>
			</div>
			
			<c:choose>
				<c:when test="${user.tests != null and user.loadPercentComplexity() > 0 and user.loadPercentComplexity() <= 10 and user.loadPercentCodeOK() == 1}"> 
					<div style="display: table; color: #535a60; font-size: 20px; text-align: justify; margin-top: 20px; letter-spacing: -2px;">
						<b style="color: #f4ae01">&#9733;</b> Your code is good
					</div>
				</c:when>
			</c:choose>
					
			<div style="display: table; width: 100%; color: rgba(0,0,0,.54); font-size: 14px; font-weight: normal; float: right; text-align: justify; margin-top: 14px; letter-spacing: -0.8px">
				<c:choose>
					<c:when test="${user.tests != null && user.tests.size() > 0}">
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 20px; display: table; padding: 8px; padding-left: 15px; padding-right: 15px; float: left; margin-right: 6px; letter-spacing: -1px;">
							GOOD JAVA CODE
						</div>
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 20px; display: table; padding: 8px; padding-left: 15px; padding-right: 15px; float: left; margin-right: 6px; letter-spacing: -1px;">
							LAST CODE ON &nbsp; 01/11/2018
						</div>
					</c:when>
					<c:otherwise>					
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 20px; display: table; padding: 8px; padding-left: 12px; padding-right: 12px; float: left; margin-right: 6px; letter-spacing: -1px;">
							No test!
						</div>					
					</c:otherwise>					
				</c:choose>		
				
				<c:choose>  		
   					<c:when test="${test == null}">
   						<div style="background-color: #fff; border: 0px solid #4c89e3; border-radius: 20px; display: table; float: left; margin-right: 6px">						
							<form action="/test" method="post">
								<button style="background-color: #FFF; border-radius: 20px; border: 1px solid #ccc; font-family: 'Roboto Condensed', sans-serif; font-size: 14px; color: #4c89e3; padding: 8px; letter-spacing: -1px; font-weight: bold;">START NOW</button>
							</form>
						</div>
   					</c:when>
   					<c:otherwise>
   						<div style="background-color: #f4ae01; border: 0px solid #f4ae01; border-radius: 20px; display: table; float: left; margin-right: 6px">						
							<form action="/test" method="post">
								<button style="background-color: #f4ae01; border-radius: 20px; border: 1px solid #f4ae01; font-family: 'Roboto Condensed', sans-serif; font-size: 14px; color: #FFF; padding: 8px; letter-spacing: -0.8px;">START NOW</button>
							</form>
						</div>
   					</c:otherwise>
   				</c:choose>
   				
			</div>
			
			<c:choose>
			<c:when test="${user.tests != null}">											
			<div class="flex-wrapper" style="margin-top: 80px; margin-bottom: 30px">
				<div class="single-chart">
    				<svg viewbox="0 0 36 36" class="circular-chart orange">
      					<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      					<path class="circle" stroke-dasharray="${user.loadPercentCodeOK()*100}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      					<text x="18" y="18.35" class="percentage">
      						<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentCodeOK()}"/>
      					</text>
      					<text x="18" y="21.40" class="text">CODE DOES WHAT</text>
      					<text x="18" y="23.60" class="text">IT SHOULD</text>
    				</svg>
    				<center>
    				<div style="display: table; color: #858C93; font-size: 14px; text-align: justify; margin-top: 0px; letter-spacing: -0.5px; margin-top: 35px">			
						&#10004; The higher the percentage, the better
					</div>		
					</center>		
  				</div>
  				<div class="single-chart" style="border-left: 1px solid #eae9e9">
    				<c:choose>
						<c:when test="${user.loadPercentComplexity() > 0 and user.loadPercentComplexity() <= 10}">  
							<svg viewbox="0 0 36 36" class="circular-chart green">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadPercentComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage">
      								<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentComplexity()/100}"/>
      							</text>
      							<text x="18" y="21.40" class="text">CODE WITH LOW</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
    						</svg>
						</c:when>					
						<c:when test="${user.loadPercentComplexity() > 10 and user.loadPercentComplexity() <= 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart orange">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadPercentComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage">
      								<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentComplexity()/100}"/>
      							</text>
      							<text x="18" y="21.40" class="text">CODE WITH MEDIUM</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
						</c:when>
						<c:when test="${user.loadPercentComplexity() > 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart red">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadPercentComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
								<text x="18" y="18.35" class="percentage">
									<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${user.loadPercentComplexity()/100}"/>
								</text>
      							<text x="18" y="21.40" class="text">CODE WITH HIGH</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>						
      						</svg>
						</c:when>							
					</c:choose>
					<center>
					<div style="display: table; color: #858C93; font-size: 14px; text-align: justify; margin-top: 0px; letter-spacing: -0.5px; margin-top: 35px; margin-left: 25px">			
						&#10004; The lower the percentage, the better
					</div>		
					</center>				
  				</div>
			</div>
			</c:when>
			</c:choose>

		</div>
	
</body>
</html>