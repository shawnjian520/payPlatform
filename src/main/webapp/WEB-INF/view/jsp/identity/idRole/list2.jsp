<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<div id="page-content" class="row">
    <div class="col-md-12">
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title ">用户角色列表</h4>
            </div>
            <div class="panel-body">
                <form method="post" class="form-horizontal">
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="rolename" data-localize="frame_xipz.jswh_js">
                                    角色：
                                </label>

                                <div class="col-xs-9">
                                    <input type="text" placeholder="" class="form-control " id="rolename"
                                           name="rolename" value="${object.rolename}">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="state" data-localize="frame_xipz.jswh_zt">
                                    状态：
                                </label>

                                <div class="col-xs-9">
                                    <select class="form-control select2-auto" name="state" id="state" onchange="tool.doSearch(this)">
                                        <option value="" data-localize="frame_xtgl.bmgl_zzjggl_qb">全部</option>
                                        <option value="1" data-localize="frame_xtgl.bmgl_zzjggl_ky">启用</option>
                                        <option value="0" data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-2 searchbtn-group">
                            <a class="btn btn-sm btn-primary" data-startFrom="top" onclick="tool.doSearch(this)">
                                <font data-localize="frame_button.search">查询</font>
                                <i class="fa fa-search"></i>
                            </a>
                        </div>
                    </div>

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
                            <a class="btn btn-sm btn-success" data-startFrom="top"
                               onclick="tool.openSubview(tool.initParams('<%=basePath%>s/system/syscodes/list?zdlb=jsyhz'),'','角色用户组维护')">
                                <font data-localize="frame_button.update">维护角色用户组字典</font> <i class="fa fa-wrench"></i>
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
                                <th data-localize="frame_xipz.jswh_js">角色</th>
                                <th data-localize="frame_xipz.jswh_zt">状态</th>
                                <th data-localize="frame_xtgl.rzgl_ms">描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${resultData}" var="o" varStatus="a">
                                <tr id="tr_${o.roleid}">
                                    <td class="center">
                                        <label>
                                            <input type="checkbox" name="selectNode" class="mgc foocheck"
                                                   data-values="roleid" id="${o.roleid}" value="${o.roleid}">
                                        </label>
                                    </td>
                                    <td>
                                        <a onclick="tool.editDataById(this,'${o.roleid}')" href="javascript:void(0)">
                                                ${o.rolename}
                                        </a>
                                    </td>
                                    <td>
                                        <c:if test="${o.state==0}"><font
                                                data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</font></c:if>
                                        <c:if test="${o.state!=0}"><font
                                                data-localize="frame_xtgl.bmgl_zzjggl_ky">可用</font></c:if>
                                    </td>
                                    <td>
                                        &nbsp;${o.memo}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
                    <input type="hidden" name="pager.currentPageno" value="${pager.currentPageno}"
                           id="yspager_currentPageno"/>
                    <input type="hidden" name="pager.eachPageRows" value="${pager.eachPageRows}" id="eachPageRows"/>
                    <div class="row mt-10" style="margin-top:1%">
                        <tags:pagination paginationSize="${pager.eachPageRows}" page="${pager}"></tags:pagination>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end: PAGE CONTENT-->
<script>
    function setDepartState(el, type) {
        var slength = 0;
        var a = document.getElementsByName("selectNode");
        for (var i = 0; i < a.length; i++) {
            if (a[i].checked) {
                slength += 1;
            }
        }
        if (slength >= 1) {
            var id = tool.getChoseData($(el).parents('.form-horizontal'));

            $.post('<%=basePath%>/s/ajax/updatetype', {'state': type, 'departid': id}, function (data) {
                tool.submitForm($(el).parents('.form-horizontal'));
            });


        } else {
            alert("请选择要操作的数据!");
        }
    }
</script>
<script src="<%=basePath%>resources/js/language.js"></script>