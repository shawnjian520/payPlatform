<%@page import="com.jd.system.servlets.SysInitAutoLoad" %> 
<%@page import="com.jd.util.CasLoginUtil" %>
<%@ page language="java" pageEncoding="UTF-8" session="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<title>500</title>
<style>
    html, body, h1, h2, h3, h4, h5, h6, div, dl, dt, dd, ul, ol, li, p, blockquote, pre, hr, figure, table, caption, th, td, form, fieldset, legend, input, button, textarea, menu {
        margin: 0;
        padding: 0;
    }

    header, footer, section, article, aside, nav, hgroup, address, figure, figcaption, menu, details {
        display: block;
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
    }

    caption, th {
        text-align: left;
        font-weight: normal;
    }

    html, body, fieldset, img, iframe, abbr {
        border: 0;
    }

    i, cite, em, var, address, dfn {
        font-style: normal;
    }

    [hidefocus], summary {
        outline: 0;
    }

    li {
        list-style: none;
    }

    h1, h2, h3, h4, h5, h6, small {
        font-size: 14px;
    }

    sup, sub {
        font-size: 83%;
    }

    pre, code, kbd, samp {
        font-family: inherit;
    }

    q:before, q:after {
        content: none;
    }

    textarea {
        overflow: auto;
        resize: none;
    }

    label, summary {
        cursor: default;
    }

    a, button {
        cursor: pointer;
    }

    h1, h2, h3, h4, h5, h6, em, strong, b {
        font-weight: bold;
    }

    del, ins, u, s, a, a:hover {
        text-decoration: none;
    }

    body, textarea, input, button, select, keygen, legend {
        font: 14px/30px Microsoft YaHei, \5b8b\4f53;
        color: #888888;
        outline: 0;
        vertical-align: middle;
    }

    body {
        font-family: "Microsoft YaHei";
    }

    img {
        vertical-align: bottom;
    }

    a {
        color: red;
    }

    a:hover {
        text-decoration: underline;
    }

    .middle {
        width: 1100px;
        margin: 0 auto;
    }

    .suojin {
        text-indent: 2em;
    }

    .border-padding {
        border: 1px solid #d1d1d1;
        padding: 1px;
    }

    .red {
        color: red;
    }

    .c-valifail {
        width: 1170px;
        height: 290px;
        text-align: center;
        background: url(<%=basePath%>/resources/images/c_valifail_ico01.jpg) no-repeat top center;
        padding-top: 100px;
        position: absolute;
        z-index: 10;
        top: 45%;
        left: 50%;
        margin: -145px 0 0 -585px;
    }

    .c-valifail h4 {
        height: 60px;
        line-height: 60px;
        font-size: 30px;
        color: #ba0000;
        font-weight: normal;
    }

    .c-valifail p {
        height: 30px;
        line-height: 30px;
        font-size: 14px;
    }

    .c-valifail .c-valifail-btn {
        margin-top: 8px;
    }

    .c-valifail .c-valifail-btn a {
        padding: 4px 20px;
        background-color: #f7f6f6;
        color: #888888;
        border: 1px solid #dedede;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    }

    .c-valifail .c-valifail-btn a:hover {
        background-color: #f0efef;
        color: #5c5c5c;
        text-decoration: none;
    }
</style>
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body class="single-page">
<body>
<div class="c-valifail">
    <h4>验证失败</h4>
    <p>当前账号未在<%=SysInitAutoLoad.zzmc %>注册，请联系管理员</p>
    <div class="c-valifail-btn"><a href="javascript:goCase()" title="退出统一身份认证">退出统一身份认证</a></div>
</div>
<script>
    var caseLogin = '<%=CasLoginUtil.getCasServerLoginUrl() %>';
    function goCase() {
        window.location = caseLogin;
    }
</script>
</body>
</html>