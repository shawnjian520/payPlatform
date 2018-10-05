<%@page import="com.jd.system.Const"%> 
<%@page import="com.jd.system.util.LoginUtil"%>
<%@page import="com.jd.util.CasLoginUtil" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.jd.system.entity.*" %>
<%@page import="com.jd.support.cache.CacheUtils" %>
<%@page import="com.jd.system.entity.TSysInit" %>
<%@ page import="com.jd.util.CacheEnum" %>
<%@ page import="com.jd.util.ClientUtil" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jd.util.StringUtil" %>
<%@ page import="com.jd.identity.entity.TSysMenu" %>
<%@ page import="com.jd.identity.entity.TSysUser" %>
<%
	String jundutag = (String)request.getAttribute("jundutag");
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
    request.setAttribute("basePath", basePath);
    TSysUser tsysUser = null;
    if(StringUtil.isNotBlank(jundutag) && LoginUtil.getloginuser(request)==null){
    	tsysUser = (TSysUser) LoginUtil.getloginuser1(request, response, jundutag);
    }else{
    	tsysUser = (TSysUser) LoginUtil.getloginuser(request);
    }
    TSysDepart tdepart = tsysUser.getDepart();
    String userName = tsysUser.getUsername();
    boolean stageMenu = "1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getStagemenu());
    if (tsysUser!=null && tsysUser.getStudentAccount()!=null) {
        stageMenu = false;
    }
    boolean showAllStageMenu = "1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getShowallstagemenu());
    boolean showAllLeftStageMenu = "1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getShowallleftstagemenu());
    boolean tabModel = "1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getTabModels());
    List<TSysMenu> tsysMenues = tsysUser.getTsysMenues();;
%>
<!DOCTYPE html>
<html lang="en">
<!-- start: HEAD -->
<head>
    <title>支付平台系统</title>
    <meta charset="utf-8"/>
    <meta http-equiv='X-UA-Compatible' content="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" href="${ctx}/resources/plugins/bootstrap/bootstrap-custom-home/css/bootstrap.min.css">
    <%@include file="../../common/plugins/css/font-awesome.jsp" %>
    <%@include file="../../common/plugins/css/perfect-scrollbar.jsp" %>
    <%@include file="../../common/plugins/css/sweetalert.jsp" %>
    <link rel="stylesheet" href="${ctx}/resources/css/index.min.css">
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
        var stageMenu = <%=stageMenu%>;//分阶段菜单
        var tabModel = <%=tabModel%>;//是否启用Tab页
        var showAllStageMenu = <%=showAllStageMenu%>;//只显示有菜单的阶段菜单
        var showAllLeftStageMenu = <%=showAllLeftStageMenu%>;//只显示有菜单的阶段菜单
    </script>
</head>
<!-- end: HEAD -->
<body class="single-page">
<!--[if lt IE 10]>
    <script>
        //如果低于IE8版本,跳转到兼容性提示页面
		$.get('<%=basePath%>/jr/index.jsp',function(data){
			$('body:first').html($(data));
		});
    </script>
    <![endif]-->
