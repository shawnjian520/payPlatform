<%@page import="com.jd.framework.util.DBUtil"%>
<%@page import="com.jd.util.StringUtil"%>
<%@page language="java" contentType="application/x-msdownload"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.*"%>
<%@ page import="com.jd.system.util.LoginUtil" %>

<%
	if (LoginUtil.getloginuser(request) != null) {
	response.reset();//可以加也可以不加  
	response.setContentType("application/x-download;charset=UTF-8");
	
	String path=request.getParameter("path"); 
	File file = new File(path);
	if(file.exists()){
		String filedownload = path;
		String filedisplay = (String)DBUtil.queryFieldValue("select name from t_sys_file where path=? and rownum<2", path);
		if(StringUtil.isBlank(filedisplay)){
	filedisplay = path.substring(path.lastIndexOf("/")+1);
		}
		filedisplay = URLEncoder.encode(filedisplay, "UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename="
		+ filedisplay);
	
		java.io.OutputStream outp = null;
		java.io.FileInputStream in = null;
		try {
	outp = response.getOutputStream();
	in = new FileInputStream(filedownload);
	
	byte[] b = new byte[1024];
	int i = 0;
	
	while ((i = in.read(b)) > 0) {
		outp.write(b, 0, i);
	}
	//  
	outp.flush();
	//要加以下两句话，否则会报错  
	//java.lang.IllegalStateException: getOutputStream() has already been called for //this response    
	out.clear();
	out = pageContext.pushBody();
		} catch (Exception e) {
	 
		} finally {
	if (in != null) {
		in.close();
		in = null;
	}
		}
	}
}
%>
