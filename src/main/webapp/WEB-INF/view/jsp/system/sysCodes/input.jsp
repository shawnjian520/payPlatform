<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title" data-localize="frame_xtgl.sjzd_zdwh_zdwh">字典维护</h4>
            <div class="panel-tools">
                <div class="dropdown">
                    <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                        <i class="fa fa-cog"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                        <li>
                            <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i> <span>收起</span> </a>
                        </li>
                        <li>
                            <a class="panel-expand" href="#">
                                <i class="fa fa-expand"></i> <span>全屏</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <form class="form-horizontal">
                <input type="hidden" id="is_change" value="0">
                <input type="hidden" id="wid" name="wid" value="${object.wid}">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="zdbm">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdz">字典值</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="zdbm" name="zdbm" class="validate[required,maxSize[50]] form-control" value="${object.zdbm }">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="zdmc">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdmc">字典名称</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="zdmc" name="zdmc" class="validate[required,maxSize[50]] form-control" value="${object.zdmc }">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdlb">字典类别</font>：
                    </label>

                    <div class="col-sm-8">

                        <select name="zdlb" id="zdlb" onchange="setval(this)"  data-show-searchbox="true"  class="form-control select2-auto parameter">
                            <c:forEach items="${syscodelist}" var="c" varStatus="s">
                                <option  <c:if test="${object.zdlb==c.id }">selected="selected"</c:if>  value="${c.id }">${c.caption}</option>
                            </c:forEach>
                        </select>
                        <span class="symbol required"></span>
                    </div>
                    <input type="hidden" name="lbmc" id="lbmc" value="${object.lbmc}">
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        <font data-localize="">上级字典</font>：
                    </label>

                    <div class="col-sm-8">
                        <select name="sjdm" id="sjdm" onchange=""  data-show-searchbox="true"  class="form-control select2-auto parameter">
                            <option value=""></option>
                            <c:forEach items="${lblist}" var="c" varStatus="s">
                                <option  <c:if test="${object.sjdm==c.id}">selected="selected"</c:if>  value="${c.id}">${c.caption}</option>
                            </c:forEach>
                        </select>
                        <span class="symbol"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zt"> 状态</font>：
                    </label>

                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input name="sfsy" value="1" type="radio" class="mgr" 	<c:if test="${object.sfsy==1}"> checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_ky"> 启用</font>
                        </label>
                        <label class="radio-inline">
                            <input name="sfsy" value="0" type="radio" class="mgr" 	<c:if test="${object.sfsy==0}"> checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_jy"> 禁用</font>
                        </label>
                        <span class="symbol required-radio "></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="zdpx">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_px">字典排序</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="zdpx" name="zdpx" class="validate[required,maxSize[50]] form-control" value="${object.zdpx }">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="notes">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zs">注释</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="notes" name="notes" class="form-control" value="${object.notes }">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            <font data-localize="frame_button.save">保存</font>
                            <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
	function setval(el){
		$("#lbmc").val($(el).find("option:selected").text());
		 $.ajax({
             type: "post",
             url: tool.initParams("<%=basePath%>s/system/syscodes/getlbList"),
             data: {lbmc:$("#lbmc").val()},
             dataType: "json",
             success: function(data){
             	var html="";
             	for(var i=0;i<data.length;i++){
             		html+="<option value='"+data[i].id+"'>"+data[i].caption+"</option>";
             	}
             $("#sjdm").html(html);
             }
         });
	}
</script>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>