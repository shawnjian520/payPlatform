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
                <li class="active"><a href="./managementSystem">管理系统</a></li>
                <li><a href="./components">组件</a></li>
                <li><a href="./javascript">JavaScript插件</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <jsp:include page="list.jsp"></jsp:include>
            <jsp:include page="custom-tag.jsp"></jsp:include>
            <jsp:include page="structure.jsp"></jsp:include>
            <jsp:include page="style.jsp"></jsp:include>
            <jsp:include page="javascript.jsp"></jsp:include>
            <jsp:include page="css-util.jsp"></jsp:include>
            <jsp:include page="plugins.jsp"></jsp:include>
        </div>
        <div class="col-md-3">
            <nav class="bs-docs-sidebar">
                <ul class="nav bs-docs-sidenav">
                    <li>
                        <a href="#list">增/删/改/查</a>
                        <ul class="nav">
                            <li><a href="#list-explanation">说明</a></li>
                            <li><a href="#list-specification">创建过程</a></li>
                            <li><a href="#list-example">示例</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#custom-tag">自定义标签</a>
                        <ul class="nav">
                            <li><a href="#tag-lable">lable</a></li>
                            <li><a href="#tag-panel">panel</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#structure">页面结构</a>
                        <ul class="nav">
                            <li><a href="#beginning-of-page">页面开始</a></li>
                            <li><a href="#page-head">页面头部</a></li>
                            <li><a href="#top-bar">顶部工具</a></li>
                            <li><a href="#left-sidebar">左边菜单</a></li>
                            <li><a href="#content">页面主体</a></li>
                            <li><a href="#footer">页面底部</a></li>
                            <li><a href="#end-of-page">页面结束</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#style">样式</a>
                    </li>
                    <li>
                        <a href="#javascript">脚本</a>
                    </li>
                    <li>
                        <a href="#css-util">CSS工具</a>
                    </li>
                    <li>
                        <a href="#plugins">插件列表</a>
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