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
<script type="text/javascript">
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
        yck = 'Already view';
        wck = 'Not viewed';
    } else {
        yck = '已查看';
        wck = '未查看';
    }
    function ckjsr(wid) {
        $.post(tool.initParams(basePath + '/s/biz/sysMessage/getjsr'), {'wid': wid}, function (data) {
            var html = '';
            $(data).each(function (i) {
                html += '<tr>' +
                        '<td>' + data[i].xxjsr_str + '</td>' +
                        '<td>';
                if (data[i].xxzt == '1') html += yck;
                if (data[i].xxzt == '0') html += wck;
                html += '</td>' +
                        '<td>' + data[i].xxydsj_str + '</td>' +
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


</script>

<div class="row">
    <div class="col-xxl-12 col-xl-12 col-sm-12">
        <div class="row">
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-4" data-localize="frame_tzgl.xtz_bt">
                        主题：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="xxbt" name="xxbt" style="width:300px;" class="form-control  pull-left"
                               value="${tsysMessage.xxbt }"/>
                    </div>
                </div>
            </div>
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-4">
                    </label>
                    <div class="col-sm-8">
                        <button type="button" class="btn btn-primary btn-sm" data-startFrom="top"
                                onclick="tool.doSearch(this)">
                            <font data-localize="frame_button.search">查询</font><i class="fa fa-search fa-sm"></i>
                        </button>
                        <button type="button" class="btn btn-primary btn-sm" onclick="tool.resetForm(this)">
                            <font data-localize="frame_button.reset"> 重置</font><i class="fa fa-reply fa-sm"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-order">
        <thead>
        <tr>
            <th class="center w20">
                <label>
                    <input type="checkbox" class="mgc selectall">
                </label>
            </th>
            <th data-localize="frame_tzgl.yftz_bt">通知主题</th>
            <th data-localize="frame_tzgl.yftz_tzlx">通知类型</th>
            <th data-localize="frame_tzgl.yftz_fssj">发送时间</th>
            <th data-localize="frame_tzgl.xtz_jsbm">查看接收部门</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="data">
            <tr id="tr_${data.wid}">
                <td class="center w20">
                    <label>
                        <input type="checkbox" name="selectNode" class="mgc foocheck" id="${data.wid}"
                               value="${data.wid}">
                    </label>
                </td>
                <td id="td${data.wid}">
                        ${data.xxbt}
                </td>
                <td>${data.xxly_str}</td>
                <td>
                    <fmt:formatDate value="${data.createtime }" pattern="yyyy-MM-dd HH:mm" var="createtime"/>
                        ${createtime }
                </td>
                <td><a style="cursor: pointer;" onclick="ckjsr('${data.wid}')" data-localize="frame_tzgl.yftz_ckjsbm">查看接收部门</a>
                </td>
            </tr>
            <tr id="tr${data.wid}" style="display: none;">
                <td class="center" colspan="5">
                    <table id="contentTable" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th data-localize="frame_tzgl.xtz_jsbm">接受部门</th>
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