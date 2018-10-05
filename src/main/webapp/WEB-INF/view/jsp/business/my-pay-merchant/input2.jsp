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
				<input type="hidden" id="merid" name="merid" value="${merobj.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">商户名称： </label>
					<div class="col-sm-4">
						<input type="text" id="payMerchanName" name="payMerchanName"
							class="validate[required] form-control"
							value="${merobj.name}" readonly/> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 支付方式： </label>
					<div class="col-sm-4">
						<select name="payTypeName" id="payTypeName" data-val=""
							class="validate[required] form-control select2-auto">
								<option value="">请选择</option>
								<%-- ${getChannels.id } --%>
								<c:forEach items="${getChannels}" var="chas">
									<option value="${chas.pay_type_name }">${chas.pay_type_name }</option>
								</c:forEach>
						</select> 
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">支付描述： </label>
					<div class="col-sm-4">
						<select name="tradeType" id="tradeType" data-val=""
							class="validate[required] form-control select2-auto">
								<option value="">请选择</option>
								<option value="JSAPI">WAP支付</option>
								<option value="NATIVE">扫码支付</option>
								<option value="APP">APP支付</option>
								<option value="WAP">WAP支付</option>
								<option value="MICROPAY">刷卡支付</option>
						</select> 
						<span class="symbol required"></span>
					</div>
				</div>
				
				<div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            分配 <i class="fa fa-check"></i>
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
