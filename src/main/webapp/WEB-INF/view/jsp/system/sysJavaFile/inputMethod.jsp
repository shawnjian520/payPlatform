<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();

%>
<%@include file="../../common/input-header.jsp" %>
<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="row">
            <form role="form" class="form-horizontal">
                <input type="hidden" name="wid" id="wid" value="${object.wid}">
                <input type="hidden" name="lwid" id="lwid" value="${lwid}">
                <jd:lable id="qqurl" col="1" lable="请求URL">
                    <input type="text" id="qqurl" name="qqurl"  placeholder="例：showStudent   如不填写则默认不生成Controller" class="form-control"
                           value=""/>
                </jd:lable>
                 <jd:lable id="" col="1" lable="方法名">
                    <input type="text" id="name" name="name" placeholder="例：getStudentList" class="validate[required] form-control"
                           value=""/>
                 </jd:lable>
                <jd:lable id="" col="1" lable="接收参数">
                    <input type="text" id="jscs" name="jscs" placeholder="只需要填写在页面的Name 如不创建Controller方法请为空  例：studnetname;studentage" class="form-control"
                           value=""/>
                </jd:lable>
            	  
                 <jd:lable id="ywlx" col="1" lable="Controller返回值">
                    <label class="radio-inline"  onclick="showJspOff()">
                        <input name=controllerreturn value="void" onclick="showJsp()" type="radio" class="grey"
                  >
                        	返回Json
                    </label>
                    <label class="radio-inline" onclick="showJspOn()">
                        <input name="controllerreturn" value="String" type="radio" class="grey"
                     >
                        	返回页面
                    </label>
                   <!--  <label class="radio-inline"  style="color:blue;font-weight:bold;" color="blue;font-weight:bold;">查询返回页面的请选择  String，执行保存修改删除的请选择   Void</label> -->
                </jd:lable> 
                
                <jd:lable id="ywlx" col="1" lable="Service返回值">
                    	<input name="servicereturn" type="text" id="servicereturn"  placeholder="例：Object、Void" class="form-control">
                </jd:lable> 
                <jd:lable id="" col="1" lable="注释">
                    <input type="text" id="bz" name="bz"  class="validate[required] form-control"
                           value=""/>
                 </jd:lable>
                 <div id="showmodel" style="display: none;">
               
              <jd:lable id="" col="1" lable="跳转页面">
                    <input type="text" id="returnjsp" name="returnjsp" placeholder="例：liststudent.jsp 注：如果是列表页请包含list   否则则包含 input" class="form-control"
                           value=""/>
                </jd:lable>
                  </div>
                <div class="col-md-offset-2 col-sm-9">
                    <button class="btn btn-sm btn-success" type="button" onclick="savemethod(this)">
                        保存 <i class="fa fa-check"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>
<script>
function savemethod (el) {
        var form_element = $(el).parents('.form-horizontal');
            if (isBlank(form_element.attr("action"))) {
            	if (isBlank(form_element.attr("action"))) {
	                url = form_element.attr("data-action");
	                //spring mvc
	                if (url.indexOf("action") < 0) {
	                    url = url.substring(0, url.indexOf('/s/') + 7) + url.substring(url.indexOf('/s/') + 7).substring(0, url.substring(url.indexOf('/s/') + 7).indexOf("/"));
	                    url = url + "/sysJavaFile/saveMethod";
	                } else {
	                    url = url.substr(0, url.indexOf("-")) + "-saveData.action";
	                }
            	}else{
	            	url = form_element.attr("action");
	            }
            }
      
        tool.saveData(el,url);
    }
$(function(){
		$("body").height(600);
		
})

function showJspOn(){
	$("#showmodel").show();
}
function showJspOff(){
	$("#showmodel").hide();
}
</script>