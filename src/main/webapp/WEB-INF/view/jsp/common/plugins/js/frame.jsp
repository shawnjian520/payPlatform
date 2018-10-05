<%@page import="com.jd.system.util.LoginUtil"%>
<%@ page import="com.jd.identity.IdConstants" %>
<%@ page import="com.jd.identity.entity.TSysUser" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
	TSysUser _tsysUse = LoginUtil.getloginuser(request);
%>
<!-- start: CORE JAVASCRIPTS -->
<script src="${ctx}/resources/js/main.js"></script>
<script src="${ctx}/resources/js/frame-tool-tab-model.js"></script>
<script src="${ctx}/resources/js/tool.js"></script>
<script src="${ctx}/resources/js/syscode.js"></script>
<script src="${ctx}/resources/js/language.js"></script>
<!-- end: CORE JAVASCRIPTS -->
<script>
    $(document).ready(function () {
        tool.userloginid = '<%=(_tsysUse==null?"":_tsysUse.getUserloginid())%>';
        tool.usertype = '<%=(_tsysUse==null?"":_tsysUse.getUsertype())%>';
        tool.group = '<%=(_tsysUse==null?"":_tsysUse.getGroupid())%>';
        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
            var ieversion = new Number(RegExp.$1);
            if (ieversion == 8) {
                isIE8 = true;
                $body.addClass('isIE8');
            } else if (ieversion == 9) {
                isIE9 = true;
                $body.addClass('isIE9');
            }
        }
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            isMobile = true;
            $body.addClass('isMobile');
        }
        $('.form-horizontal').each(function () {
            var $form = $(this);
            if (isBlank($form.attr('data-action'))) {
                $form.attr('data-action', window.location.href);
                if (window.location.href.indexOf("action") < 0) {//spring mvc
                    $form.find("#yspager_currentPageno").attr("name", "currentPageno");
                    $form.find("#eachPageRows").attr("name", "eachPageRows");
                }
            }
        });
        $('.tabModel-content').removeClass('hide').addClass("fadeInUp").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $(this).removeClass("fadeInUp");
        });
        Main.initList();
    });
</script>