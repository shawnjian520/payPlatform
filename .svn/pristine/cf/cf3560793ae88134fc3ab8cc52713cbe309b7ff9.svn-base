﻿<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-order">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th class="jdlanguage">学生姓名</th>
            <th class="jdlanguage">基本信息</th>
            <th class="jdlanguage">日志</th>
            <th class="jdlanguage">查看详情</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.wid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                          <input type="checkbox" class="mgc foocheck"  name="selectNode" value="${obj.wid}">
                        </label>
                    </div>
                </td>
                   <td>${obj.xsxm}</td>
                   <td>${obj.szdw}</td>
                   <td>${obj.data}</td>
                   <td><a href="javascript:void(0)" onclick="tool.openview(this,'${obj.path}','${obj.xsxm }')">查看详情</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<style>
  tr,th,td{
    text-align:center
  }
</style>
<script>
</script>
<%@include file="../../common/list-bottom.jsp" %>