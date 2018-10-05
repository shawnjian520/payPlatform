
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" onclick="tool.addData(this)">
            <font data-localize="frame_button.add"> 新增</font>
            <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">
            <font data-localize="frame_button.delete">删除 </font>
            <i class="fa fa-times"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.editData(this)">
            <font data-localize="frame_button.update">修改</font> <i class="fa fa-edit"></i>
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
            <th data-localize="frame_xipz.zjdwh_zjdmc">子节点名称</th>
            <th data-localize="frame_xipz.zjdwh_zjdxmqc">子节点项目全称</th>
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
                <td>${obj.url}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>