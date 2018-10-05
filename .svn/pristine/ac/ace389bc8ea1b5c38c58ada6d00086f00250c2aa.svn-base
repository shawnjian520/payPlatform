<%@page import="com.jd.system.entity.TSysProUrl" %>
<%@page import="com.jd.support.cache.CacheUtils" %>
<%@page import="com.jd.util.CacheEnum" %>
<%@page import="com.jd.util.StringUtil" %>
<%@page import="com.jd.util.os.EPlatform" %>
<%@ page import="com.jd.util.os.OSinfo" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String basePath = request.getContextPath();
    List<TSysProUrl> nodes = (List<TSysProUrl>) CacheUtils.get(CacheEnum.chahe_nodes);
    String loginjsp = request.getParameter("loginjsp");
    if (StringUtil.isBlank(loginjsp)) loginjsp = basePath;
%>
退出中...
<%
    for (TSysProUrl node : nodes) {
        String url = "";
        if (EPlatform.Linux.equals(OSinfo.getOSname())) {
            url = node.getServiceurl();
        } else if (EPlatform.Windows.equals(OSinfo.getOSname())) {
            url = node.getUrl();
        } else if (EPlatform.Mac_OS.equals(OSinfo.getOSname()) || EPlatform.Mac_OS_X.equals(OSinfo.getOSname())) {
            url = node.getUrl();
        }
%>
<iframe src="<%=url%>/s/ajax/logout" style="display: none"></iframe>
<%
    }
%>
<script>
    window.location = '<%=loginjsp%>';
</script>