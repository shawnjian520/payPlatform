<%@page import="com.jd.system.util.LoginUtil" %> 
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.jd.util.StringUtil" %>
<%@page import="com.jd.support.cache.CacheUtils" %>
<%@page import="com.jd.util.CacheEnum" %>
<%@page import="com.jd.system.entity.TSysInit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    String basePath_process = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/pros_process/";
    TSysUser tsysUser = (TSysUser) LoginUtil.getloginuser(request);
    String to_student = ((tsysUser != null && tsysUser.getStudentAccount() != null)) ? "true" : "false";
    String showdb = ((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getShowdb();
    String dburl = ((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getDburl();
    if (StringUtil.isBlank(dburl)) {
        dburl = basePath + "/s/biz/ajaxProcess/getTask";
    }
%>
<!DOCTYPE html>
<html lang="en">
<!-- start: HEAD -->
<head>
    <title>个人中心</title>
    <%@include file="../../common/other/meta.jsp" %>
    <link rel="stylesheet" href="${ctx}/resources/plugins/bootstrap/bootstrap-custom-home/css/bootstrap.min.css">
    <%@include file="../../common/plugins/css/animate.jsp" %>
    <%@include file="../../common/plugins/css/sweetalert.jsp" %>
    <!-- end: 插件 css -->
    <%@include file="../../common/plugins/css/sweetalert.jsp" %>
    <link rel="stylesheet" href="${ctx}/resources/css/index.css">
    <link rel="stylesheet" href="${ctx}/resources/css/styles-responsive.css">
    <link rel="stylesheet" href="${ctx}/resources/css/themes/theme-default.css" type="text/css" id="skin_color">
    <!-- end: 框架 css -->
    <!--[if lt IE 9]>
    <script src="${ctx}/resources/plugins/jQuery/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/resources/plugins/respond.min.js"></script>
    <script src="${ctx}/resources/plugins/excanvas.min.js"></script>
    <link rel="stylesheet" href="${ctx}/resources/css/ie8-patch.css">
    <![endif]-->
    <!--[if lt IE 10]>
    <link rel="stylesheet" href="${ctx}/resources/css/ie9-patch.css">
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src="${ctx}/resources/plugins/jQuery/jquery-2.1.1.min.js"></script>
    <!--<![endif]-->
    <script>
        var basePath = '<%=basePath%>';
        var nodePath = '<%=basePath%>';
    </script>
</head>
<body class="single-page">
<div class="tabModel-content animated hide">

    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">消息通知</h4>
            <div class="panel-tools">
                <a href="javascript:void(0)" onclick="tool.openview(this,'<%=basePath%>/s/biz/sysMessage/listbox','收件箱')"><font
                        data-localize="yw_grzx.more">查看更多</font></a>
            </div>
        </div>
        <div class="panel-body" id="todo-fa-xxtz">
            <ul class="todo">
                <li>
                    加载中...
                </li>
            </ul>
        </div>
    </div>
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">查收公文</h4>
            <div class="panel-tools">
                <a href="javascript:void(0)" onclick="tool.openview(this,'<%=basePath%>/s/biz/sysDoc/listbox','查收公文')">查看更多</a>
            </div>
        </div>
        <div class="panel-body" id="todo-fa-gwlz">
            <ul class="todo">
                <li>
                    加载中...
                </li>
            </ul>
        </div>
    </div>
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">待办事项</h4>
        </div>
        <div class="panel-body" id="todo-fa-dbrw">
            <ul class="todo">
                <li>
                    加载中...
                </li>
            </ul>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/sweetalert.jsp" %>
<!-- 框架 -->
<%@include file="../../common/plugins/js/frame.jsp" %>
<%@include file="../../common/plugins/js/jquery.cookie.jsp" %>
<!-- end: PAGE CONTENT-->
<script>

    $(document).ready(function () {
        var edituser = '${edituser}';
        $('span[id*="fa-"]').each(function () {
            var id = $(this).attr('id');
            $(this).parent().click(function () {
                $('.fa-message').removeClass('fa-message');
                $(this).addClass('fa-message');
                $('div[id*="todo-fa-"]').css('display', 'none');
                $('div[id*="todo-' + id + '"]').css('display', '');
            });
        });
        loadMain();
    });

    function loadMain() {
        var showdb = '<%=showdb%>';
        $.ajax({
            url: tool.initParams('<%=basePath%>/s/biz/sysMessage/xxtz'),
            cache: false,
            type: "post",
            dataType: "json",
            error: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            success: function (data) {
                var htm = '';
                var c = 0, a = 0;
                if (data.length > 0) {
                    $(data).each(function (i) {
                        //if(c<10){
                        htm += '<li><a class="todo-actions" style="padding-left: 10px !important;" href="javascript:void(0)" onclick="tool.openview(this,\'<%=basePath%>/s/system/sysMessage/input/' + data[i].wid + '/3\',\'查看消息\')">' +
                            ' <span class="desc">' + data[i].xxbt + '【' + data[i].xxfsbm_str + '】';
                        if (data[i].xxzt == '0') htm += '<font color="red">【未读】</font>'
                        htm += '</span><span title="' + data[i].fxxfssj_str + '" class="label timestamp label-danger"> ' + data[i].fxxfssj_str + '</span></a></li>';
                        // }
                        a++;
                        if (data[i].xxzt == '0') c++;
                    });
                }
                if (a == 0) {
                    htm = '<li><a class="todo-actions" style="padding-left: 10px !important;" href="javascript:void(0)">' +
                        ' <span class="desc">无消息通知</span>  ' +
                        '</a></li>';
                }
                $('#fa-xxtz').html(c);
                if (c > 0) $('#fa-xxtz').removeClass('badge-info').addClass('badge-danger');
                else $('#fa-xxtz').removeClass('badge-danger').addClass('badge-info');
                $('#todo-fa-xxtz').find('ul').html(htm);
            }
        });

        $.ajax({
            url: tool.initParams('<%=basePath%>/s/biz/sysDoc/xxtz'),
            cache: false,
            type: "post",
            dataType: "json",
            error: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            success: function (data) {
                if (data.error != null && data.error != '') {
                    $('#fa-gwlz').parent().parent().remove();
                } else {
                    var htm = '';
                    var c = 0, a = 0;
                    if (data.length > 0) {
                        $(data).each(function (i) {
                            //if(c<10){
                            htm += '<li><a class="todo-actions" style="padding-left: 10px !important;" href="javascript:void(0)" onclick="tool.openview(this,\'<%=basePath%>/s/system/sysDoc/input/' + data[i].wid + '/3\',\'查收公文\')">' +
                                ' <span class="desc">' + data[i].xxfsr_s;
                            if (data[i].xxzt == '0') htm += '<font color="red">【未读】</font>'
                            htm += '</span><span title="' + data[i].xxfssj_s + '" class="label timestamp label-danger"> ' + data[i].xxfssj_s + '</span></a></li>';
                            // }
                            a++;
                            if (data[i].xxzt == '0') c++;
                        });
                    }
                    if (a == 0) {
                        htm = '<li><a class="todo-actions" style="padding-left: 10px !important;" href="javascript:void(0)">' +
                            ' <span class="desc">无公文</span>  ' +
                            '</a></li>';
                    }
                    $('#fa-gwlz').html(c);
                    if (c > 0) $('#fa-gwlz').removeClass('badge-info').addClass('badge-danger');
                    else $('#fa-gwlz').removeClass('badge-danger').addClass('badge-info');
                    $('#todo-fa-gwlz').find('ul').html(htm);
                }
            }
        });

        if (showdb == '1') {
            $.ajax({
                url: tool.initParams('<%=dburl%>'),
                cache: false,
                type: "post",
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                success: function (data) {
                    var htm = '';
                    var a = 0;
                    if (data.length > 0) {
                        $(data).each(function (i) {
                            var path = data[i].node;
                            if (path == null || path == '' || path == 'null') path = '<%=basePath%>/';
                            //if(a<10){
                            htm += '<li><a class="todo-actions" style="padding-left: 10px !important;" href="javascript:void(0)" onclick="tool.openview(this,\'' + path + data[i].url + '\',\'' + data[i].ywmc + '\')">' +
                                ' <span class="desc">' + data[i].descr;
                            htm += '</span> ' +
                                '</a></li>';
                            // }
                            a++;
                        });
                    }
                    if (a == 0) {
                        htm = '<li><a class="todo-actions" style="padding-left: 10px !important;" href="javascript:void(0)">' +
                            ' <span class="desc">无待办事项</span>  ' +
                            '</a></li>';
                    }
                    $('#fa-dbrw').html(a);
                    if (a > 0) $('#fa-dbrw').removeClass('badge-info').addClass('badge-danger');
                    else $('#fa-dbrw').removeClass('badge-danger').addClass('badge-info');
                    $('#todo-fa-dbrw').find('ul').html(htm);
                }
            });
        }
    }
    function isRefresh() {
        loadMain();
        return false;
    }
</script>
</body>
</html>