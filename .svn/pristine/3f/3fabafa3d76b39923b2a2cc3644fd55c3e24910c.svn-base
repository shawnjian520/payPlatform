﻿
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" onclick="tool.addData(this)">
            新增 <i class="fa fa-plus"></i>
        </a>
        <%--        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">--%>
        <%--          	   删除<i class="fa fa-times"></i>--%>
        <%--        </a>--%>
        <a class="btn btn-sm btn-success" onclick="tool.editData(this)">
            修改 <i class="fa fa-edit"></i>
        </a>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
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
            <th>班级名称</th>
            <th>班级编码</th>
            <th>专业</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.wid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" class="mgc foocheck" name="selectNode" value="${obj.wid}">
                        </label>
                    </div>
                </td>
                <td><a onclick="tool.editDataById(this,'${obj.wid}')" href="javascript:void(0)">${obj.name}</a></td>
                <td>${obj.code}</td>
                <td>${obj.zymc}</td>
                <td>
                    <c:if test="${obj.state=='1' }">正常</c:if>
                    <c:if test="${obj.state!='1' }">关闭</c:if>
                </td>
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
<script>
</script>
<%@include file="../../common/list-bottom.jsp" %>