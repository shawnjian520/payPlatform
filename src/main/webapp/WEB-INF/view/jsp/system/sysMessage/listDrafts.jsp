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
    var nochoosetitle = '';
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
        nochoosetitle = 'Please select the data you want to Send!';
    } else {
        yck = '已查看';
        wck = '未查看';
        nochoosetitle = '请选择要发送的通知!';
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

    function send(el) {
        var slength = 0;
        var a = document.getElementsByName("selectNode");
        for (var i = 0; i < a.length; i++) {
            if (a[i].checked) {
                slength += 1;
            }
        }
        if (slength >= 1) {
            var id = tool.getChoseData($(el).parents('.form-horizontal'));

            $.post(tool.initParams('<%=basePath%>/s/biz/sysMessage/send'), {'wid': id}, function (data) {
                if (data == 'SUCCESS') {
                    tool.openview(el, '<%=basePath%>s/biz/sysMessage/list', '已发通知');
                } else {
                    tool.alertWarning(data, '');
                }
            });


        } else {
            tool.alertWarning(nochoosetitle, '');
        }
    }

</script>

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
        <a class="btn btn-sm btn-success" onclick="send(this)">
            <font data-localize="frame_tzgl.cg_fs"> 发送</font> <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)"><font
                data-localize="frame_button.delete">删除 </font><i class="fa fa-times"></i></a>

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
                    <a style="cursor: pointer;"
                       onclick="tool.openview(this,'<%=basePath%>s/biz/sysMessage/input/${data.wid}/2')">${data.xxbt}</a>
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