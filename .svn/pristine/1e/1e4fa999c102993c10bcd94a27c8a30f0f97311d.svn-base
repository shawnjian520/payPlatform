<%@page import="com.jd.system.util.LoginUtil"%>
<%@page import="com.jd.util.CacheEnum"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jd.support.cache.CacheUtils" %>
<%@ page import="com.jd.system.entity.TSysInit" %>
<!DOCTYPE html>
<html lang="en">
<!-- start: HEAD -->
<head>
<%
    String _basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
    boolean stageMenu = "1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getStagemenu());
    boolean tabModel = "1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getTabModels());
    request.setAttribute("ys_LoginUser", LoginUtil.getloginuser(request));
%>
<title><%=((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getSfmc() %></title>
<%@include file="meta.jsp" %>
<!-- str: 主要css -->
<%@include file="../plugins/css/bootstrap.jsp" %>
<!-- end: 主要css -->
<!-- start: 插件 css -->
<%@include file="../plugins/css/font-awesome.jsp" %>
<%@include file="../plugins/css/animate.jsp" %>
<%@include file="../plugins/css/sweetalert.jsp" %>
<!-- end: 插件 css -->
<%@include file="../plugins/css/frame.jsp" %>
<script>
    var basePath = '<%=_basePath%>';
    var nodePath = '<%=_basePath%>';
    var stageMenu = <%=stageMenu%>;//分阶段菜单
    var tabModel = <%=tabModel%>;//是否启用Tab页
</script>
</head>
<!-- start: body -->
<body class="single-page">