<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- start: 框架 css -->
<%--<link rel="stylesheet" href="${ctx}/resources/css/styles.css">--%>
<link rel="stylesheet" href="${ctx}/resources/css/styles.css">
<link rel="stylesheet" href="${ctx}/resources/css/styles-responsive.css">
<link rel="stylesheet" href="${ctx}/resources/css/themes/theme-default.css" type="text/css" id="skin_color">
<!-- end: 框架 css -->
<!--[if lt IE 9]>
<script src="${ctx}/resources/plugins/jQuery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/resources/plugins/respond.min.js"></script>
<script src="${ctx}/resources/plugins/excanvas.min.js"></script>
<link rel="stylesheet" href="${ctx}/resources/css/ie8-patch.css">
<![endif]-->
<!--[if lt IE 10]>
<link rel="stylesheet" href="${ctx}/resources/css/ie9-patch.css">
<![endif]-->
<!--[if gte IE 9]><!-->
<script src="${ctx}/resources/plugins/jQuery/jquery-2.1.1.min.js"></script>
<!--<![endif]-->
