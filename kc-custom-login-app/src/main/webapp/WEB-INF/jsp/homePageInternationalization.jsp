<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
 
<!DOCTYPE html>
 
<html>
<head>
 
<meta charset="UTF-8">
 
</head>
<body>
 
    <div style="text-align: right;padding:5px;margin:5px 0px;background:#ccc;">
       <a href="${pageContext.request.contextPath}/homePageInternationalization?lang=en">English</a>
       &nbsp;|&nbsp;
       <a href="${pageContext.request.contextPath}/homePageInternationalization?lang=indic">Hindi</a>
       &nbsp;|&nbsp;
    </div>
 
   <spring:message code="label.homePageWithChart.dashBoardHeading" />
</body>
</html>