<input type="hidden" id="menuid_manage" name="menuid_manage" value=""/>
<input type="hidden" id="updepartid_manage" name="updepartid_manage" value="<%=tdepart.getUpdepartid()%>"/>
<!-- end:  滑动层 上 -->
<div class="main-wrapper">
    <div class="topbar navbar navbar-inverse navbar-fixed-top inner">
        <!-- start: 顶部容器 -->
        <div class="container">
            <div class="navbar-header">
                <a class="sb-toggle-left hidden-md hidden-lg hidden-xl hidden-xxl hidden-xxxl" href="#main-navbar">
                    <i class="fa fa-bars"></i>
                </a>
                <!-- start: LOGO -->
                <a class="navbar-brand" href="${ctx}/identity/index.action">
                    <%--<%--%>
                        <%--String headerimg = ((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getHeader();--%>
                        <%--String headerimgmb = ((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getHeadermb();--%>
                        <%--if (StringUtil.isNotBlank(headerimg)) {--%>
                            <%--if (headerimg.indexOf("http://") ==-1) {--%>
                                <%--headerimg = request.getScheme() + "://"--%>
                                        <%--+ request.getServerName() + ":" + request.getServerPort() + headerimg;--%>
                            <%--}--%>
                            <%--out.print("<img class=\"hidden-xs\" style=\"margin-top: 11px;\" src=\"" + headerimg + "\" />");--%>
                        <%--}--%>
                        <%--if (StringUtil.isNotBlank(headerimgmb)) {--%>
                        	<%--if (headerimgmb.indexOf("http://") ==-1) {--%>
                                <%--headerimgmb = request.getScheme() + "://"--%>
                                        <%--+ request.getServerName() + ":" + request.getServerPort() + headerimgmb;--%>
                            <%--}--%>
                            <%--out.print("<img class=\"hidden-xxxl hidden-xxl hidden-xl hidden-lg hidden-md hidden-sm\" style=\"margin-top: 16px;\" src=\"" + headerimgmb + "\" />");--%>
                        <%--}--%>
                    <%--%>--%>
                </a>
                <!-- end: LOGO -->
            </div>
            <div class="topbar-tools">
                <%
                    if ("1".equals(ClientUtil.getString(Const.hashead))) {
                    String loginurl = ((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getLoginurl();
                %>
                <iframe style="border: 0px;height: 40px;" class="pt5"
                        src="<%=loginurl.replace(".jsp", "_head.jsp")%>"></iframe>
                <%
                    }
                %>
                <!-- start: 顶部菜单 -->
                <ul class="nav navbar-right">
                    <!-- start: 用户下拉选项 -->
                    <li class="dropdown current-user">
                        <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true"
                           href="javascript:void(0)" id="times_login">

                        </a>
                    </li>
                    <li class="dropdown current-user">
                        <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true"
                           href="javascript:void(0)">
                            <span class="username"><%=userName%></span> <i class="fa fa-caret-down "></i>
                        </a>
                        <ul class="dropdown-menu dropdown-dark" id="changerole">
                            <li>
                                <a href="javascript:void(0)" class="home-btn" data-localize="jdframe.b">个人中心</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="visible-xs-block" data-localize="jdframe.a"
                                   onclick="execLogout()">退出</a>
                            </li>
                        </ul>
                    </li>
                    <li>

                    </li>
                    <li class="dropdown current-user hidden-xs">
                        <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true"
                           href="javascript:void(0)" onclick="execLogout()">
                            <span class="username" data-localize="jdframe.a">退出</span>
                        </a>
                    </li>
                    <!-- end: 用户下拉选项 -->
                    <li class="right-menu-toggle">
                        <a href="javascript:void(0)" class="sb-toggle-right">
                            <i class="fa fa-desktop toggle-icon"></i>
                        </a>
                    </li>
                </ul>
                <!-- end: 顶部菜单 -->
            </div>
        </div>
        <!-- end: 顶部容器 -->
    </div>
    <!-- start:  滑动层 左️ -->
    <a class="closedbar inner hidden-sm hidden-xs" href="javascript:void(0)">
    </a>
    <nav id="pageslide-left" class="pageslide inner">
        <div class="navbar-content">
            <div class="user-profile border-top padding-horizontal-10 block">
                <div class="row">
                    <div class="col-xs-10 no-stage-menu">
                        <div class="btn-group stage-menu-btn-group">
                            <a href="javascript:void(0)" class="btn dropdown-toggle home-btn">
                                <i class="fa fa-home stage-menu-i"></i>
                                <font data-localize="jdframe.b">个人中心</font>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-10 stage-menu-box hide">
                        <div class="btn-group stage-menu-btn-group">
                            <a href="javascript:void(0)" data-toggle="dropdown" class="btn dropdown-toggle" style="padding: 0"></a>
                            <ul class="dropdown-menu" role="menu"></ul>
                        </div>
                    </div>

                    <div class="col-xs-2 sb-toggle">
                        <a class="btn btn-sm user-options sb_toggle sb-toggle-left">
                            <i class="fa fa-ellipsis-v"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="main-navigation left-wrapper transition-left">
                <!-- start: 菜单 -->
                <ul class="main-navigation-menu"></ul>
                <!-- end: 菜单 -->
            </div>
        </div>
    </nav>
    <!-- end: 滑动层 左 -->
    <!-- start: 滑动层 右 -->
    <div id="pageslide-right" class="pageslide slide-fixed inner">
        <div class="right-wrapper">
            <div id="style_selector">
                <div id="style_selector_container">
                    <div class="pageslide-title" data-localize="jdframe.e">
                        系统主题
                    </div>
                    <div class="box-title" data-localize="jdframe.k">
                        颜色方案
                    </div>
                    <div class="images icons-color">
                        <a href="javascript:void(0)" id="default">
                            <div class="style-btn style-01 active">
                                <div class="style-title"></div>
                                <div class="style-body"></div>
                            </div>
                        </a>
                        <a href="javascript:void(0)" id="style2">
                            <div class="style-btn style-02">
                                <div class="style-title"></div>
                                <div class="style-body"></div>
                            </div>
                        </a>
                    </div>
                    <div class="style-options">
                        <button type="button" class="btn btn-xs clear_style btn-primary" data-localize="jdframe.l">
                            恢复默认
                        </button>
                        <button type="button" class="btn btn-xs save_style btn-primary" data-localize="jdframe.m">
                            保存主题
                        </button>
                    </div>
                </div>
                <div class="style-toggle open">
                </div>
            </div>
        </div>
    </div>
    <!-- end: 滑动层 右 -->
    <!-- start: 主体内容 -->
    <div class="main-container inner">
        <!-- start: 页面 -->
        <div class="main-content">
            <div class="container">
                <!-- start: 页面标题 -->
                <!-- start: 工具 -->
                <div id="toolbar" class="toolbar">
                    <div class="col-xs-10">
                        <div id="stage-menu" class="page-header"></div>
                    </div>
                    <div class="col-xs-2">
                        <a href="javascript:void(0)" class="back-subviews">
                            <i class="fa fa-chevron-left"></i> 返回
                        </a>
                        <a href="javascript:void(0)" class="close-subviews">
                            <i class="fa fa-times"></i> 关闭
                        </a>

                        <div class="toolbar-tools pull-right">
                            <!-- start: 顶部常用功能&消息 -->
                            <ul class="nav navbar-right"></ul>
                            <!-- end: 顶部常用功能&消息 -->
                        </div>
                    </div>
                </div>
                <!-- end: 工具 -->
                <!-- end: 页面标题 -->
                <!-- str: tab开始 -->
                <div class="content-tabs">
                    <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-angle-double-left"></i></button>
                    <nav class="page-tabs J_menuTabs">
                        <div class="page-tabs-content"></div>
                    </nav>
                    <button class="roll-nav roll-right J_tabRight"><i class="fa fa-angle-double-right"></i></button>
                    <div class="btn-group roll-nav roll-right">
                        <button class="dropdown J_tabClose" data-toggle="dropdown"><span class="caret"></span>
                        </button>
                        <ul role="menu" class="dropdown-menu dropdown-menu-right">
                            <li class="J_tabShowActive"><a data-localize="frame_button.fixed">定位当前选项卡</a></li>
                            <li class="divider"></li>
                            <li class="J_tabCloseAll"><a data-localize="frame_button.closeall">关闭全部选项卡</a></li>
                            <li class="J_tabCloseOther"><a data-localize="frame_button.closeother">关闭其他选项卡</a></li>
                        </ul>
                    </div>
                </div>
                <!-- str: 结束 -->
                <!-- start: ajax 容器 -->
                <div class="J_mainContent" id="content-main"></div>
                <div id="ajax-content" class="animated"></div>
                <!-- end: ajax 容器-->
            </div>
            <!-- start: subview 容器 -->
            <div class="subviews">
                <div class="subviews-container"></div>
            </div>
            <!-- end: subview 容器 -->
        </div>
        <!-- end: 页面 -->
    </div>
    <!-- end: 主体内容 -->
    <!-- start: export-iframe -->
    <iframe id="export-iframe" class="hide"></iframe>
    <!-- end: export-iframe -->
    <div class="panel panel-white wait-tip hide">
        <div class="panel-body">
            <i class="fa fa-circle-o-notch fa-spin"></i> 数据加载中,请稍候...
        </div>
    </div>
    <div class="modal-backdrop fade in hide" style="z-index: 1050;"></div>
</div>
<iframe id="iframedownload" name="iframedownload" class="hide"></iframe>
<img class="image-preview hide">
<div id="importload_back" style="display: none;"></div>
<div id="importload" style="display: none;">
    <div style="width: 100%;float: left;height: 40px;line-height: 40px;border-bottom: 2px solid #cccccc;">
        <div style="float: left;color: #448db8;font-size: 16px;font-weight: bold;padding-left: 15px;">导入数据</div>
        <div style="float: right;color: #a2a2a2;font-size: 14px;padding-right: 15px;">窗口数据导入完成之后自动关闭</div>
    </div>
    <div id="importcontent" style="width: 350px;float: left;margin-top: 10px;padding-left: 20px;">
        &nbsp;
    </div>
    <div style="float: left;margin-top: 10px;padding-top:50px;padding-left: 10px;">
        <img src="<%=basePath %>/resources/images/sysimport.gif"/>
    </div>
</div>
<div id="loader-wrapper">
    <div class="sk-double-bounce">
        <div class="sk-child sk-double-bounce1"></div>
        <div class="sk-child sk-double-bounce2"></div>
    </div>
    <h4></h4>
</div>
<!-- start: 必要脚本 -->
<script src="${ctx}/resources/plugins/bootstrap/bootstrap-custom-home/js/bootstrap.min.js"></script>
<%@include file="../../common/plugins/js/jquery.cookie.jsp" %>
<!-- 滚动条 -->
<%@include file="../../common/plugins/js/perfect-scrollbar.jsp" %>
<!-- 弹框 -->
<%@include file="../../common/plugins/js/sweetalert.jsp" %>
<!-- 移动端 -->
<%@include file="../../common/plugins/js/touchSwipe.jsp" %>
<%@include file="../../common/plugins/js/jquery.velocity.jsp" %>
<!-- 框架 -->
<script src="${ctx}/resources/js/main.min.js"></script>
<script src="${ctx}/resources/js/frame-tool.min.js"></script>
<script src="${ctx}/resources/js/tool.min.js"></script>
<script src="${ctx}/resources/js/language.js"></script>
<script src="${ctx}/resources/js/syscode.js"></script>
<script type="text/javascript">
    /*查询显示中英文--start*/
    function getCookie(name) {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]);
        return null;
    }
    var grzxstr = "";//个人中心
    var isquit = "";//确定要退出吗?
    var cookielang = getCookie("jdLanguage");
    if (cookielang == "en") {
        grzxstr = "Personal Center";
        isquit = "Are you sure you want to quit?";
    } else {
        grzxstr = "个人中心";
        isquit = "确定要退出吗?";
    }
    /*查询显示中英文--end*/
    
    var haveStudySec = false;//首页是分阶段菜单
    var sysCode = codes.getSysCodeByZdlb('topStageMenu_code_html');
    
    var home_url = '<%=ClientUtil.getString("main.home.url")%>';
    if (home_url == null || home_url == '') {
       	  home_url = basePath + '/s/id/idUser/personCenter';
    }
    $(document).ready(function () {
        $('body').addClass('loaded');//关闭加载层
        tool.loginUser = {
            "userName": "<%=tsysUser.getUsername()%>",
            "departName": "<%=tsysUser.getDepart().getDepartname()%>",
            "departType": "<%=tsysUser.getDepart().getDeparttype()%>",
            "departId": "<%=tsysUser.getDepart().getDepartid()%>",
            "userLoginId": "<%=tsysUser.getUserloginid()%>"
        }
        tool.userloginid = '<%=tsysUser.getUserloginid()%>';
        tool.usertype = '<%=tsysUser.getUsertype()%>';
        Main.init();
        if (stageMenu) {
            loadStageMenuCookie();
        }
        var $contentMain = $('#content-main');
        //tabmodel && 不分阶段菜单
        var isIE8 = false;
        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
            var ieversion = new Number(RegExp.$1);
            if (ieversion <= 8) {
                isIE8 = true;
            }
        }
        if (!stageMenu) {
            if (isIE8) {
                var e = window, a = 'inner';
                if (!('innerWidth' in window )) {
                    a = 'client';
                    e = document.documentElement || document.body;
                }
                $('.main-container').height(e[a + 'Height'] - 50);
            }
            $('.toolbar').remove();
            if (isIE8) {
                $contentMain.css('height', $contentMain.parent().height() - 38);
            } else {
                $contentMain.css('height', 'calc(100% - 40px)');
            }
        } else {
            if (isIE8) {
                $contentMain.css('height', $contentMain.parent().height() - 78);
            } else {
                $contentMain.css('height', 'calc(100% - 80px)');
            }
        }
        $('.home-btn').off('click').click(function () {
            addTab(home_url, 1, grzxstr, false);
        });
        addTab(home_url, 1, grzxstr, false);

        //加载菜单
        var temp = $.parseJSON('<%= JSONArray.fromObject(tsysMenues)%>');
        var ispush = false;
        //整理格式
        if (temp != null && temp.length > 0) {
            tool.menuList = [];
            for (var i = 0; i < temp.length; i++) {
                ispush = false;
                if (temp[i].depth == '2') {//一级菜单
                    tool.menuList.push(temp[i]);
                } else if (temp[i].depth == '3') {//二级菜单
                    for (var j = 0; j < tool.menuList.length; j++) {
                        if (tool.menuList[j].menuid == temp[i].upmenuid) {
                            tool.menuList[j].chlid.push(temp[i]);
                            ispush = true;
                        }
                    }
                    if (!ispush) {
                        tool.menuList.push(temp[i]);
                    }
                } else if (temp[i].depth == '4') {//三级菜单
                    for (var j = 0; j < tool.menuList.length; j++) {
                        if (temp[i].upmenuid.substr(0, tool.menuList[j].menuid.length) == tool.menuList[j].menuid) {
                            for (var n = 0; n < tool.menuList[j].chlid.length; n++) {
                                if (tool.menuList[j].chlid[n].menuid == temp[i].upmenuid) {
                                    tool.menuList[j].chlid[n].chlid.push(temp[i]);
                                    ispush = true;
                                }
                            }
                            if (!ispush) {
                                tool.menuList.push(temp[i]);
                            }
                        }
                    }
                } else if (temp[i].depth == '5') {//四级菜单
                    for (var j = 0; j < tool.menuList.length; j++) {
                        if (temp[i].upmenuid.substr(0, tool.menuList[j].menuid.length) == tool.menuList[j].menuid) {//检查菜单是否属于该一级菜单
                            for (var n = 0; n < tool.menuList[j].chlid.length; n++) {
                                if (temp[i].upmenuid.substr(0, tool.menuList[j].chlid[n].menuid.length) == tool.menuList[j].chlid[n].menuid) {//检查菜单是否属于当前检查菜单二级菜单
                                    for (var m = 0; m < tool.menuList[j].chlid[n].chlid.length; m++) {
                                        if (tool.menuList[j].chlid[n].chlid[m].menuid == temp[i].upmenuid) {
                                            tool.menuList[j].chlid[n].chlid[m].chlid.push(temp[i]);
                                            ispush = true;
                                        }
                                    }
                                }
                            }
                            if (!ispush) {
                                tool.menuList.push(temp[i]);
                            }
                        }
                    }
                }
            }
        }
        if (!stageMenu) {
            loadMenuByStageMenu();
        }
        if (stageMenu) {//分阶段菜单
            $('.no-stage-menu').hide();
            $('.stage-menu-box').removeClass('hide');
            //加载顶部菜单
            if (sysCode != null && sysCode.length > 0) {
                $('#stage-menu').html('<ul class="stage-menu"></ul>');
                for (var i = 0; i < sysCode.length; i++) {
                    for (var j = 0; j < tool.menuList.length; j++) {
                        if (showAllStageMenu || (tool.menuList[j].topStageMenu != null && tool.menuList[j].topStageMenu.indexOf(sysCode[i].id) > -1)) {
                            $('#stage-menu ul').append('<li><a data-id="' + sysCode[i].id + '" href="javascript:void(0)">' + sysCode[i].value + '</a></li>');
                            break;
                        }
                    }
                }
                $('.stage-menu a').click(function () {
                    $('.stage-menu a').removeClass('active');
                    $(this).addClass('active');
                    tool.choseTopStageMenu = $(this).attr('data-id');
                    loadLeftCode();
                });
                if (tool.choseTopStageMenu != '' && $('#stage-menu ul a[data-id="' + tool.choseTopStageMenu + '"]').length != 0) {
                    $('#stage-menu ul a[data-id="' + tool.choseTopStageMenu + '"]').click();
                } else {
                    $('#stage-menu ul a:eq(0)').click();
                }
            }
        } else {
            // $('.current-user').hide();
        }
        initrole();
    });
    //加载左侧菜单
    function loadLeftCode() {
        $('.stage-menu-btn-group .dropdown-menu').html('');
        if (tool.leftStageMenuList == null || tool.leftStageMenuList.length <= 0) {
            $.ajax({
                url: basePath + '/s/ajax/getStudySection',
                type: "post",
                dataType: "json",
                success: function (_sysCode) {
                    tool.leftStageMenuList = _sysCode;
                    initLeftMenu();
                }
            });
        } else {
            initLeftMenu();
        }
    }
    function initLeftMenu() {
        haveStudySec = false;
        if (tool.choseTopStageMenu != '1') {//如果是首页,检查首页下所有顶级菜单有无勾选学段信息
            for (var j = 0; j < tool.menuList.length; j++) {
                if (!isBlank(tool.menuList[j].leftStageMenu)) {
                    haveStudySec = true;
                }
            }
        } else {
            haveStudySec = false;
        }
        if (tool.leftStageMenuList != null && tool.leftStageMenuList.length > 0 && haveStudySec) {
            for (var i = 0; i < tool.leftStageMenuList.length; i++) {
                for (var j = 0; j < tool.menuList.length; j++) {
                    if (!showAllLeftStageMenu || (tool.menuList[j].topStageMenu.indexOf($('#stage-menu').find('a.active').attr('data-id')) > -1 && tool.menuList[j].leftStageMenu.indexOf(tool.leftStageMenuList[i].zdbm) > -1)) {
                        $('.stage-menu-btn-group .dropdown-menu').append('<li><a data-id="' + tool.leftStageMenuList[i].zdbm + '" href="javascript:void(0)"><i class="' + tool.leftStageMenuList[i].notes + ' pr10"></i>' + tool.leftStageMenuList[i].zdmc + '</a></li>');
                        break;
                    }
                }
            }

            $('.stage-menu-btn-group .dropdown-menu a').click(function () {
                tool.choseLeftStageMenu = $(this).attr('data-id');
                $('.stage-menu-btn-group > a').html($(this).html() + ' <span class="caret"></span>');
                $('.stage-menu-btn-group > a > i').addClass('stage-menu-i');
                loadMenuByStageMenu();
            });
            //默认选中上一个学段
            if (tool.choseLeftStageMenu != '' && $('.stage-menu-btn-group ul a[data-id="' + tool.choseLeftStageMenu + '"]').length != 0) {
                $('.stage-menu-btn-group ul a[data-id="' + tool.choseLeftStageMenu + '"]').click();
            } else {
                $('.stage-menu-btn-group ul a:eq(0)').click();
            }
        }
        if (!haveStudySec) {
            $('.stage-menu-btn-group > a').html('<i class="fa fa-home pr10 stage-menu-i"></i> ' + grzxstr);
            $('.stage-menu-btn-group > a > i').addClass('stage-menu-i');
            loadMenuByStageMenu();
            if (tabModel) {
                $('.stage-menu-btn-group > a').click(function () {
                    if (!haveStudySec) {
                        addTab(home_url, 1, grzxstr, false);
                    }
                });
            } else {
                $('.stage-menu-btn-group > a').click(function () {
                    if (!haveStudySec) {
                        Main.ajaxLoaderUrl(home_url, null, grzxstr, '个人信息、日程安排、消息提醒');
                    }
                });
            }
        }
    }
    /**
     * 将选择的阶段菜单放到cookie
     */
    function setStageMenuCookie() {
        var _stageMenu = new Object;
        _stageMenu.choseLeftStageMenu = tool.choseLeftStageMenu;
        _stageMenu.choseTopStageMenu = tool.choseTopStageMenu;
        $.cookie("_stage_menu_" + tool.loginUser.userLoginId, JSON.stringify(_stageMenu), {expires: 365, path: '/'});
    }
    /**
     * 加载cookie中存放的用户上次选择阶段菜单
     */
    function loadStageMenuCookie() {
        if ($.cookie) {
            if ($.cookie("_stage_menu_" + tool.loginUser.userLoginId)) {
                var _stageMenu = jQuery.parseJSON($.cookie("_stage_menu_" + tool.loginUser.userLoginId));
                tool.choseLeftStageMenu = _stageMenu.choseLeftStageMenu;
                tool.choseTopStageMenu = _stageMenu.choseTopStageMenu;
            }
        }
    }
    /**
     * 根据选择的阶段加载菜单
     */
    function loadMenuByStageMenu() {
        if (stageMenu) {
            setStageMenuCookie();
        }
        $('.main-navigation-menu').html('loading...');
        var nav_html = '';
        if (tool.menuList != null && tool.menuList.length > 0) {
            for (var i = 0; i < tool.menuList.length; i++) {
                if (!stageMenu || (tool.menuList[i].leftStageMenu.indexOf(tool.choseLeftStageMenu) > -1 &&
                        tool.menuList[i].topStageMenu.indexOf(tool.choseTopStageMenu) > -1) ||
                        (!haveStudySec && tool.menuList[i].topStageMenu.indexOf(tool.choseTopStageMenu) > -1)) {
                    if (tool.menuList[i].chlid != null && tool.menuList[i].chlid.length > 0) {//如果有子菜单
                        //一级菜单
                        nav_html += '<li><a href="javascript:void(0)"><i class="' + tool.menuList[i].menuicon + '"></i><span class="title">' + tool.menuList[i].menuname + '</span><i class="icon-arrow"></i></a><ul class="sub-menu">';
                        nav_html += '<li><a class="min-title" href="javascript:void(0)"><span class="title">' + tool.menuList[i].menuname + '</span></a></li>';
                        for (var j = 0; j < tool.menuList[i].chlid.length; j++) {
                            if (!stageMenu || (tool.menuList[i].chlid[j].leftStageMenu.indexOf(tool.choseLeftStageMenu) > -1 && tool.menuList[i].chlid[j].topStageMenu.indexOf(tool.choseTopStageMenu) > -1) ||
                                    (!haveStudySec && tool.menuList[i].chlid[j].topStageMenu.indexOf(tool.choseTopStageMenu) > -1)) {
                                if (tool.menuList[i].chlid[j].chlid != null && tool.menuList[i].chlid[j].chlid.length > 0) {
                                    //二级菜单
                                    nav_html += '<li><a href="javascript:void(0)"><span class="title">' + tool.menuList[i].chlid[j].menuname + '</span><i class="icon-arrow"></i></a><ul class="sub-menu">';
                                    for (var n = 0; n < tool.menuList[i].chlid[j].chlid.length; n++) {
                                        if ((tool.menuList[i].chlid[j].chlid[n].leftStageMenu.indexOf(tool.choseLeftStageMenu) > -1 &&
                                                tool.menuList[i].chlid[j].chlid[n].topStageMenu.indexOf(tool.choseTopStageMenu) > -1 ) ||
                                                (!haveStudySec && tool.menuList[i].chlid[j].chlid[n].topStageMenu.indexOf(tool.choseTopStageMenu) > -1 ) || !stageMenu) {
                                            //三级菜单
                                            if (tool.menuList[i].chlid[j].chlid[n].chlid != null && tool.menuList[i].chlid[j].chlid[n].chlid.length > 0) {
                                                nav_html += '<li><a href="javascript:void(0)"><span class="title">' + tool.menuList[i].chlid[j].chlid[n].menuname + '</span><i class="icon-arrow"></i></a><ul class="sub-menu">';
                                                //四级菜单
                                                for (var m = 0; m < tool.menuList[i].chlid[j].chlid[n].chlid.length; m++) {
                                                    nav_html += '<li><a class="J_menuItem" data-index="' + tool.menuList[i].chlid[j].chlid[n].chlid[m].menuid + '" href="' + getMenuBasePath(tool.menuList[i].chlid[j].chlid[n].chlid[m]) + '" menuid="' + tool.menuList[i].chlid[j].chlid[n].chlid[m].menuid + '"><span class="title">' + tool.menuList[i].chlid[j].chlid[n].chlid[m].menuname + '</span></a></li>';
                                                }
                                                nav_html += '</ul></li>';
                                            } else {
                                                nav_html += '<li><a class="J_menuItem" data-index="' + tool.menuList[i].chlid[j].chlid[n].menuid + '" href="' + getMenuBasePath(tool.menuList[i].chlid[j].chlid[n]) + '" menuid="' + tool.menuList[i].chlid[j].chlid[n].menuid + '"><span class="title">' + tool.menuList[i].chlid[j].chlid[n].menuname + '</span></a></li>';
                                            }
                                        }
                                    }
                                    nav_html += '</ul></li>';
                                } else {
                                    nav_html += '<li><a class="J_menuItem" data-index="' + tool.menuList[i].chlid[j].menuid + '" href="' + getMenuBasePath(tool.menuList[i].chlid[j]) + '" menuid="' + tool.menuList[i].chlid[j].menuid + '"><span class="title">' + tool.menuList[i].chlid[j].menuname + '</span></a></li>';
                                }
                            }
                        }
                        nav_html += '</ul></li>';
                    } else {
                        nav_html += '<li><a class="J_menuItem" data-index="' + tool.menuList[i].menuid + '" href="' + getMenuBasePath(tool.menuList[i]) + '" menuid="' + tool.menuList[i].menuid + '"><i class="' + tool.menuList[i].menuicon + '"></i><span class="title">' + tool.menuList[i].menuname + '</span></a></li>';
                    }
                }
            }
        }
        $('.main-navigation-menu').html(nav_html);
        Main.runNavigationMenu();
    }

    /**
     * 获取菜单访问地址
     * @param menu 菜单 object
     * @returns {string} url
     */
    function getMenuBasePath(menu) {
        if (isBlank(menu.nodeid)) {
            return basePath + menu.menupath;
        } else {
            return menu.nodeid + menu.menupath;
        }
    }
     /*切换角色--start*/
    function initrole() {//初始化用户所有角色
        $.post('<%=basePath %>/s/ajax/getuserdepart', {'userloginid': '<%=tsysUser.getUserloginid()%>'}, function (data) {
            var i = 0;
            var htm = '';
            $(data).each(function (a) {
                i++;
                if (data[a].id != '<%=tsysUser.getUserid()%>')
                    htm += '<li>' +
                            '<a href="javascript:void(0)" onclick="changerole(\'' + data[a].id + '\')" class="home-btn" data-localize="jdframe.b">切换至' + data[a].caption + '</a>' +
                            '</li>';
            });
            if (i > 1) {
                $('#changerole').find('li:first').after(htm);
            }
        });

    }

    function changerole(userid) {
        $.post('<%=basePath %>/identity/ajaxlogin.action', {
            'loginType': '',
            'act': 'ln_changge',
            'userloginid': '<%=tsysUser.getUserloginid()%>',
            'userpwd': 'woshimima',
            'userid': userid
        }, function (data) {
            window.location.href = '<%=basePath %>/identity/index.action';
        });

    }
    /*切换角色--end*/

    /*登录帆软报表--start*/
    function loginfr() {
        var fr_path = '<%=ClientUtil.getString("fr.path")%>';
        if (fr_path == '' || fr_path == null || fr_path == 'null') {
            return false;
        }
        $.ajax({
            url: fr_path + "?op=fr_auth&cmd=sso",//单点登录的报表服务器
            dataType: "jsonp",//跨域采用jsonp方式
            data: {"username": "<%=tsysUser.getUserloginid()%>", "password": "<%=tsysUser.getUserpwd()%>"},//获取用户名密码
            jsonp: "callback",
            timeout: 5000,//超时时间（单位：毫秒）
            success: function (data) {
                if (data.status === "success") {
                    //登录成功
                    $('#fr_login').val('登陆成功');
                } else if (data.status === "fail") {
                    //登录失败（用户名或密码错误）
                    $('#fr_login').val('登录失败（用户名或密码错误）');
                }
            },
            error: function () {
                // 登录失败（超时或服务器其他错误）
                $('#fr_login').val('登录失败');
            }
        });
    }
    loginfr();
    /*登录帆软报表--end*/
   
    /*是否控制用户最大在线时间--start*/
    var times_login;
    var times_login_time_s = '${times}';
    var times_login_time = -1;
    function times_login_out() {
        clearTimeout(times_login);
        if (times_login_time == -1) times_login_time = parseInt(times_login_time_s);
        else times_login_time--;
        if (times_login_time == 0) {
        	logOut();
        } else {
            var times_login_time_se = parseInt(times_login_time / 60);
            if (times_login_time_se > 0) {
                var s = '<font color="yellow">当前登录受限：' + times_login_time_se + '分' + times_login_time % 60 + '秒后自动退出</font>';
                $('#times_login').html(s);

            } else {
                var s = '<font color="yellow">当前登录受限：' + times_login_time + '秒后自动退出</font>';
                $('#times_login').html(s);

            }
            $.get(basePath + "/times.jsp", function () {

            });
            times_login = setTimeout('times_login_out()', 1000);
        }
    }
    if (times_login_time_s != '' && times_login_time_s != null) times_login_out();
    /*是否控制用户最大在线时间--end*/
    
    /*退出登录--start*/
    var iscas = <%=CasLoginUtil.isSsoEnabled()%>;
    function execLogout() {
        tool.alertConfirm(isquit, '', function () {
        	logOut();
        });

    }
    function logOut(){
    	 $.get("../identity/ajaxlogin.action?act=logout", {q: (new Date()).getTime(),userloginid:'<%=tsysUser.getUserloginid()%>'}, function (data) {
             data = eval("(" + data + ")");
             if (data.msg == 'success') {
            	 if(iscas && window.location.href.indexOf('index.action')!=-1){
            		 window.location = '<%=CasLoginUtil.getCasServerLogoutUrl()%>';
            	 }else{
	                 window.location = window.location.href;
            		 
            	 }

             } else {
             	tool.alert(data.msg);
             }
         });
    }
    /*退出登录--end*/
</script>
<input id="fr_login" type="hidden"/>
</body>
<!-- end: BODY -->
</html>