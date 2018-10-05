<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<jsp:include page="../../../common/portals-header.jsp"></jsp:include>
<title>说明 | Jd Frame Api</title>
<link rel="stylesheet" href="<%=basePath %>/resources/css/doc.css">
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Jd Frame Api</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="./explanation">说明</a></li>
                <li><a href="./portal">门户</a></li>
                <li><a href="./managementSystem">管理系统</a></li>
                <li class="active"><a href="./components">组件</a></li>
                <li><a href="./javascript">JavaScript插件</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <jsp:include page="api.jsp"></jsp:include>
        </div>
        <div class="col-md-3">
            <nav class="bs-docs-sidebar">
                <ul class="nav bs-docs-sidenav">
                    <li class="active">
                        <a href="#form">表单</a>
                        <ul class="nav">
                            <li class=""><a href="#form-explain">说明</a></li>
                            <li class=""><a href="#form-input">文本框</a></li>
                            <li class=""><a href="#form-select">下拉框</a></li>
                            <li class=""><a href="#form-radio">单选框</a></li>
                            <li class=""><a href="#form-checkbox">复选框</a></li>
                            <li class=""><a href="#form-date">日期插件</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#tab">框架Tab页</a>
                        <ul class="nav">
                            <li class=""><a href="#tab-explain">说明</a></li>
                            <li class=""><a href="#tab-callback">事件</a></li>
                            <li class=""><a href="#tab-add">添加Tab</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#alert">弹出框</a>
                    </li>
                    <li>
                        <a href="#import">导入</a>
                        <ul class="nav">
                            <li class=""><a href="#import-mb">模板配置</a></li>
                            <li class=""><a href="#import-con">controler</a></li>
                            <li class=""><a href="#import-page">页面</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#upload">上传文件</a>
                        <ul class="nav">
                            <li class=""><a href="#upload-page">配置</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#glyphicons">字体图标</a>
                        <ul class="nav">
                            <li class=""><a href="#glyphicons-glyphs">所有可用的图标</a></li>
                            <li class=""><a href="#glyphicons-how-to-use">如何使用</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#btn-groups">按钮</a>
                        <ul class="nav">
                            <li class=""><a href="#btn-groups-single">基本实例</a></li>
                            <li class=""><a href="#btn-groups-toolbar">按钮工具栏</a></li>
                            <li class=""><a href="#btn-groups-sizing">尺寸</a></li>
                            <li class=""><a href="#btn-groups-nested">嵌套</a></li>
                            <li class=""><a href="#btn-groups-vertical">垂直排列</a></li>
                            <li class=""><a href="#btn-groups-justified">两端对齐排列的按钮组</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#highcharts">图表</a>
                        <ul class="nav">
                            <li class=""><a href="#highcharts-curve">曲线图</a></li>
                            <li class=""><a href="#highcharts-column">柱状图</a></li>
                            <li class=""><a href="#highcharts-pie">饼图</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#btn-dropdowns">按钮式下拉菜单</a>
                        <ul class="nav">
                            <li class=""><a href="#btn-dropdowns-single">单按钮下拉菜单</a></li>
                            <li class=""><a href="#btn-dropdowns-split">分裂式按钮下拉菜单</a></li>
                            <li class=""><a href="#btn-dropdowns-sizing">尺寸</a></li>
                            <li class=""><a href="#btn-dropdowns-dropup">向上弹出式菜单</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#nav">导航</a>
                        <ul class="nav">
                            <li><a href="#nav-tabs">标签页</a></li>
                            <li><a href="#nav-pills">胶囊式标签页</a></li>
                            <li><a href="#nav-justified">两端对齐</a></li>
                            <li><a href="#nav-disabled-links">禁用的链接</a></li>
                            <li><a href="#nav-dropdowns">添加下拉菜单</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#navbar">导航条</a>
                        <ul class="nav">
                            <li><a href="#navbar-default">默认样式的导航条</a></li>
                            <li><a href="#navbar-brand-image">品牌图标</a></li>
                            <li><a href="#navbar-forms">表单</a></li>
                            <li><a href="#navbar-buttons">按钮</a></li>
                            <li><a href="#navbar-text">文本</a></li>
                            <li><a href="#navbar-links">非导航的链接</a></li>
                            <li><a href="#navbar-component-alignment">组件排列</a></li>
                            <li><a href="#navbar-fixed-top">固定在顶部</a></li>
                            <li><a href="#navbar-fixed-bottom">固定在底部</a></li>
                            <li><a href="#navbar-static-top">静止在顶部</a></li>
                            <li><a href="#navbar-inverted">反色的导航条</a></li>
                        </ul>
                    </li>
                    <li><a href="#breadcrumbs">路径导航</a></li>
                    <li><a href="#labels">标签</a></li>
                    <li><a href="#badges">徽章</a></li>
                    <li><a href="#page-header">页头</a></li>
                    <li>
                        <a href="#thumbnails">缩略图</a>
                        <ul class="nav">
                            <li><a href="#thumbnails-default">默认样式的实例</a></li>
                            <li><a href="#thumbnails-custom-content">自定义内容</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#alerts">警告框</a>
                        <ul class="nav">
                            <li><a href="#alerts-examples">实例</a></li>
                            <li><a href="#alerts-dismissible">可关闭的警告框</a></li>
                            <li><a href="#alerts-links">警告框中的链接</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#progress">进度条</a>
                        <ul class="nav">
                            <li><a href="#progress-basic">基本实例</a></li>
                            <li><a href="#progress-label">带有提示标签的进度条</a></li>
                            <li><a href="#progress-alternatives">根据情境变化效果</a></li>
                            <li><a href="#progress-striped">条纹效果</a></li>
                            <li><a href="#progress-animated">动画效果</a></li>
                            <li><a href="#progress-stacked">堆叠效果</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#media">媒体对象</a>
                        <ul class="nav">
                            <li><a href="#media-default">默认样式</a></li>
                            <li><a href="#media-list">媒体对象列表</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#list-group">列表组</a>
                        <ul class="nav">
                            <li><a href="#list-group-basic">基本实例</a></li>
                            <li><a href="#list-group-badges">徽章</a></li>
                            <li><a href="#list-group-linked">链接</a></li>
                            <li><a href="#list-group-buttons">Button items</a></li>
                            <li><a href="#list-group-disabled">被禁用的条目</a></li>
                            <li><a href="#list-group-contextual-classes">情境类</a></li>
                            <li><a href="#list-group-custom-content">定制内容</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#panels">面板</a>
                        <ul class="nav">
                            <li><a href="#panels-basic">基本实例</a></li>
                            <li><a href="#panels-heading">带标题的面版</a></li>
                            <li><a href="#panels-footer">带注脚的面板</a></li>
                            <li><a href="#panels-alternatives">情境效果</a></li>
                            <li><a href="#panels-tables">带表格的面版</a>
                            </li><li><a href="#panels-list-group">带列表组的面版</a>
                        </li></ul>
                    </li>
                    <li><a href="#responsive-embed">具有响应式特性的嵌入内容</a></li>
                    <li><a href="#wells">Well</a></li>


                </ul>
                <a class="back-to-top" href="#top">
                    返回顶部
                </a>

            </nav>
        </div>
    </div>
