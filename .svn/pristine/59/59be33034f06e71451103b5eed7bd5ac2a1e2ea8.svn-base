<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../../common/input-header.jsp"%>
<%@include file="../../common/plugins/css/iCheck.jsp"%>
<%@include file="../../common/plugins/css/bootstrap-datetimepicker.jsp"%>
<%@include file="../../common/plugins/css/select2.jsp"%>
<div class="col-md-10 col-md-offset-1">
	<div class="panel panel-white">
		<div class="panel-heading">
			<h4 class="panel-title">详细信息</h4>
			<div class="panel-tools">
				<div class="dropdown">
					<a data-toggle="dropdown"
						class="btn btn-xs dropdown-toggle btn-transparent-grey"> <i
						class="fa fa-cog"></i>
					</a>
					<ul class="dropdown-menu dropdown-light pull-right" role="menu">
						<li><a class="panel-collapse collapses" href="#"><i
								class="fa fa-angle-up"></i> <span>收起</span> </a></li>
						<li><a class="panel-expand" href="#"> <i
								class="fa fa-expand"></i> <span>全屏</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<form role="form" class="form-horizontal custom-form">
				<input type="hidden" id="id" name="id" value="${object.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">支付渠道ID： </label>
					<div class="col-sm-4">
						<input type="text" id="payChannelId" name="payChannelId"
							class="validate[required] form-control"
							value="${object.payChannelId}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label">支付类型： </label>
					<div class="col-sm-4">
						<input type="text" id="payTypeCode" name="payTypeCode"
							class="validate[required] form-control"
							value="${object.payTypeCode}" readonly/> <span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"> 支付交易流水号： </label>
					<div class="col-sm-4">
						<input type="text" id="payOrderNo" name="payOrderNo"
							class="validate[required] form-control" value="${object.payOrderNo}" readonly/>
						<span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 业务方 支付订单号： </label>
					<div class="col-sm-4">
						<input type="text" id="tradePayNo" name="tradePayNo"
							class="validate[required] form-control" value="${object.tradePayNo}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">退款交易流水号： </label>
					<div class="col-sm-4">
						<input type="text" id="refundOrderNo" name="refundOrderNo"
							class="validate[required] form-control"
							value="${object.refundOrderNo}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 业务方 退款订单号： </label>
					<div class="col-sm-4">
						<input type="text" id="tradeRefundNo" name="tradeRefundNo"
							class="validate[required] form-control" value="${object.tradeRefundNo}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">内部订单号： </label>
					<div class="col-sm-4">
						<input type="text" id="payId" name="payId"
							class="validate[required] form-control"
							value="${object.payId}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 支付金额： </label>
					<div class="col-sm-4">
						<input type="text" id="payAmount" name="payAmount"
							class="validate[required] form-control" value="${object.payAmount}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">退款金额： </label>
					<div class="col-sm-4">
						<input type="text" id="refundAmount" name="refundAmount"
							class="validate[required] form-control"
							value="${object.refundAmount}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 退款状态： </label>
					<div class="col-sm-4">
						<input type="text" id="status" name="status"
							class="validate[required] form-control" value="${object.status}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">退款失败错误码： </label>
					<div class="col-sm-4">
						<input type="text" id="errorCode" name="errorCode"
							class="validate[required] form-control"
							value="${object.errorCode}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 退款失败描述信息： </label>
					<div class="col-sm-4">
						<input type="text" id="errorMsg" name="errorMsg"
							class="validate[required] form-control" value="${object.errorMsg}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">退款时间： </label>
					<div class="col-sm-4">
						<input type="text" id="refundTime" name="refundTime"
								class="validate[required] form-control" value="${object.refundTime}" readonly/>
						<span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label">商户号： </label>
					<div class="col-sm-4">
						<input type="text" id="merchantId" name="merchantId"
							class="validate[required] form-control" value="${object.merchantId}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">支付描述： </label>
					<div class="col-sm-4">
						<input type="text" id="tradeType" name="tradeType"
							class="validate[required] form-control"
							value="${object.tradeType}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 退款原因： </label>
					<div class="col-sm-4">
						<input type="text" id="refundReason" name="refundReason"
							class="validate[required] form-control" value="${object.refundReason}" readonly/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">创建时间： </label>
					<div class="col-sm-4">
						<input type="text" id="createTime" name="createTime"
							class="validate[required] form-control"
							value="${object.createTime}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label">微信退款单号： </label>
					<div class="col-sm-4">
						<input type="text" id="refundId" name="refundId"
							class="validate[required] form-control"
							value="${object.refundId}" readonly/> <span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">退款成功url： </label>
					<div class="col-sm-4">
						<input type="text" id="notifyUrl" name="notifyUrl"
							class="validate[required] form-control"
							value="${object.notifyUrl}" readonly/> <span class="symbol required"></span>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="../../common/plugins/js/select2.jsp"%>
<%@include file="../../common/plugins/js/moment.jsp"%>
<%@include file="../../common/plugins/js/bootstrap-datetimepicker.jsp"%>
<%@include file="../../common/input-bottom.jsp"%>
<script>
	/* page = {
		initSelect : function() {
			
		}
	}
	$(document).ready(function() {
		page.initSelect();
	}) */
</script>