<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form id="input-form" method="post" class="form-horizontal">
    <input type="hidden" id="wid" name="wid" value="${object.wid}">
      <input type="hidden" name="uptype" id="uptype" value="${object.uptype}">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="name">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_mc">名称</font>：
        </label>
        <div class="col-sm-9">
            <input type="text" name="name" id="name" class="validate[required,maxSize[10]] form-control" value="${object.name}">
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="type">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_lx">类型</font>：
        </label>
        <div class="col-sm-9">
               <input type="text" name="type" id="type" class="validate[maxSize[2]] form-control" value="${object.type}">           
            <span class="symbol required"></span>
        </div>
    </div>
    <c:if test="${(object.wid!=null && fn:length(object.wid)==8)||(object.upwid!=null&&fn:length(object.upwid)==6) }">
    	 <div class="form-group">
	        <label class="col-sm-2 control-label" for="groupid">
	            <font data-localize="frame_xtgl.bmgl_zzjglxgl_glyhz">关联用户组</font>：
	        </label>
	        <div class="col-sm-9 mt5" id="groupdiv">
	        	 <c:forEach items="${allgrouplist}" var="obj" varStatus="s">
						 <label>
                    	  <input  type="checkbox" name="groupid" class="mgc" 
						 	<c:if test="${fn:contains(object.groupid,obj.id)}">checked="checked"</c:if>
						  value="${obj.id}">&nbsp;${obj.caption}
                 	   </label>
					</c:forEach>               
	        </div>
	    </div>
    </c:if>

    <div class="form-group">
        <div class="col-md-offset-2 col-sm-9">
            <button class="btn btn-sm btn-success" type="button" onclick="page2.savetype()">
                <font data-localize="frame_button.save">保存</font><i class="fa fa-check"></i></button>
                <c:if test="${object.wid!=null}">
                	 <c:if test="${object.type!=01}">
                	  <button class="btn btn-sm btn-success" type="button" onclick="page2.submitRemoveMenu()">
                        <font data-localize="frame_button.delete">删除 </font> <i class="fa fa-times"></i></button>
                	 </c:if>
                	 <c:if test="${fn:length(object.wid)!=8}">
                	  <button class="btn btn-sm btn-success" type="button"
                        onclick="page2.addtype('${object.type}','${object.wid}')">
                  <font data-localize="frame_xtgl.bmgl_qtlxlb_xzzlx">新增子类型</font>  <i class="fa fa-plus"></i></button>
                	 </c:if>
                </c:if>
        </div>
    </div>
</form>
<script>
    $(function () {
        var html = '';
        $('#groupdiv').find('input[type="checkbox"]').each(function (i) {
            html += '<label class="checkbox-inline">' + document.getElementById($(this).attr('id')).outerHTML + $(this).next('label').html() + '</label>';
        });
        $('#groupdiv').html(html);
    });
</script>
<%@include file="../../common/plugins/js/frame.jsp" %>