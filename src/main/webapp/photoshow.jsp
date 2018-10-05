<%@page import="com.jd.identity.IdConstants"%>
<%@page import="com.jd.util.StringUtil"%>
<%@page language="java" pageEncoding="utf-8" contentType="application/vnd.ms-excel"%>
<%@ page import="java.io.*" %> 

<% 
	String path=request.getParameter("path"); 
	if(StringUtil.isNotBlank(path)){
		FileInputStream in = new FileInputStream(new File(path)); 
		OutputStream o = response.getOutputStream(); 
		int l = 0; 
		byte[] buffer = new byte[4096]; 
		while((l = in.read(buffer)) != -1){ 
		o.write(buffer,0,l); 
		} 
		o.flush(); 
		in.close(); 
		o.close(); 
		out.clear();  
		out = pageContext.pushBody(); 
	}
%> 
