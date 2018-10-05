<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- 表单验证 -->
<script src="${ctx}/resources/plugins/jQuery-Validation-Engine-master/js/jquery.validationEngine.js"></script>
<script>
	function getCookie(name)//取cookies函数     
	{  
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
	if(arr != null) return unescape(arr[2]); return null;  
	} 
	try {
		if(getCookie('jdLanguage')=='en'){
			document.write('<scr' + 'ipt src="${ctx}/resources/plugins/jQuery-Validation-Engine-master/js/languages/jquery.validationEngine-en.js"></scr' + 'ipt>');
		}else{
			document.write('<scr' + 'ipt src="${ctx}/resources/plugins/jQuery-Validation-Engine-master/js/languages/jquery.validationEngine-zh_CN.js"></scr' + 'ipt>');
		}
	} catch (e) {
		document.write('<scr' + 'ipt src="${ctx}/resources/plugins/jQuery-Validation-Engine-master/js/languages/jquery.validationEngine-zh_CN.js"></scr' + 'ipt>');
	}
	
</script>