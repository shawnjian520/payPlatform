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
<script type="text/javascript" src="<%=basePath%>resources/js/zhmm_xs.js"></script>
<link rel="stylesheet"
          href="<%=basePath%>/resources/plugins/jQuery-Validation-Engine-master/css/validationEngine.jquery.css">
<script src="<%=basePath%>/resources/plugins/jQuery-Validation-Engine-master/js/jquery.validationEngine.js"></script>
<script src="<%=basePath%>/resources/plugins/jQuery-Validation-Engine-master/js/languages/jquery.validationEngine-zh_CN.js"></script>
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
			 <ul>
				 <li class="no-line"><a href="javascript:tourl();" target="_blank">注册</a></li>
				 <li><a href="javascript:tourlgl();" target="_blank">登录</a></li>
			 </ul>
		 </div>
	 </div>
	 <div id="c-findMM">
		 <h4>请输入你注册时的身份证号</h4>
		 <form id="form-find" name="form-find" action="/" method="post" class="form-find">
		 		<input type="hidden" id="table" name="table" value="${type }" />
					 <div class="errorHandler alert alert-danger hide" style="color: red;"></div>
			 <dl>
				 <dd><span>身份证号：</span><input class="validate[required,shzhm]" type="text" name="sfzh" id="sfzh" value=""  placeholder="请输入身份证号" /></dd>
				 <dd>
					 <span>验证码：</span>
					 <input class="input-yzm validate[required]" type="text" name="yzm" id="yzm" placeholder="请输入验证码">
					 <img id="img_u_v_i_c" width="90" height="32" src="<%=basePath%>generateImage/u_v_i_c" onclick="changeyzm()" />
				 </dd>
				 <dt><button id="zhmmbutton" onclick="ajaxzhmm()" >确定</button></dt>
			 </dl>
		 </form>
	 </div>
	 <div id="c-findMM-footer">版权所有：<%=SysInitAutoLoad.zzmc %>copyright 2009-2016<i>技术支持：南京君度科技有限公司</i></div>
	<script>
	var basePath = '<%=basePath%>';
	function changeyzm() {
	    $('#img_u_v_i_c').attr('src', '<%=basePath%>generateImage/u_v_i_c?aaa=' + new Date());
	}
	$(document).ready(function() {
		 $('#form-find').validationEngine({
	            showOneMessage: true
	        });
	});
	</script>
</body>
</html>