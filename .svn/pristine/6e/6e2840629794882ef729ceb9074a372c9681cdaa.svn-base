<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%@include file="../../common/list-header.jsp" %>
<style>
    th {
        text-align: center;
    }
</style>
<div class="row">
    <div class="col-sm-12 col-xl-10 nopadding">
        <div id="" class="layout col-xs-9">
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
                <div class="form-group">
                    <label title="业务名称" class="col-sm-3 control-label ell nopadding">业务名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="ywmc" name="ywmc" class="form-control   " placeholder="业务名称"
                               value="${object.ywmc }"/>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
                <div class="form-group">
                    <label title="文件名称" class="col-sm-3 control-label ell nopadding">文件名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="pagename" name="pagename" class="form-control   " placeholder="文件名称"
                               value="${object.pagename }"/>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-xs-2">
            <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
                查询 <i class="fa fa-search"></i>
            </a>
            <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                重置 <i class="fa fa-mail-reply-all"></i>
            </a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)">新增 <i class="fa fa-plus"></i></a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">删除 <i class="fa fa-times"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)">修改 <i class="fa fa-edit"></i></a>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline" style="text-align: center;">
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th data-order-name="ywmc">业务名称</th>
            <th data-order-name="wjmc">文件名称</th>
            <th data-order-name="nodename">节点名称</th>
            <!-- <th data-order-name="path">页面路径</th> -->
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="object">

            <tr id="tr_${object.wid}">
                <td class="center w20">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" name="selectNode" class="mgc foocheck" id="${object.wid}"
                                   value="${object.wid}">
                        </label>
                    </div>
                </td>
                <td>
                    <a onclick="tool.editDataById(this,'${object.wid}')" href="javascript:void(0)">${object.ywmc}</a>
                </td>
                <td>
                        ${object.pagename}
                </td>
                <td>${object.nodename}</td>
                <td>

                        <%--  <a class="btn btn-xs btn-success tooltips" data-tab-name="${object.ywmc}>${object.pagename}" data-placement="top" data-original-title="编辑页面" onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/system/sysJavaFile/configTemple/${object.wid}')" href="javascript:void(0)"><i class="fa fa-edit"></i></a> --%>
                        <%--       <a class="btn btn-xs btn-success tooltips" data-tab-name="${object.ywmc}>${object.pagename}" data-placement="top" data-original-title="自定义方法列表" onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/system/sysJavaFile/listmethod?wid=${object.wid}')" href="javascript:void(0)"><i class="fa fa-file-zip-o"></i></a> --%>
                    <a class="btn btn-xs btn-success tooltips" data-placement="top" data-original-title="查看自定义方法列表"
                       onclick="showmethod('${object.wid}')" href="javascript:void(0)"><i
                            class="fa fa-angle-double-down"></i></a>
                    <a class="btn btn-xs btn-success tooltips" data-placement="top" data-original-title="新增自定义方法列表"
                       onclick="tool.openModal({'remote':'<%=basePath %>/s//system/sysJavaFile/openMe?lwid=${object.wid}'})"
                       href="javascript:void(0)"><i class="fa fa-plus-square"></i></a>
                </td>
            </tr>
            <tr id="trs${object.wid}" style="display: none;">
                <td class="center" colspan="5">
                    <table id="contentTable${object.wid}" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th data-order-name="name">方法名称</th>
                            <th data-order-name="qqurl">请求url</th>
                            <th data-order-name="jscs">接收参数</th>
                            <th data-order-name="servicereturn">返回页面</th>
                            <th data-order-name="controllerreturn">Controller返回值</th>
                            <th data-order-name="servicereturn">Service返回值</th>
                            <th data-order-name="bz">备注</th>
                            <th data-order-name="bz">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${methodlist}" var="objm">

                            <c:if test="${objm.wjid==object.wid}">
                                <tr id="trm_${objm.wid}">
                                    <td>${objm.name}</td>
                                    <td>${objm.qqurl}</td>
                                    <td>${objm.jscs}</td>
                                    <td>${objm.returnjsp}</td>
                                    <td>${objm.controllerreturn}</td>
                                    <td>${objm.servicereturn}</td>
                                    <td>${objm.bz}</td>
                                    <td><a class="btn btn-xs btn-danger tooltips" data-placement="top"
                                           data-original-title="删除" onclick="deletepage(this,'${objm.wid}')"
                                           href="javascript:void(0)"><i class="fa  fa-times"></i></a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>
<script>
    function isSubmitForm() {
        return true;
    }
    function showmethod(wid) {
        if ($('#trs' + wid).css('display') == 'none') {
            $('#trs' + wid).css('display', '');
        } else {
            $('#trs' + wid).css('display', 'none');
        }
    }

    function deletepage(el, wid) {
        var form_element = $(el).parents('.form-horizontal');
        if (isBlank(form_element.attr("action"))) {
            if (isBlank(form_element.attr("action"))) {
                url = form_element.attr("data-action");
                //spring mvc
                if (url.indexOf("action") < 0) {
                    url = url.substring(0, url.indexOf('/s/') + 7) + url.substring(url.indexOf('/s/') + 7).substring(0, url.substring(url.indexOf('/s/') + 7).indexOf("/"));
                    url = url + "/remove";
                } else {
                    url = url.substr(0, url.indexOf("-")) + "-saveData.action";
                }
            } else {
                url = form_element.attr("action");
            }
        }

        $.ajax({
            url: tool.initParams(url),
            type: "post",
            data: {wid: wid},
            dataType: "json",
            timeout: 1000 * 5,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                tool.removeWaitForResponseStatus();
                tool.alertWarning('操作失败,请重试!');
            },
            success: function (data) {
                tool.removeWaitForResponseStatus();
                data = eval(data);
                if (data.res) {
                    var $delTr = $("#trm_" + wid);
                    $delTr.find(".btn").css("border-color", "#fff");
                    $delTr.addClass("isdelete").find("td").css({"background-color": "#FF3300"}).fadeOut(1000, function () {
                        $(this).remove();
                    });
                } else {
                    setTimeout('tool.alertError("' + data.msg + '")', 100);
                }
            }
        });
    }


</script>