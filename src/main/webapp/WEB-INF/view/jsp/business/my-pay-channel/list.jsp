<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@include file="../../common/list-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/bootstrap-datetimepicker.jsp" %>
<%@include file="../../common/plugins/css/jQuery-Validation-Engine.jsp" %>
<div class="row">
    <div class="col-xs-12">
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding">
            <div class="form-group">
                <label title="支付方式名称" class="col-sm-3 control-label ell nopadding"> 支付方式名称：</label>
                <div class="col-sm-9">
                    <input type="text" id="PayTypeName" name="PayTypeName" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding">
            <div class="form-group">
                <label title="支付描述" class="col-sm-3 control-label ell nopadding"> 支付描述：</label>
                <div class="col-sm-9">
                    <input type="text" id="payChannelName" name="payChannelName" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding">
            <div class="form-group">
                <label title="开始时间" class="col-sm-3 control-label ell nopadding"> 开始时间：</label>
                <div class="col-sm-9">
                   <input type="text" id="startTime" data-element-type="datetimepicker"  data-format="YYYY-MM-DD HH:mm:ss" name="startTime" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding">
            <div class="form-group">
                <label title="结束时间" class="col-sm-3 control-label ell nopadding"> 结束时间：</label>
                <div class="col-sm-9">
                    <input type="text" id="endTime" name="endTime" data-element-type="datetimepicker"  data-format="YYYY-MM-DD HH:mm:ss" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <a class="btn btn-sm btn-primary" onclick="page.doSearch(this)">
                查询 <i class="fa fa-search"></i>
            </a>
            <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                重置 <i class="fa fa-mail-reply-all"></i>
            </a>
        </div>
    </div>
</div>
<div class="row mt5">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" onclick="tool.addData(this)">
            新增 <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">
            删除<i class="fa fa-times"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="page.editObject(this)">
            修改 <i class="fa fa-edit"></i>
        </a>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover table-bordered table-order">
        <thead>
        <tr>
            <th class="center w20">
                <label class="checkbox-table">
                    <input type="checkbox" class="mgc selectall">
                </label>
            </th>
            <th data-order-name="">支付方式名称</th>
            <th data-order-name="">支付描述</th>
            <th data-order-name="">APP_ID</th>
            <th data-order-name="">API_KEY</th>
            <th data-order-name="">商户ID</th>
            <th data-order-name="">秘钥ID</th>
            <th data-order-name="">是否可用</th>
            <th data-order-name="">创建时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj" varStatus="sta">
            <tr id="tr_${obj.id}">
                <td class="center" width="25">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" class="mgc foocheck" name="selectNode" value="${obj.id}">
                        </label>
                    </div>
                </td>
                <td>
                	${obj.pay_type_name}
                </td>
                <td><a onclick="tool.editDataById(this,'${obj.id}')" href="javascript:void(0)">${obj.pay_channel_name}</a></td>
                <td>${obj.app_id}</td>
                <td>${obj.api_key}</td>
                <td>${obj.mch_id}</td>
                <td>${obj.query_channel_id}</td>
                <td>
                	<c:if test="${obj.status==1}">可用</c:if>
                	<c:if test="${obj.status==2}">不可用</c:if>
                </td>
                <td>${obj.createtime}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<input type="hidden" name="currentPageno" value="${pager.currentPageno}" id="yspager_currentPageno"/>
<input type="hidden" name="eachPageRows" value="${pager.eachPageRows}" id="eachPageRows"/>
<div class="row">
    <tags:pagination paginationSize="${pager.eachPageRows}" page="${pager}"></tags:pagination>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/moment.jsp" %>
<%@include file="../../common/plugins/js/bootstrap-datetimepicker.jsp" %>
<%@include file="../../common/plugins/js/jQuery-Validation-Engine.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>

<script>
	
	page={
			doSearch:function(el){
				var $form = $(el).parents('.form-horizontal');
				if ($form.validationEngine('validate')) {
	  				 tool.doSearch(el);
					}
			},editObject:function(el){
				var form_element = $(el).parents('.form-horizontal');
	            var ids = tool.getChoseData(form_element);
	            if (!isBlank(ids)) {
	                if (ids.split(",").length == 1) {
	                	page.checkFlag(el,ids);
	                } else {
	                    tool.alertWarning('不支持批量修改,请勾选1条数据!', '请在下方列表中勾选一条要修改的数据');
	                }
	            } else {
	            	  tool.alertWarning('请选择要修改的数据!', '请在下方列表中勾选一条要修改的数据');
	            }
			},checkFlag:function(el,id){
				 tool.setWaitForResponseStatus($(el));
				 tool.ajax({
		                type: 'post',
		                data: {"id":id},
		                url: basePath + '/s/biz/my-pay-channel/getFlag',
		                success: function (data) {
				            tool.removeWaitForResponseStatus();
				            if(data.res&&data.list){
				            	tool.editData(el);
				            }else{
				            	tool.alertWarning("操作失败","标识点不存在");
				            }
		                }
		            });
			} 
	}

    function isSubmitForm() {
        return true;
    }
</script>