<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%@include file="../../common/input-header.jsp" %>
<div class="col-md-10 col-md-offset-1">
	<div class="panel panel-white">
		<div class="panel-heading">
			<h4 class="panel-title">${object.lbmc}管理</h4>
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
			<form role="form" class="form-horizontal">
				<input type="hidden" id="wid" name="wid" value="${object.wid}" />
				<input type="hidden" id="zdlb" name="zdlb" value="${object.zdlb}" />
				<input type="hidden" id="lbmc" name="lbmc" value="${object.lbmc}" />

				<div class="form-group">
					<label class="col-sm-2 control-label"> ${object.lbmc}： </label>

					<div class="col-sm-10">
						<input type="text" id="zdmc" name="zdmc" class="validate[required] form-control" value="${object.zdmc}"/>
						<span class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"> 编码： </label>

					<div class="col-sm-10">
						<input type="text" id="zdbm" name="zdbm"
							   class="validate[required,MaxSize[2]] form-control" value="${object.zdbm}" /> <span
							class="symbol required"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"> 排序： </label>

					<div class="col-sm-10">
						<input type="text" id="zdpx" name="zdpx"
							   class="validate[required,custom[integer]] form-control" value="${object.zdpx}" /> <span
							class="symbol required"></span>
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
<%@include file="../../common/input-bottom.jsp" %>
