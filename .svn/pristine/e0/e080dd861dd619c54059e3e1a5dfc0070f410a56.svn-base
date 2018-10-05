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
					<label class="col-sm-2 control-label">商户号： </label>
					<div class="col-sm-4">
						<input type="text" id="merchantId" name="merchantId"
							class="validate[required] form-control"
							value="${object.merchantId}" /> <span class="symbol required"></span>
					</div>
					<label class="col-sm-2 control-label"> 商户名称： </label>
					<div class="col-sm-4">
						<input type="text" id="name" name="name"
							class="validate[required] form-control" value="${object.name}" />
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">秘钥： </label>
					<div class="col-sm-4">
						<input type="text" id="apiKey" name="apiKey"
							class="validate[required] form-control" value="${object.apiKey}" />
						<span class="symbol required"></span>
					</div>
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
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">创建时间： </label>
					<div class="col-sm-4">
						<input type="text" id="ct" name="ct" data-element-type="datetimepicker"  data-format="YYYY-MM-DD HH:mm:ss"
							class="validate[required] form-control" value="${object.createtime}"/>
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
