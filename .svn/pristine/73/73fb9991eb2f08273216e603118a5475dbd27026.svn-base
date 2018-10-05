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
                <li><a href="./components">组件</a></li>
                <li class="active"><a href="./javascript">JavaScript插件</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <jsp:include page="../public/start.jsp"></jsp:include>
        </div>
        <div class="col-md-3">
            <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
                <ul class="nav bs-docs-sidenav">

                    <li class="active">
                        <a href="#js-overview">概览</a>
                        <ul class="nav">
                            <li><a href="#js-noconflict">避免命名空间冲突</a></li>
                        </ul>
                    </li>
                    <li class=""><a href="#transitions">过渡效果</a></li>
                    <li>
                        <a href="#modals">模态框</a>
                        <ul class="nav">
                            <li><a href="#modals-examples">实例</a></li>
                            <li><a href="#modals-sizes">尺寸</a></li>
                            <li><a href="#modals-remove-animation">禁止动画效果</a></li>
                            <li><a href="#modals-related-target">Varying content based on trigger button</a></li>
                            <li><a href="#modals-usage">用法</a></li>
                            <li><a href="#modals-options">参数</a></li>
                            <li><a href="#modals-methods">方法</a></li>
                            <li><a href="#modals-events">事件</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#dropdowns">下拉菜单</a>
                        <ul class="nav">
                            <li><a href="#dropdowns-examples">实例</a></li>
                            <li><a href="#dropdowns-usage">用法</a></li>
                            <li><a href="#dropdowns-methods">方法</a></li>
                            <li><a href="#dropdowns-events">事件</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#scrollspy">滚动监听</a>
                        <ul class="nav">
                            <li class=""><a href="#scrollspy-examples">实例</a></li>
                            <li><a href="#scrollspy-usage">用法</a></li>
                            <li><a href="#scrollspy-methods">方法</a></li>
                            <li><a href="#scrollspy-options">参数</a></li>
                            <li><a href="#scrollspy-events">事件</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#tabs">标签页</a>
                        <ul class="nav">
                            <li><a href="#tabs-examples">实例</a></li>
                            <li><a href="#tabs-usage">用法</a></li>
                            <li><a href="#tabs-methods">方法</a></li>
                            <li><a href="#tabs-events">事件</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#tooltips">工具提示</a>
                        <ul class="nav">
                            <li><a href="#tooltips-examples">实例</a></li>
                            <li><a href="#tooltips-usage">用法</a></li>
                            <li><a href="#tooltips-options">参数</a></li>
                            <li><a href="#tooltips-methods">方法</a></li>
                            <li><a href="#tooltips-events">事件</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#popovers">弹出框</a>
                        <ul class="nav">
                            <li><a href="#popovers-examples">实例</a></li>
                            <li><a href="#popovers-usage">用法</a></li>
                            <li><a href="#popovers-options">参数</a></li>
                            <li><a href="#popovers-events">事件</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#alerts">警告框</a>
                        <ul class="nav">
                            <li><a href="#alerts-examples">警告框实例</a></li>
                            <li><a href="#alerts-usage">用法</a></li>
                            <li><a href="#alerts-methods">方法</a></li>
                            <li><a href="#alerts-events">事件</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#buttons">按钮</a>
                        <ul class="nav">
                            <li><a href="#buttons-stateful">Stateful</a></li>
                            <li><a href="#buttons-single-toggle">Single toggle</a></li>
                            <li><a href="#buttons-checkbox-radio">Checkbox / Radio</a></li>
                            <li><a href="#buttons-methods">方法</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#collapse">Collapse</a>
                        <ul class="nav">
                            <li><a href="#collapse-example">实例</a></li>
                            <li><a href="#collapse-example-accordion">Accordion example</a></li>
                            <li><a href="#collapse-usage">用法</a></li>
                            <li><a href="#collapse-options">参数</a></li>
                            <li><a href="#collapse-methods">方法</a></li>
                            <li><a href="#collapse-events">事件</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#carousel">Carousel</a>
                        <ul class="nav">
                            <li class=""><a href="#carousel-examples">实例</a></li>
                            <li><a href="#carousel-usage">用法</a></li>
                            <li><a href="#carousel-options">参数</a></li>
                            <li><a href="#carousel-methods">方法</a></li>
                            <li><a href="#carousel-events">事件</a></li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#affix">Affix</a>
                        <ul class="nav">
                            <li class=""><a href="#affix-examples">实例</a></li>
                            <li class=""><a href="#affix-usage">用法</a></li>
                            <li class=""><a href="#affix-options">参数</a></li>
                            <li class=""><a href="#affix-methods">方法</a></li>
                            <li class=""><a href="#affix-events">事件</a></li>
                        </ul>
                    </li>

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