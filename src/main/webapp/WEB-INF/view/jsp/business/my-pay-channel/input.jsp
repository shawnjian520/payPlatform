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
					<label class="col-sm-2 control-label">支付方式名称： </label>
					<div class="col-sm-4">
							<select name="payTypeName" id="payTypeName" data-val="${object.payTypeName}"
								class="validate[required] form-control select2-auto">
								<option value="">请选择</option>
								<c:forEach items="${channels}" var="chas">
									<option value="${chas.pay_type_name}">${chas.pay_type_name}</option>
								</c:forEach>
								<!-- <option value="微信支付">微信扫码支付</option>
								<option value="微信支付">微信H5支付</option>
								<option value="支付宝支付">支付宝WEB支付</option>
								<option value="支付宝支付">支付宝H5支付</option>
								<option value="银联支付">银联聚合支付</option> -->
							</select> 
							<span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 支付描述： </label>
					<div class="col-sm-4">
						<select name="payChannelName" id="payChannelName" data-val="${object.payChannelName}"
								class="validate[required] form-control select2-auto">
								<option value="">请选择</option>
								<option value="WAP支付">WAP支付</option>
								<option value="扫码支付">扫码支付</option>
								<option value="APP支付">APP支付</option>
								<option value="WAP支付">WAP支付</option>
								<option value="刷卡支付">刷卡支付</option>
							</select> 
							<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">加密方式： </label>
					<div class="col-sm-4">
						<input type="text" id="signType" name="signType"
							class="validate[required] form-control"
							value="${object.signType}" /> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 凭证文件Id： </label>
					<div class="col-sm-4">
						<input type="text" id="certFileId" name="certFileId"
							class="validate[required] form-control" value="${object.certFileId}" />
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">API_KEY： </label>
					<div class="col-sm-4">
						<input type="text" id="apiKey" name="apiKey"
							class="validate[required] form-control"
							value="${object.apiKey}" /> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> APP_ID： </label>
					<div class="col-sm-4">
						<input type="text" id="appId" name="appId"
							class="validate[required] form-control" value="${object.appId}" />
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商户Id： </label>
					<div class="col-sm-4">
						<input type="text" id="mchId" name="mchId"
							class="validate[required] form-control"
							value="${object.mchId}" /> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 商户私钥： </label>
					<div class="col-sm-4">
						<input type="text" id="mchKey" name="mchKey"
							class="validate[required] form-control" value="${object.mchKey}" />
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">支付宝公钥： </label>
					<div class="col-sm-4">
						<input type="text" id="platformKey" name="platformKey"
							class="validate[required] form-control"
							value="${object.platformKey}" /> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 秘钥ID： </label>
					<div class="col-sm-4">
						<input type="text" id="queryChannelId" name="queryChannelId"
							class="validate[required] form-control" value="${object.queryChannelId}" />
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否可用： </label>
					<div class="col-sm-4">
						<select name="status" id="status" data-val="${object.status}"
							class="validate[required] form-control select2-auto">
								<option value="">请选择</option>
								<option value="1">可用</option>
								<option value="2">不可用</option>
						</select> 
						<span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label">创建时间： </label>
					<div class="col-sm-4">
						<input type="text" id="ct" name="ct" data-element-type="datetimepicker"  data-format="YYYY-MM-DD HH:mm:ss"
							class="validate[required] form-control" value="${object.createtime}" />
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            保存 <i class="fa fa-check"></i>
                        </button>
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
