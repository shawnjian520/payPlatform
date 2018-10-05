<%@page import="com.jd.identity.service.impl.IdLoginServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
IdLoginServiceImpl.times = String.valueOf(Integer.parseInt(IdLoginServiceImpl.times)-1);
%>