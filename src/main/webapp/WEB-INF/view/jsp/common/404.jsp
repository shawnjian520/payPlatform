<%@ page language="java" pageEncoding="UTF-8" session="false" isErrorPage="true"%>
<%@page import="com.jd.util.ClientUtil" %>
<%@ page import="com.jd.util.os.EPlatform" %>
<%@ page import="com.jd.util.os.OSinfo" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + request.getContextPath();
    String mainProjectUrl = ClientUtil.getString("node.main.url");
    boolean debug = false;
    if (EPlatform.Mac_OS.equals(OSinfo.getOSname()) || EPlatform.Mac_OS_X.equals(OSinfo.getOSname()) || EPlatform.Windows.equals(OSinfo.getOSname())) {
        debug = true;
    }
%>
<!DOCTYPE html> 
<html lang="en">
<!-- start: HEAD -->
<head>
<title>网络繁忙</title>
<%@include file="other/meta.jsp" %>
<%@include file="plugins/css/bootstrap.jsp" %>
<%@include file="plugins/css/frame.jsp" %>
<%@include file="plugins/css/sweetalert.jsp" %>
<%@include file="plugins/css/frame.jsp" %>
<style>
    .c-other{padding-left: 140px;font-family:"Microsoft YaHei";background:url(<%=mainProjectUrl%>/resources/images/c_other01.png) no-repeat left center;width: 370px;margin:200px auto 0 auto;}
    .c-other .c-other-top1{color:#afb5bf;font-size:70px;line-height:1.4em;}
    .c-other .c-other-top2{color:#afb5bf;font-size:18px;line-height:1.4em;}
    .c-other .c-other-top3{background-color:#afb5bf;color:white;font-size:15px;}
    .c-other2{text-align:center;padding-left: 140px;font-family:"Microsoft YaHei";background:url(<%=mainProjectUrl%>/resources/images/c_other01.png) no-repeat left center;width: 370px;margin:20px auto 0 auto;}
    .c-other2 .c-other-top1{color:#afb5bf;font-size:70px;line-height:1.4em;}
    .c-other2 .c-other-top2{color:#afb5bf;font-size:18px;line-height:1.4em;}
    .c-other2 .c-other-top3{background-color:#afb5bf;color:white;font-size:15px;}
</style>
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body class="single-page">
<div class="container">
    <%
        if (debug) {
    %>
    <br/><br/><br/>
    <p><b>Error code:</b> ${pageContext.errorData.statusCode}</p>
    <p><b>Request URI:</b> ${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}</p>
    <div id="error-info-404">
        尝试加载${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}发生异常(${pageContext.errorData.statusCode})
    </div>
    <%
    } else {
    %>
    <div class="c-other">
        <div class="c-other-top1">:(</div>
        <div class="c-other-top2" id="error-info-404">网络繁忙，请稍后重试~</div>
        <br/>
    </div>
    <%
        }
    %>
</div>
<%@include file="plugins/js/bootstrap.jsp" %>
<%@include file="plugins/js/sweetalert.jsp" %>
<script>
    $(document).ready(function () {
        $('body',window.parent.document).addClass('loaded');
        console.log('<%out.print("节点:" + request.getLocalAddr() + ":" + request.getLocalPort());%>');
    });
</script>
</body>
</html>