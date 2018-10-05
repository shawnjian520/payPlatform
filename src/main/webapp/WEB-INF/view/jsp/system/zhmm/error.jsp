<%@page import="com.jd.system.Const"%>
<%@page import="com.jd.framework.util.DBUtil"%>
<%@page import="com.jd.system.entity.ApplicationEnum"%>
<%@page import="java.util.List"%>
<%@page import="com.jd.system.servlets.SysInitAutoLoad"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码</title>
<meta name="keywords" content="找回密码"/>
<meta name="description" content="找回密码"/>
<meta name="viewport" content="width=device-width"/>
<script src="<%=basePath%>/resources/plugins/jQuery/jquery-2.1.1.min.js"></script>
<link href="<%=basePath%>/resources/login/basic1/css/csszhmm.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]> 
<script src="<%=basePath%>/resources/login/basic1/js/DD_belatedPNG_0.0.8a-min.js"></script> 
<script> 
DD_belatedPNG.fix('*'); 
</script> 
<![endif]--> 
</head>
<body>
	 <div id="c-findMM-header">
		 <div class="c-findMM-logo">
			 <dl>
				 <dt><img title="" src="<%=basePath%>/resources/login/basic1/images/c_find_logo.png" width="254" height="46" /></dt>
				 <dd>找回密码</dd>
			 </dl>
		 </div>
	 </div>
	 <div id="c-findMM">
		 <h4>链接不正确</h4>
	 </div>
	 <div id="c-findMM-footer">版权所有：<%=SysInitAutoLoad.zzmc %>copyright 2009-2016<i>技术支持：南京君度科技有限公司</i></div>
</body>
</html>