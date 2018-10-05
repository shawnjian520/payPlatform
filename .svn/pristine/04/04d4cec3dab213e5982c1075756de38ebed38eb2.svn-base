<%@page import="com.jd.util.ClientUtil"%> 
<%@ page language="java" pageEncoding="UTF-8" session="false" isErrorPage="true"%>
<%
String mainProjectUrl = ClientUtil.getString("node.main.url");
%>
<%@include file="../../common/other/header.jsp" %>
<title>认证失败</title>
<%@include file="../../common/other/meta.jsp" %>
<%@include file="../../common/plugins/css/bootstrap.jsp" %>
<%@include file="../../common/plugins/css/frame.jsp" %>
<style>

    .c-other{padding-left: 140px;height:120px;font-family:"Microsoft YaHei";background:url(<%=mainProjectUrl%>/resources/images/c_other01.png) no-repeat left center;width: 370px;margin:200px auto 0 auto;}
    .c-other .c-other-top2{color:#afb5bf;font-size:18px;padding-top: 40px;}
</style>
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body class="single-page">
<div class="container">
    <div class="c-other">
        <div class="c-other-top2" id="error-message">还未绑定身份或者权限认证失败</div>
    </div>
</div>
<%@include file="../../common/plugins/js/bootstrap.jsp" %>

</body>
</html>