<%@ include file="/static-resources/common/taglibs.jsp"%>

<page:applyDecorator name="default">

<head>
    <title><fmt:message key="404.title"/></title>
    <meta name="heading" content="<fmt:message key='404.title'/>"/>
</head>

<p>
    <fmt:message key="404.message">
        <fmt:param><c:url value="/ums/mainPage.html"/></fmt:param>
    </fmt:message>
</p>

</page:applyDecorator>