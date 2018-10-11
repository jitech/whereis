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
	</style>
</head>
<body>

 	<c:choose>	
		<c:when test="${message != null}">
			<div id="message" style="border-left: 4px solid #F48024; width: 90%; text-align: left; display: table; margin-top: 15px; padding: 15px; padding-left: 10px; padding-right: 80px; background-color: #EEE; box-shadow: 0 3px 8px 0 rgba(115,143,147,.4);">			
				<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; color: #707070">
					${message}
				</div>
			</div>
		</c:when>
	</c:choose>
	
	<c:choose>
	
		<c:when test="${user.tests != null}">
		<div style="border: 1px solid #eae9e9; width: 90%; text-align: left; display: table; margin-top: 15px; margin-bottom: 55px; padding: 45px; background-color: #f8f8f8; box-shadow: 0 3px 8px 0 rgba(115,143,147,.4);">			
			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 24px; display: table; margin-top: 0px; letter-spacing: -0.5px">
				${user.name}
			</div>
			
			<div style="display: table; color: #535a60; font-size: 20px; text-align: justify; margin-top: 2px; letter-spacing: -2px">
				<c:choose>
					<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10 and user.loadPercentCodeOK() == 1}">  
						<b style="color: #f4ae01">&#9733;</b> Code well
					</c:when>				
				</c:choose>
			</div>
										
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-size: 16px; display: table; margin-top: 8px; margin-bottom: 20px">
				<div style="width: 97.5%; display: table; color: #707070; float: left; margin: 2.5px; border-radius: 4px">"I'm Java Developer at 2010. My expertise are Spring MVC and microservices with spring boot, Mongo DB and Maria DB"</div>				
			</div>
							
			<div class="flex-wrapper">
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
  				</div>
  				<div class="single-chart" style="border-left: 1px solid #eae9e9">
    				<svg viewbox="0 0 36 36" class="circular-chart red">
      					<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      					<path class="circle" stroke-dasharray="${100 - user.loadPercentCodeOK()*100}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      					<text x="18" y="18.35" class="percentage">
      						<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${100 - user.loadPercentCodeOK()*100}"/>
      					</text>
      					<text x="18" y="21.40" class="text">CODE DOES NOT DO</text>
      					<text x="18" y="23.60" class="text">WHAT IT SHOULD</text>
    				</svg>
  				</div>
  				<div class="single-chart" style="border-left: 1px solid #eae9e9">
    				<c:choose>
						<c:when test="${user.loadTotalComplexity() > 0 and user.loadTotalComplexity() <= 10}">  
							<svg viewbox="0 0 36 36" class="circular-chart green">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadTotalComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage"><fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${user.loadTotalComplexity()}"/>/50</text>
      							<text x="18" y="21.40" class="text">CODE WITH LOW</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
    						</svg>
						</c:when>					
						<c:when test="${user.loadTotalComplexity() > 10 and user.loadTotalComplexity() <= 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart orange">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadTotalComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage"><fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${user.loadTotalComplexity()}"/>/50</text>
      							<text x="18" y="21.40" class="text">CODE WITH MEDIUM</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
						</c:when>
						<c:when test="${user.loadTotalComplexity() > 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart red">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadTotalComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
								<text x="18" y="18.35" class="percentage"><fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${user.loadTotalComplexity()}"/>/50</text>
      							<text x="18" y="21.40" class="text">CODE WITH HIGH</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>						
      						</svg>
						</c:when>							
					</c:choose>
  				</div>
			</div>

		</div>	
		</c:when>
		
	</c:choose>
	
	<c:choose>
	
		<c:when test="${test != null}">      	
		<div style="border: 1px solid #eae9e9; width: 90%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #f8f8f8; box-shadow: 0 3px 8px 0 rgba(115,143,147,.4);
		">				
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 24px; display: table; margin-top: 10px; color: #464646; letter-spacing: -0.5px">
				<b>You still have a code to deliver!</b>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 10px; color: #464646">
				<form action="/test" method="post">
					<button style="background-color: #f4ae01; border: 1px solid #f4ae01;font-family: 'Roboto Condensed', sans-serif; font-size: 24px; color: #FFF; padding: 8px; margin: 4px">
					Continue the test &#62;
					</button>
				</form>
			</div>
		</div>
   		</c:when>
   		
		<c:when test="${test == null}">
		<form action="/test" method="post">
		<div style="border: 1px solid #eae9e9; width: 90%; text-align: left; display: table; margin-top: 18px; padding: 45px; background-color: #f8f8f8;box-shadow: 0 3px 8px 0 rgba(115,143,147,.4);
		">			
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 30px; display: table; margin-top: 10px; color: #464646; letter-spacing: -0.5px">
				<b>Show companies that you are a great java developer!</b>
			</div>
			<div style="width: 100%; font-size: 18px; display: table; margin-top: 5px; color: #707070; letter-spacing: -0.5px">
				<center>
				Development teams are looking for developers to create quality codes!
				</center>
			</div>
			<div style="border: 0px solid #DDD; width: 100%; text-align: center; font-size: 20px; display: table; margin-top: 30px;">	
				<button style="background-color: #4c89e3; border: 1px solid #4c89e3;font-family: 'Roboto Condensed', sans-serif; font-size: 20px; color: #FFF; padding: 12px; margin: 4px; letter-spacing: -0.8px; width: 200px">START NOW</button>
			</div>
		</div>
		</form>
		</c:when>
		
	</c:choose>
	
</body>
</html>