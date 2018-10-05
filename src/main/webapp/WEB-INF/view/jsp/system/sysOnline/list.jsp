﻿
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
当前实时在线用户：${resultData.size() }
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-order">
        <thead>
        <tr>
            <th data-localize="frame_yhgl.dlm">账号</th>
            <th data-localize="frame_yhgl.dlm">名称</th>
            <th data-localize="frame_yhgl.dlm">登录标示</th>
            <th data-localize="frame_yhgl.yhm">登录时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr >
                <td>${obj.userloginid}</td>
                <td>${obj.username}</td>
                <td>${obj.clientwid}</td>
                <td>${obj.logintime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<style>
    tr, th, td {
        text-align: center
    }
</style>
<%@include file="../../common/input-bottom.jsp" %>