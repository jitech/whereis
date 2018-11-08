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

.circular-chart.blue .circle {
  stroke: #6db33f;
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
			<div id="message" style="box-shadow: -2px 0 #F48024; width: 60%; text-align: left; display: table; margin-top: 15px; margin-bottom: 25px; padding: 15px; background-color: #FFF8DC; color: #707070; text-align: left;">		
				${message}
			</div>
		</c:when>
	</c:choose>
	
		<div style="width: 60%; text-align: left; display: table; margin-top: 15px; background-color: #fff;">
			
			<div style="width: 100%; text-align: left; font-size: 32px; margin-bottom: 0px; display: table; color: #464646; letter-spacing: -2px">
				<b>Me, ${user.name}</b>
			</div>
			
			<div style="width: 100%; text-align: left; font-size: 14px; margin-bottom: 0px; display: table; color: rgba(0,0,0,.54); letter-spacing: -1px">
				member since <fmt:formatDate value="${user.include}" pattern="yyyy/MM/dd" />
			</div>
					
			<div style="display: table; width: 100%; color: rgba(0,0,0,.54); font-size: 14px; font-weight: normal; float: right; text-align: justify; margin-top: 20px; letter-spacing: -0.8px">
				<c:choose>
					<c:when test="${user.tests != null && user.tests.size() > 0}">
						
						<c:choose>
							<c:when test="${user.tests != null and user.loadPercentComplexity() > 0 and user.loadPercentComplexity() <= 10 and user.loadPercentCodeOK() == 1}">
								<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 7px; display: table; padding: 9px; padding-left: 15px; padding-right: 15px; float: left; margin-right: 6px; letter-spacing: -1px;">
									<b style="color: #ff9f00">&#x2605;</b> Your code is good
								</div>
							</c:when>
						</c:choose>
						
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 7px; display: table; padding: 10px; padding-left: 15px; padding-right: 15px; float: left; margin-right: 6px; letter-spacing: -1px;">
							Points <fmt:formatNumber type = "number" maxIntegerDigits="8" maxFractionDigits="0" value = "${((user.loadQuantityCodeOK() * 1000 * user.loadPercentCodeOK()) / user.loadPercentComplexity())}"/>
						</div>
						
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 7px; display: table; padding: 10px; padding-left: 15px; padding-right: 15px; float: left; margin-right: 6px; letter-spacing: -1px;">
							Coded ${user.tests.size()} feature(s)
						</div>
						
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 7px; display: table; padding: 10px; padding-left: 15px; padding-right: 15px; float: left; margin-right: 6px; letter-spacing: -1px;">
							Last code on <fmt:formatDate value="${user.tests.get(user.tests.size()-1).date}" pattern="yyyy/MM/dd" />
						</div>

					</c:when>
					<c:otherwise>					
						<div style="background-color: #fff; border: 1px solid #ccc; border-radius: 7px; display: table; padding: 10px; padding-left: 12px; padding-right: 12px; float: left; margin-right: 6px; letter-spacing: -1px;">
							No code!
						</div>					
					</c:otherwise>					
				</c:choose>	
			</div>
			
			<c:choose>
			<c:when test="${user.tests != null}">											
			<div class="flex-wrapper" style="margin-top: 120px; margin-bottom: 30px">
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
							<svg viewbox="0 0 36 36" class="circular-chart blue">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadPercentComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<text x="18" y="18.35" class="percentage">
      								<fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${user.loadPercentComplexity()}"/>
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
      								<fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${user.loadPercentComplexity()}"/>
      							</text>
      							<text x="18" y="21.40" class="text">CODE WITH MEDIUM</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>
						</c:when>
						<c:when test="${user.loadPercentComplexity() > 20}">  
							<svg viewbox="0 0 36 36" class="circular-chart red">
      							<path class="circle-bg" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
      							<path class="circle" stroke-dasharray="${user.loadPercentComplexity()}, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"/>
								<text x="18" y="18.35" class="percentage">
									<fmt:formatNumber type = "number" maxIntegerDigits="3" value = "${user.loadPercentComplexity()}"/>
								</text>
      							<text x="18" y="21.40" class="text">CODE WITH HIGH</text>
      							<text x="18" y="23.60" class="text">COMPLEXITY</text>						
      						</svg>
						</c:when>							
					</c:choose>
					<center>
					<div style="display: table; color: #858C93; font-size: 14px; text-align: justify; margin-top: 0px; letter-spacing: -0.5px; margin-top: 35px; margin-left: 25px">			
						&#10004; The lower the score, the better
					</div>		
					</center>				
  				</div>
			</div>
			</c:when>
			</c:choose>

			<center>
			<c:choose>  		
   				<c:when test="${test == null}">
   					<div style="background-color: #fff; border: 0px solid #4c89e3; border-radius: 15px; display: table; margin-top: 150px;">						
						<form action="/test" method="post">
							<button style="background-color: #6db33f; border: 1px solid #6db33f; font-family: 'Roboto Condensed', sans-serif; font-size: 18px; color: #FFF; padding: 15px; padding-left: 45px; padding-right: 45px; font-weight: bold; box-shadow: 0 4px 12px 0 rgba(0,0,0,.20)!important;">TAKE A TEST &#x2771;</button>
						</form>
					</div>
   				</c:when>
   				<c:otherwise>
					<div style="background-color: #fff; border: 0px solid #4c89e3; border-radius: 15px; display: table; margin-top: 150px">						
						<form action="/test" method="post">
							<button style="background-color: #f4ae01; border: 1px solid #f4ae01; font-family: 'Roboto Condensed', sans-serif; font-size: 18px; color: #FFF; padding: 15px; padding-left: 45px; padding-right: 45px; font-weight: bold; box-shadow: 0 4px 12px 0 rgba(0,0,0,.20)!important;"><i class="fa fa-file-code-o"></i> &nbsp; BACK TO THE TEST</button>
						</form>
					</div>
   				</c:otherwise>
   			</c:choose>
   			</center>

		</div>
	
</body>
</html>