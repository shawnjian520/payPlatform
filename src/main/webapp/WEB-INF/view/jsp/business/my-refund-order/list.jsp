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
                <label title="商户名称" class="col-sm-3 control-label ell nopadding"> 商户名称：</label>
                <div class="col-sm-9">
                    <input type="text" id="merchantName" name="merchantName" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding">
            <div class="form-group">
                <label title="退款单号" class="col-sm-3 control-label ell nopadding"> 退款单号：</label>
                <div class="col-sm-9">
                    <input type="text" id="refundOrderNo" name="refundOrderNo" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding">
            <div class="form-group">
                <label title="开始时间" class="col-sm-3 control-label ell nopadding"> 开始时间：</label>
                <div class="col-sm-9">
                   <input type="text" id="staTime" data-element-type="datetimepicker"  data-format="YYYY-MM-DD HH:mm:ss" name="staTime" class="form-control"/>
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
        <a class="btn btn-sm btn-success" onclick="page.editObject(this)">
            查看详情<i class=""></i>
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
            <th data-order-name="">商户名称</th>
            <th data-order-name="">退款单号</th>
            <th data-order-name="">支付类型</th>
            <th data-order-name="">支付描述</th>
            <th data-order-name="">支付状态</th>
            <th data-order-name="">支付金额</th>
            <th data-order-name="">退款额度</th>
            <th data-order-name="">退款时间</th>
            <th data-order-name="">退款原因</th>
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
                <td>${obj.merchantName}</td>
                <td><a onclick="tool.editDataById(this,'${obj.id}')" href="javascript:void(0)">${obj.refundOrderNo}</a></td>
                <td>
                	<c:if test="${obj.payTypeCode eq 'WECHAT_PAY'}">微信</c:if>
                	<c:if test="${obj.payTypeCode eq 'ALI_PAY'}">支付宝</c:if>
                	<c:if test="${obj.payTypeCode eq 'UNION_PAY'}">银联支付</c:if>
                </td>
                <td>
                	<c:if test="${obj.tradeType eq 'JSAPI'}">WAP支付</c:if>
                	<c:if test="${obj.tradeType eq 'NATIVE'}">扫码支付</c:if>
                	<c:if test="${obj.tradeType eq 'APP'}">APP支付</c:if>
                	<c:if test="${obj.tradeType eq 'WAP'}">WAP支付</c:if>
                	<c:if test="${obj.tradeType eq 'MICROPAY'}">刷卡支付</c:if>
                </td>
                <td><c:if test="${obj.status==0}">创建支付订单</c:if>
                	<c:if test="${obj.status==1}">创建支付订单成功</c:if>
                	<c:if test="${obj.status==2}">退款成功</c:if>
                	<c:if test="${obj.status==3}">创建支付订单失败</c:if>
                	<c:if test="${obj.status==4}">支付失败</c:if>
                	<c:if test="${obj.status==5}">支付中</c:if>
                	<c:if test="${obj.status==6}">支付订单关闭</c:if>
                	<c:if test="${obj.status==7}">部分退款</c:if>
                	<c:if test="${obj.status==8}">全部退款</c:if>
                </td>
                <td>${obj.payAmount*0.01}</td>
                <td>${obj.refundAmount*0.01}</td>
                <td>${obj.refundTime}</td>
                <td>${obj.refundReason}</td>
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
	                    tool.alertWarning('不支持批量查看,请勾选1条数据!', '请在下方列表中勾选一条要查看的数据');
	                }
	            } else {
	            	  tool.alertWarning('请选择要查看的数据!', '请在下方列表中勾选一条要查看的数据');
	            }
			},checkFlag:function(el,id){
				 tool.setWaitForResponseStatus($(el));
				 tool.ajax({
		                type: 'post',
		                data: {"id":id},
		                url: basePath + '/s/biz/my-refund-order/getFlag',
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