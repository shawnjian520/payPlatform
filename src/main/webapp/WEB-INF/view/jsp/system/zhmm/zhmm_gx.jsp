<%@page import="com.jd.system.Const"%>
<%@page import="com.jd.framework.util.DBUtil"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

String url = (String)DBUtil.queryFieldValue("select loginjsp from T_STUDENT_TYPE t where type=?",Const.depart_xs_gx);

request.getRequestDispatcher(url.replace("login", "zhmm")).forward(request, response);
%>
