<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- start: 必要脚本 -->
<%@include file="../plugins/js/bootstrap.jsp" %>
<%@include file="../plugins/js/jquery.cookie.jsp" %>
<%@include file="../plugins/js/blockUI.jsp" %>

<!-- end: 必要脚本 -->
<!-- 弹出框 -->
<%@include file="../plugins/js/sweetalert.jsp" %>
<!-- 移动端 -->
<%@include file="../plugins/js/touchSwipe.jsp" %>
<%@include file="../plugins/js/jquery.velocity.jsp" %>
<!-- 框架 -->
<%@include file="../plugins/js/frame.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/css/plugins.css">
</body>
<!-- end: BODY -->
</html>