﻿
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-sm-12 col-xl-10">
        <div class="form-group">
            <label class="control-label col-xs-1">
                <font data-localize="frame_yhgl.dlm">用户账户</font>：
            </label>

            <div class="col-xs-3">
                <input type="text" id="userloginid" name="userloginid" class="form-control   "
                       value="${object.userloginid }"/>
            </div>

            <div class="col-xs-3">
                <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
                    <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
                </a>
                <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                    <font data-localize="frame_button.reset"> 重置</font> <i class="fa fa-mail-reply-all"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" onclick="tool.editData(this)">
            <font data-localize="frame_yhgl.bdxbm">绑定新部门</font> <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">
            <font data-localize="frame_button.delete">删除 </font><i class="fa fa-times"></i>
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
            <th data-localize="frame_yhgl.dlm">用户账户</th>
            <th data-localize="frame_yhgl.yhm">用户名</th>
            <th data-localize="frame_xtgl.bmgl_zzjggl_bmmc">部门</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.userid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" class="mgc foocheck" name="selectNode" value="${obj.userid}">
                        </label>
                    </div>
                </td>
                <td><a onclick="tool.editDataById(this,'${obj.userid}')"
                       href="javascript:void(0)">${obj.userloginid}</a></td>
                <td>${obj.username}</td>
                <td>${obj.departname}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>