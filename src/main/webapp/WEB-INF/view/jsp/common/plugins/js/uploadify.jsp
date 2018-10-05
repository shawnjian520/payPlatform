<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- 文件上传 -->
<!--[if lt IE 10]>
<script src="${ctx}/resources/plugins/uploadify/jquery.uploadify.min.js"></script>
<![endif]-->
<!--[if gte IE 10]><!-->
<script src="${ctx}/resources/plugins/uploadifive/jquery.uploadifive.min.js"></script>
<!--<![endif]-->