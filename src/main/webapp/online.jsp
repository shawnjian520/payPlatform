<%@page import="com.jd.identity.IdConstants" %>
<%@page import="com.jd.framework.util.SysPropertiesUtil" %>
<%@page import="com.jd.framework.util.DBUtil" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        window.onload = function () {
            setTimeout('window,location.reload()', 5 * 1000);
        }
    </script>
</head>
<body>
<%="当前设置最大登录人数：" + SysPropertiesUtil.getInteger(IdConstants.MAX_ONLINE_COUNT) %><br/>
<%
    String sql = "select a.server_ip,count(1) from t_sys_online a group by a.server_ip";
    List<Object[]> list = DBUtil.queryAllList(sql);
    for (int i = 0; i < list.size(); i++) {
        out.println("" + list.get(i)[0] + "在线人数:" + list.get(i)[1] + "<br/>");
    }
%>
</body>
</html>