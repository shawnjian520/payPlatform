<%@page import="com.jd.identity.entity.TSysUser"%>
<%@ page import="com.jd.util.UserFile" %>
<%@ page import="java.net.InetAddress" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TSysUser tsysUser = LoginClientUtil.getloginuser(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    out.print("节点:" + InetAddress.getLocalHost().getHostAddress() + ":" + request.getLocalPort() + "<br/>");
    if(tsysUser == null){
        out.print("tsysUser is null");
    }else{
        out.print(tsysUser.getUserloginid() + " : " + UserFile.get(tsysUser.getUserloginid()));
    }
%>
</body>
</html>