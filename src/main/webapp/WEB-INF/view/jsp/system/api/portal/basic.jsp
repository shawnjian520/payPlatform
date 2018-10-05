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
                <li class="active"><a href="./portal">门户</a></li>
                <li><a href="./managementSystem">管理系统</a></li>
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
            <jsp:include page="api.jsp"></jsp:include>
        </div>
        <div class="col-md-3">
            <nav class="bs-docs-sidebar">
                <ul class="nav bs-docs-sidenav">

                    <li>
                        <a href="#portal">门户</a>
                        <ul class="nav">
                            <li><a href="#portal-basic-info">基本格式</a></li>
                            <li><a href="#portal-plugins">插件</a></li>
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