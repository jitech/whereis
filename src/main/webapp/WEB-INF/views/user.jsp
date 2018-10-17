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
	
		<c:when test="${in.tests != null}">
		<div style="border: 1px solid #eae9e9; width: 60%; text-align: left; display: table; margin-top: 15px; padding: 45px; background-color: #fff; box-shadow: 0 3px 8px 0 rgba(115,143,147,.4);">
			
			<div style="border: 0px solid #DDD; width: 100%; text-align: left; font-weight: bold; font-size: 26px; display: table; margin-top: 0px; letter-spacing: -0.5px">
				${in.name}
			</div>
			
			<div style="display: table; color: #858C93; font-size: 16px; text-align: justify; margin-top: 0px; letter-spacing: -0.5px">			
				Number of coded features: ${in.tests.size()}
			</div>
			
			<div style="display: table; color: #535a60; font-size: 20px; text-align: justify; margin-top: 4px; letter-spacing: -2px">
				<c:choose>
					<c:when test="${in.loadTotalComplexity() > 0 and in.loadTotalComplexity() <= 10 and in.loadPercentCodeOK() == 1}">  
						<b style="color: #f4ae01">&#9733;</b> Codes very well
					</c:when>				
				</c:choose>
			</div>
												
			<div class="flex-wrapper">
				<div class="single-chart">
    				<svg viewbox="0 0 36 36" class="circular-chart orange">
      					<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      					<path class="circle" stroke-dasharray="${in.loadPercentCodeOK()*100}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      					<text x="18" y="18.35" class="percentage">
      						<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${in.loadPercentCodeOK()}"/>
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
						<c:when test="${in.loadTotalComplexity() > 0 and in.loadTotalComplexity() <= 10}">  
							<svg viewbox="0 0 36 36" class="circular-chart green">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${in.loadTotalComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage"><fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${in.loadTotalComplexity()}"/>/50</text>
      							<text x="18" y="21.40" class="text">CODE WITH LOW</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
    						</svg>
						</c:when>					
						<c:when test="${in.loadTotalComplexity() > 10 and in.loadTotalComplexity() <= 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart orange">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${in.loadTotalComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage"><fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${in.loadTotalComplexity()}"/>/50</text>
      							<text x="18" y="21.40" class="text">CODE WITH MEDIUM</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
						</c:when>
						<c:when test="${in.loadTotalComplexity() > 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart red">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${in.loadTotalComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
								<text x="18" y="18.35" class="percentage"><fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${in.loadTotalComplexity()}"/>/50</text>
      							<text x="18" y="21.40" class="text">CODE WITH HIGH</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>						
      						</svg>
						</c:when>							
					</c:choose>
					<center>
					<div style="display: table; color: #858C93; font-size: 14px; text-align: justify; margin-top: 0px; letter-spacing: -0.5px; margin-top: 35px; margin-left: 25px">			
						&#10004; The lower the score, the better the code
					</div>		
					</center>				
  				</div>
			</div>

		</div>	
				 
		</c:when>
		
	</c:choose>	
	
</body>
</html>