</div>
<jsp:include page="../../../common/portals-bottom.jsp"></jsp:include>
<script src="<%=basePath %>/resources/plugins/jquery-syntax/public/jquery.syntax.js"></script>
<script src="<%=basePath %>/resources/plugins/jquery-syntax/public/jquery.syntax.cache.js"></script>
<script>
    $(document).ready(function () {
        Main.initForm();
        $.syntax();
        var show_back_up = 72;
        var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
        init_doc_sidenav(show_back_up, scrollTop);
        //锚点选中
        $(".bs-docs-sidenav li").click(function () {
            $(".bs-docs-sidenav li").removeClass();
            $(this).addClass("active");
        });
        //固定锚点
        $(window).scroll(function () {
            scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            init_doc_sidenav(show_back_up, scrollTop);
        });
        $('#datetimepicker-1').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        $('#datetimepicker-2').datetimepicker({
            format: 'YYYY-MM-DD',
            useCurrent: false
        });

        $("#datetimepicker-1").on("dp.change", function (e) {
            $('#datetimepicker-2').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker-2").on("dp.change", function (e) {
            $('#datetimepicker-1').data("DateTimePicker").maxDate(e.date);
        });
    });
    function init_doc_sidenav(show_back_up, scrollTop) {
        if (show_back_up > scrollTop) {
            $(".bs-docs-sidebar").removeClass("affix");
        } else if (show_back_up < scrollTop) {
            $(".bs-docs-sidebar").addClass("affix");

        }
    }
</script>
</body>
</html>