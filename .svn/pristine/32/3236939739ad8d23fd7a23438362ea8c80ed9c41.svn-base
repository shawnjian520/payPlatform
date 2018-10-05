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
                <h4 class="panel-title ">组织机构列表</h4>

            </div>
            <div class="panel-body">
                <form method="post" class="form-horizontal">
                    <input type="hidden" id="orderType" name="orderType" value="${orderType}">
                    <input type="hidden" id="orderField" name="orderField" value="${orderField}">
                    <div class="row">
                        <div class="col-sm-6 hide">
                            <div class="form-group">
                                <label class="control-label col-xs-4" for="departname"
                                       data-localize="frame_xtgl.bmgl_zzjggl_bmmc">
                                    年度：
                                </label>

                                <div class="col-xs-8">
                                    <select onchange="if($('#nd').val()=='0' || $('#nd').val()=='') $('#addbtn').removeClass('hide');else  $('#addbtn').removeClass('hide').addClass('hide');tool.doSearch(this)"
                                            id="nd" name="nd" zdlb="sys_nd" class="select2-code"
                                            style="margin-top: -10px;" value="${nd }">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-xs-4" for="departname"
                                       data-localize="frame_xtgl.bmgl_zzjggl_bmmc">
                                    部门名称：
                                </label>

                                <div class="col-xs-8">
                                    <input type="text" class="form-control" id="departname" name="departname" value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-xs-4" for="departid"
                                       data-localize="frame_xtgl.bmgl_zzjggl_bmbm">
                                    部门编码：
                                </label>

                                <div class="col-xs-8">
                                    <input type="text" class="form-control" id="departid" name="departid" value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-xs-4" for="state"
                                       data-localize="frame_xtgl.bmgl_zzjggl_zt">
                                    状态：
                                </label>

                                <div class="col-xs-8">
                                    <select class="form-control select2-auto" name="state" id="state" onchange="tool.doSearch(this)">
                                        <option value="" data-localize="frame_xtgl.bmgl_zzjggl_qb">全部</option>
                                        <option value="1" data-localize="frame_xtgl.bmgl_zzjggl_ky">可用</option>
                                        <option value="0" data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-xs-4" for="updepartname"
                                       data-localize="frame_xtgl.bmgl_zzjggl_sjbmmc">
                                    上级部门名称：
                                </label>

                                <div class="col-xs-8">
                                    <input type="text" class="form-control" id="updepartname" name="updepartname"
                                           value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-xs-4" for="updepartid"
                                       data-localize="frame_xtgl.bmgl_zzjggl_sjbmbm">
                                    上级部门编码：
                                </label>

                                <div class="col-xs-8">
                                    <input type="text" class="form-control" id="updepartid" name="updepartid" value="">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6  ">
                            <div class="col-xs-9 col-xs-offset-3">
                                <a class="btn btn-sm btn-primary" data-startFrom="top" id="bb"
                                   onclick="if($('#nd').val()=='0' || $('#nd').val()=='') $('#addbtn').removeClass('hide');else  $('#addbtn').removeClass('hide').addClass('hide');tool.doSearch(this)">
                                    <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 5px;">
                        <div class="col-md-12">
                            <c:if test="${object.departtype!=wid}">
                                <c:if test="${uptype==object.departtype}">
                                    <a class="btn btn-sm btn-success <c:if test="${(nd=='0' || nd=='') }">hide</c:if>"
                                       id="addbtn"
                                       onclick="tool.openSubviewByForm(this,tool.initParams('<%=basePath%>/s/system/depart/load?updepartid=${object.departid}&departtype=${wid}'),true)">
                                        <font data-localize="frame_button.add"> 新增</font> <i class="fa fa-plus"></i>
                                    </a>
                                </c:if>

                                <a class="btn btn-sm btn-success" onclick="doRemoveDepart(this)">
                                    <font data-localize="frame_button.delete">删除 </font><i class="fa fa-times"></i>
                                </a>
                                <a class="btn btn-sm btn-success" onclick="tool.editData(this)">
                                    <font data-localize="frame_button.update">修改</font> <i class="fa fa-edit"></i>
                                </a>
                                <a class="btn btn-sm btn-success" onclick="setDepartState(this,'1')"> <font
                                        data-localize="frame_xtgl.bmgl_zzjggl_ky">启用</font> <i class="fa fa-check"></i></a>
                                <a class="btn btn-sm btn-success" onclick="setDepartState(this,'0')"> <font
                                        data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</font> <i
                                        class="fa fa-ban"></i></a>
                            </c:if>

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
                                    <div class="checkbox-table">
                                        <label>
                                            <input type="checkbox" class="mgc selectall">
                                        </label>
                                    </div>
                                </th>
                                <th data-localize="frame_xtgl.bmgl_zzjggl_bmbm">部门编码</th>
                                <th data-localize="frame_xtgl.bmgl_zzjggl_bmmc">部门名称</th>
                                <th data-localize="frame_xtgl.bmgl_zzjggl_sjbmmc">上级部门编码</th>
                                <th data-localize="frame_xtgl.bmgl_zzjggl_sjbmmc">上级部门名称</th>
                                <th data-localize="frame_xtgl.bmgl_zzjggl_zt">状态</th>
                                <th><i class="icon-time hidden-phone"></i> <font
                                        data-localize="frame_xtgl.bmgl_zzjggl_cz">操作</font></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${resultData}" var="o" varStatus="s">
                                <tr id="tr_${o.departid }">
                                    <td class="center">
                                        <div class="checkbox-table">
                                            <label>
                                                <input type="checkbox" name="selectNode" class="mgc foocheck"
                                                       data-values="roleid" id="${o.departid }" value="${o.departid }">
                                            </label>
                                        </div>
                                    </td>
                                    <td>${o.departid }</td>
                                    <td>
                                        <a onclick="tool.editDataById(this,'${o.departid}')" href="javascript:void(0)">
                                                ${o.departname}
                                        </a>
                                    </td>
                                    <td>${o.updepartid }</td>
                                    <td>${o.updepartname }</td>
                                    <td><c:if test="${o.state=='1'}"><font
                                            data-localize="frame_xtgl.bmgl_zzjggl_ky">可用</font></c:if><c:if
                                            test="${o.state!='1'}"><font
                                            data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</font></c:if></td>
                                    <td>
                                        <c:if test="${o.havsubCount>0 && (nd=='0' || nd=='')}">
                                            <a data-tab-name="新增${o.departname}下级部门" href="javascript:void(0)"
                                               onclick="tool.openSubviewByForm(this,tool.initParams('<%=basePath%>/s/system/depart/load?updepartid=${o.departid }'),true)"
                                               class="btn btn-xs btn-success tooltips"
                                               data-placement="top">新增下级部门</i></a>
                                            <%--                                        <a data-tab-name="查看${o.departname}下级部门"  href="javascript:void(0)" onclick="Main.ajaxLoaderUrl(tool.initParams('<%=basePath%>/s/system/depart/list2?wid=${wid+1}&updepartid=${o.departid}&qsnd=0'), $('#input-page-content'), '组织机构信息')" class="btn btn-xs btn-success tooltips" data-placement="top" >查看下级部门</i></a>--%>
                                        </c:if>
                                        <!--                                         <a href="#" data-tab-name='${o.departname}' onclick="tool.editDataById(this,'${o.departid}')" class="btn btn-xs btn-success tooltips" data-placement="top" data-original-title="修改部门信息"><i class="fa fa-edit"></i></a> <i class="fa fa-user"></i>-->
                                        <a href="javascript:void(0)" data-tab-name="${o.departname}用户"
                                           onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/id/idUser/list?departid=${o.departid }',false)"
                                           class="btn btn-xs btn-success tooltips" data-placement="top">查看该部门用户</a>
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
    /**
     * 删除数据
     * @param el list删除按钮 | 不可为空
     * @param callback 回调函数
     * @param subtitle 副标题提示
     */
    function doRemoveDepart(el, callback, subtitle) {
        var form_element = $(el).parents('.form-horizontal');
        var ids = tool.getChoseData(form_element);
        if (subtitle == null || subtitle == '') {
            subtitle = "删除后将无法恢复，请谨慎操作！";
        }
        if (!isBlank(ids)) {
            tool.alertConfirm('确定要删除勾选的数据吗?', subtitle, function () {
                tool.setWaitForResponseStatus($(el));
                tool.deleteData(form_element, {"wid": ids, "nd": $('#nd').val()}, callback);
            })
        } else {
            tool.alertWarning('请选择要删除的数据!', '请在下方列表中勾选要删除的数据');
        }
    }
    function select(departname) {
        $("#updepartname").val(departname);
        tool.doSearch($("#bb"));
    }
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
<script src="<%=basePath%>/resources/js/language.js"></script>