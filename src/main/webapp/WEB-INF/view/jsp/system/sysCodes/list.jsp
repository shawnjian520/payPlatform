<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@include file="../../common/list-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div class="row">
    <div class="col-xxl-11 col-xl-11 col-sm-12">
        <div class="row">
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="zdlb">
                        <font data-localize="frame_xtgl.sjzd_zdwh_lb">类别</font>：
                    </label>

                    <div class="col-sm-9">
                        <select name="zdlb" id="zdlb" data-show-searchbox="true" class="form-control select2-auto parameter" onchange="tool.doSearch(this)">
                            <option value="">全部</option>
                            <c:forEach items="${syscodelist}" var="c" varStatus="s">
                                <option value="${c.id }">${c.caption}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="zdbm">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdbm">字典编码</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="zdbm" name="zdbm" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="zdmc">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdmc">字典名称</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="zdmc" name="zdmc" class="form-control">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xxl-1 col-xl-1 col-sm-12">
        <div class="btn-group pull-right mb10">
            <a class="btn btn-sm btn-primary " data-startFrom="top" onclick="tool.doSearch(this)">
                <font data-localize="frame_button.search">查询</font>
                <i class="fa fa-search"></i>
            </a>
        </div>

    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)"><font
                data-localize="frame_button.add"> 新增</font>
            <i class="fa fa-plus"></i></a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)"><font
                data-localize="frame_button.delete">删除 </font>
            <i class="fa fa-times"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)"><font
                data-localize="frame_button.delete">修改 </font>
            <i class="fa fa-edit"></i></a>
        <a class="btn btn-sm btn-success"
           onclick="tool.openSubviewByForm(this,tool.initParams('<%=basePath%>/s/system/sysCodeSort/list'),false)">
            <font
                    data-localize="frame_xtgl.sjzd_zdwh_whzdlb">维护字典类别</font><i
                class="fa fa-wrench"></i></a>

        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th data-localize="frame_xtgl.sjzd_zdwh_zdmc">字典名称</th>
            <th data-localize="frame_xtgl.sjzd_zdwh_zdz">字典值</th>
            <%--            <th>上级字典</th>--%>
            <th data-localize="frame_xtgl.sjzd_zdwh_zdlb">字典类别</th>
            <th data-localize="frame_xtgl.sjzd_zdwh_zt">状态</th>
            <th data-localize="frame_xtgl.sjzd_zdwh_zdpx">字典排序</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="o" varStatus="s">
            <tr id="tr_${o.wid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                            <input id="${o.wid}" type="checkbox" name="selectNode" value="${o.wid }"
                                   class="mgc foocheck">
                        </label>
                    </div>
                </td>
                <td>
                    <a onclick="tool.editDataById(this,'${o.wid}')" href="javascript:void(0)">
                            ${o.zdmc }
                    </a>
                </td>
                <td>
                        ${o.zdbm }
                </td>
                <td>
                        ${o.lbmc}(${o.zdlb})
                </td>
                <td>
                    <c:if test="${o.sfsy==0}"><font data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</font></c:if>
                    <c:if test="${o.sfsy!=0}"><font data-localize="frame_xtgl.bmgl_zzjggl_ky">可用</font></c:if>
                </td>
                <td>
                        ${o.zdpx}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<input type="hidden" name="currentPageno" value="${pager.currentPageno}" id="yspager_currentPageno"/>
<input type="hidden" name="eachPageRows" value="${pager.eachPageRows}" id="eachPageRows"/>
<div class="row">
    <tags:pagination paginationSize="${pager.eachPageRows}" page="${pager}"></tags:pagination>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>