<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)">
            <font data-localize="frame_button.add"> 新增</font>
            <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">
            <font data-localize="frame_button.delete">删除 </font>
            <i class="fa fa-times"></i>
        </a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)">
            <font data-localize="frame_button.update">修改</font> <i class="fa fa-edit"></i>
        </a>

        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered ">
        <thead>
        <tr>
            <th class="center w20">
                <label>
                    <input type="checkbox" class="mgc selectall">
                </label>
            </th>
            <th data-localize="frame_xtgl.pzgl_sjdr_mbbsh">模板标示号</th>
            <th data-localize="frame_xtgl.pzgl_sjdr_mbmv">模板名称</th>
            <th data-localize="frame_xtgl.pzgl_sjdr_mbbm">对应表名</th>
            <th data-localize="frame_xtgl.pzgl_sjdr_cz">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="o" varStatus="s">
            <tr id="tr_${o[0] }">
                <td class="center">
                    <label>
                        <input type="checkbox" name="selectNode" class="mgc foocheck" data-values="roleid" id="${o[0] }"
                               value="${o[0] }">
                    </label>
                </td>
                <td>${o[0]}</td>
                <td><a onclick="tool.editDataById(this,'${o[0] }')"
                       href="javascript:void(0)">${o[1] }</a></td>
                <td> ${o[2]}
                </td>
                <td>
                    <a href="javascript:void(0)"
                       onclick="tool.openSubviewByForm(this,tool.initParams('<%=basePath%>/s/system/excelImportAdminSetup/input/${o[0]}'),true)"
                       class="btn btn-xs btn-primary tooltips" data-placement="top" data-original-title="编辑"><i
                            class="fa fa-edit"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>