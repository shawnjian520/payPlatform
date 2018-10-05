<%@page import="com.jd.system.entity.TSysInit" %> 
<%@page import="com.jd.util.CacheEnum" %>
<%@page import="com.jd.support.cache.CacheUtils" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>支付平台系统</title>
    <meta charset="utf-8"/>
    <meta http-equiv='X-UA-Compatible' content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" href="<%=basePath%>/resources/css/login.css">
    <!-- end: MAIN CSS -->
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body class="login">
<img name="login" id="login" src="" style="display:none"/>
<div class="main-login">
    <!-- start: 登录 -->
    <div class="box-login">
        <form id="form-login" class="form-horizontal form-login">
            <fieldset id="login-input">
                <h3 class="logo" data-localize="login_main.b">支付平台系统</h3>
                <p class="tips" data-localize="login_main.c">请输入您的用户名密码登陆</p>
                <input type="hidden" name="returl" id="returl">
                <div class="alert alert-danger alert-dismissible" role="alert" style="display: none"></div>
                <div class="form-group">
                    <span class="input-icon">
                        <input type="text" id="userloginid" name="userloginid" class="form-control validate[required]"
                               placeholder="用户名">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <div class="form-group form-actions">
                    <span class="input-icon">
                         <input type="password" placeholder="密码" name="userpwd" onkeydown="ys_onkeydown(2,event)"
                                id="userpwd" class="form-control password validate[required]">
                        <i class="fa fa-lock"></i>
                        <a class="forgot" data-localize="login_main.d" href="#"> 忘记密码</a>
                    </span>
                </div>
                <div class="form-actions">
                    <label for="remember" class="checkbox-inline">
                        <input type="checkbox" class="grey remember" id="remember" name="remember">
                        <span data-localize="login_main.a">记住我的登陆信息</span>
                    </label>
                </div>
                <div class="form-actions">
                    <button type="button" id="loginbutton" onclick="ajaxLogin()" class="btn btn-block btn-primary">
                        <span data-localize="login_main.e">登录</span> <i class="fa fa-arrow-circle-right"></i>
                    </button>
                </div>
                <div class="new-account">
                    <%--您还没有账户?<a href="#" class="register">点击注册</a>--%>
                </div>
            </fieldset>

            <fieldset id="login-role" style="display:none;">
                <h3 class="logo" data-localize="login_main.b"><%=((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getSfmc() %></h3>
                <p class="tips">请点击下方任意角色登录</p>
                <ul class="role-list"></ul>
            </fieldset>
        </form>

        <!-- start: COPYRIGHT -->
        <div class="copyright" data-localize="login_main.f">
            &copy; 南京君度科技有限公司
        </div>
        <div class="copyright" data-localize="login_main.f">
            v 2.0
        </div>
        <!-- end: COPYRIGHT -->
    </div>
    <!-- end: 登录 -->
</div>

<!-- start: MAIN JAVASCRIPTS -->
<script src="<%=basePath%>/resources/plugins/jQuery/jquery-1.2.3.min.js"></script>
<script src="<%=basePath%>/resources/js/userlogin.js"></script>
<!--[if lt IE 8]>
<script>
    $.get('<%=basePath%>/jr/index.jsp', function (data) {
        $('body:first').html($(data));
    });
</script>
<![endif]-->
<script>
    var basePath = '<%=basePath%>';
    function inithtm(data) {
        var _html = '';
        $(data).each(function (a) {
            _html += '<li><a class="btn role-btn btn-primary btn-block" onclick="login_suc(\'' + data[a].id + '\')">' + data[a].caption + '</a></li>';
        });
        _html += '<li><a class="btn role-btn btn-danger btn-block" onclick="backLogin()">返回上层</a></li>';
        $('#login-input').hide();
        $('.role-list').html(_html);
        $('#login-role').show();
    }
    function errortit(obj) {
        showErrorInfo(obj.msg);
        $('#login-role').hide();
        $('#login-input').show();
        $('#loginbutton').html('登录 <i class="fa fa-arrow-circle-right"></i>');
    }
    function ys_onkeydown(num, event) {
        if (num == 0 && (event.keyCode == 13 )) {
            document.getElementById("userpwd").focus();
        } else if (num == 1 && (event.keyCode == 13 )) {
            document.getElementById("yzm").focus();
        } else if (num == 2 && (event.keyCode == 13 )) {
            ajaxLogin();
        }
    }
</script>
<script> var isIe8 = false; </script>
<!--[if lt IE 8]>
<script>
    isIe8 = true;
    //如果低于IE8版本,跳转到兼容性提示页面
    $.get('<%=basePath%>/jr/index.jsp', function (data) {
        $('body:first').html($(data));
    });
</script>
<![endif]-->
</body>
</html>