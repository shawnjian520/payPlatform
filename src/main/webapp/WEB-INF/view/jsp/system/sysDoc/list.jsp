﻿
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<div class="row">
    <div class="col-xxl-12 col-xl-12 col-sm-12">
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
            <div class="form-group">
                <label class="col-sm-3 control-label ell nopadding" for="xxbt"><font data-localize="frame_tzgl.xtz_bt">主题</font>：</label>
                <div class="col-sm-9">
                    <input type="text" id="xxbt" name="xxbt" class="form-control   " value="${tsysMessage.xxbt }"/>
                </div>
            </div>
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

<hr class="dividing-line"/>
<div class="row">
    <div class="col-md-12">

        <a class="btn btn-sm btn-success" onclick="tool.openview(this,'<%=basePath%>s/biz/sysDoc/openCreate','发公文')">
            <font data-localize="frame_gwgl.fgw_fgw"> 发公文</font> <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="page.doRemove(this)">
            <font data-localize="frame_gwgl.fgw_scgw">删除公文 </font><i class="fa fa-times"></i>
        </a>
        <%--       <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">--%>
        <%--          	   删除<i class="fa fa-times"></i>--%>
        <%--        </a>--%>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>

<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-align-center">
        <thead>
        <tr>
            <th class="center" width="30px">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th data-localize="frame_gwgl.fgw_gwzt">公文主题</th>
            <th data-localize="frame_gwgl.yffgw_fssj">发送时间</th>
            <th data-localize="frame_gwgl.yfgw_jsr">查看接收人</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="data">
            <tr id="tr_${data.wid}">
                <td class="center" width="25">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" name="selectNode" class="mgc foocheck" id="${data.wid}"
                                   value="${data.wid}">
                        </label>
                    </div>
                </td>
                <td id="td${data.wid}">
                    <a style="cursor: pointer;"
                       onclick="tool.openview(this,'<%=basePath%>s/system/sysDoc/input/${data.wid}/1')">${data.xxbt}</a>
                </td>
                <td>
                    <fmt:formatDate value="${data.xxfssj }" pattern="yyyy-MM-dd HH:mm" var="xxfssj"/>
                        ${xxfssj }
                </td>
                <td><a style="cursor: pointer;" onclick="page.ckjsr('${data.wid}')" data-localize="frame_gwgl.yfgw_jsr">查看接收人</a>
                </td>
            </tr>
            <tr id="tr${data.wid}" style="display: none;">
                <td class="center" colspan="5">
                    <table id="contentTable" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th data-localize="frame_gwgl.yfgw_jsr">接受人</th>
                            <th data-localize="frame_tzgl.xtz_sfck">是否查看</th>
                            <th data-localize="frame_tzgl.yftz_cksj">查看时间</th>
                        </tr>
                        </thead>
                        <tbody id="tbody${data.wid}">

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
    var deltitle = '';
    var deltips = '';
    var errtip = '';
    var nochoosetitle = '';
    var nochoosetip = '';
    var yck = '';
    var wck = '';
    function getCookie(name)//取cookies函数
    {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]);
        return null;
    }
    var cookielang = getCookie("jdLanguage");
    if (cookielang == "en") {
        deltitle = 'Are you sure you want to delete the selected data?';
        deltips = 'Delete will not be able to recover, please be careful to operate!';
        errtip = 'Operation failed, please try again!';
        nochoosetitle = 'Please select the data you want to delete!';
        nochoosetip = 'Check the data you want to delete in the list below';
        yck = 'Already view';
        wck = 'Not viewed';
    } else {
        deltitle = '确定要删除勾选的数据吗?';
        deltips = '删除后将无法恢复，请谨慎操作！';
        errtip = '操作失败,请重试!';
        nochoosetitle = '请选择要删除的数据!';
        nochoosetip = '请在下方列表中勾选要删除的数据';
        yck = '已查看';
        wck = '未查看';
    }
    page = {
        doRemove: function (el) {
            var form_element = $(el).parents('.form-horizontal');
            var ids = tool.getChoseData(form_element);
            if (!isBlank(ids)) {
                tool.alertConfirm(deltitle, deltips, function () {
                    tool.setWaitForResponseStatus($(el));
                    var url = form_element.attr("data-action");
                    url = url.substr(0, url.lastIndexOf("/")) + "/removeyf";
                    $.ajax({
                        url: tool.initParams(url),
                        type: "post",
                        data: {"wid": ids},
                        dataType: "json",
                        timeout: 1000 * 5,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            tool.removeWaitForResponseStatus();
                            tool.alertWarning(errtip);
                        },
                        success: function (data) {
                            tool.removeWaitForResponseStatus();
                            data = eval(data);
                            if (data.res) {
                                var $delTr = $("#tr_" + ids.replace(/,/g, ',#tr_'));
                                $delTr.find(".btn").css("border-color", "#fff");
                                $delTr.addClass("isdelete").find("td").css({"background-color": "#FF3300"}).fadeOut(1000, function () {
                                    $(this).remove();
                                });
                            } else {
                                tool.alertSuccess(data.msg);
                            }
                        }
                    });
                })
            } else {
                tool.alertWarning(nochoosetitle, nochoosetip);
            }
        },
        ckjsr: function (wid) {
            $.post(tool.initParams(basePath + '/s/bizystem/sysDoc/getjsr'), {'wid': wid}, function (data) {
                var html = '';
                $(data).each(function (i) {
                    html += '<tr>' +
                            '<td>' + data[i].jsr + '</td>' +
                            '<td>';
                    if (data[i].xxzt == '1') html += yck;
                    if (data[i].xxzt == '0') html += wck;
                    html += '</td>' +
                            '<td>' + data[i].xxjssj_s + '</td>' +
                            '</tr>';
                });

                $('#tbody' + wid).html(html);
                if ($('#tr' + wid).css('display') == 'none') {
                    $('#tr' + wid).css('display', '');
                } else {
                    $('#tr' + wid).css('display', 'none');
                }
            });

        }

    }

</script>