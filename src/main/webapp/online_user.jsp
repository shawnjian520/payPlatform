<%@page import="com.jd.system.entity.TSysOnline" %>
<%@page import="com.jd.identity.IdConstants" %>
<%@page import="com.jd.framework.util.SysPropertiesUtil" %>
<%@page import="com.jd.framework.util.DBUtil" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
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
<br/>
<%
    List<TSysOnline> list1 = DBUtil.queryAllBeanList("select * from (select * from t_sys_online order by login_time asc) where rownum<500", TSysOnline.class);
    for (int i = 0; i < list1.size(); i++) {
        out.println("" + list1.get(i).getLoginid() + "---" + list1.get(i).getServerIp() + "---" + list1.get(i).getLoginTime() + "<br/>");
    }

%>
</body>
</html>