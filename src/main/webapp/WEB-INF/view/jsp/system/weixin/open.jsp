<%@page import="com.jd.util.ClientUtil"%>
<%@page import="com.jd.framework.util.ConfigUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script>
window.open('<%=ClientUtil.getString("node.main.weixin.url")%>');
</script>