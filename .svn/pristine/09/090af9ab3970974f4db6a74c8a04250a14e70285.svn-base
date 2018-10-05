<%@page import="com.jd.system.Const"%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<% String basePath = request.getContextPath(); %>
<?import namespace="v" implementation="#default#VML" ?>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/resources/plugins/GooFlow/codebase/GooFlow.css"/>
<div class="row">
	<div class="col-md-12">
		<div id="pro_div">
			<div id="demo"></div>
		</div>
		<div class="wrt hide">
			<div class="col-md-12 " id="newinput" style="padding-top: 10px;">
				<form id="form0" role="form" class="form-horizontal">
					<br/>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"> 选择角色：
						</label>
						<div class="col-sm-10">
							<select name="groupJs" id="groupJs0"
									class="validate[required] select2-auto">
								<option value=""></option>
								<c:forEach items="${list_group }" var="group">
									<option value="${group.id }">${group.caption }</option>
								</c:forEach>
							</select> <span class="symbol required"></span>
						</div>
					</div>
				</form>
				<form id="form1" role="form" class="form-horizontal">
					<input type="hidden" id="lcid" name="lcid" value="${wid }"/>
					<br/>
					<div class="form-group hide" id="tab1">
						<label class="col-sm-2 control-label nopadding"
						> 流程分支： </label>
						<div class="col-sm-10">

						</div>
					</div>
					<div class="form-group">
						<input type="hidden" id="wid" name="wid" value=""/>
						<label class="col-sm-2 control-label"
							   for="name"> 开始节点： </label>
						<div class="col-sm-10">
							<select name="groupFs" id="groupFs" class="select2-auto">
								<option value=""></option>
								<c:forEach items="${list_group }" var="group">
									<c:set var="groups" value="0"></c:set>
									<c:forEach items="${list }" var="pro">
										<c:if test="${group.id==pro.groupJs && groups=='0'}">
											<c:set var="groups" value="1"></c:set>
											<option value="${group.id }">${group.caption }</option>
										</c:if>
									</c:forEach>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"> 当前结点：
						</label>
						<div class="col-sm-10">
							<select name="groupJs" id="groupJs"
									class="validate[required] select2-auto">
								<option value=""></option>
								<c:forEach items="${list_group }" var="group">
									<option value="${group.id }">${group.caption }</option>
								</c:forEach>
							</select> <span class="symbol required"></span>
						</div>
					</div>
				</form>
				<form id="form2" role="form" class="form-horizontal">
					<input type="hidden" id="wid2" name="wid" value=""/>
					<br/>
					<div class="form-group hide" id="tab2">
						<label class="col-sm-2 control-label nopadding"
						> 流程分支： </label>
						<div class="col-sm-10">

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"
							   for="name"> 待审状态： </label>
						<div class="col-sm-4">
							<select name="ztWcl" id="ztWcl" class=" select2-auto">
								<option value=""></option>
								<c:forEach items="${list_zdlb }" var="zdlb">
									<option value="${zdlb.id }">${zdlb.caption }</option>
								</c:forEach>
							</select>
						</div>
						<%--							</div>--%>
						<%--							<div class="form-group">--%>
						<label class="col-sm-2 control-label nopadding"> 退回状态：
						</label>
						<div class="col-sm-4">
							<select name="ztShth" id="ztShth" class=" select2-auto">
								<option value=""></option>
								<c:forEach items="${list_zdlb }" var="zdlb">
									<option value="${zdlb.id }">${zdlb.caption }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"
							   for="name"> 通过状态： </label>
						<div class="col-sm-4">
							<select name="ztShtg" id="ztShtg" class=" select2-auto">
								<option value=""></option>
								<c:forEach items="${list_zdlb }" var="zdlb">
									<option value="${zdlb.id }">${zdlb.caption }</option>
								</c:forEach>
							</select>
						</div>
						<%--							</div>--%>
						<%--							<div class="form-group">--%>
						<label id="ztZflabel" class="col-sm-2 control-label nopadding">
							作废状态： </label>
						<div class="col-sm-4">
							<select name="ztZf" id="ztZf" class=" select2-auto">
								<option value=""></option>
								<c:forEach items="${list_zdlb }" var="zdlb">
									<option value="${zdlb.id }">${zdlb.caption }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"
						> 赎回状态： </label>
						<div class="col-sm-4">
							<select name="ztShh" id="ztShh" class=" select2-auto">
								<option value=""></option>
								<c:forEach items="${list_zdlb }" var="zdlb">
									<option value="${zdlb.id }">${zdlb.caption }</option>
								</c:forEach>
							</select>
						</div>
						<%--							</div>--%>
						<%--							<div class="form-group">--%>
						<label class="col-sm-2 control-label nopadding"> 关联字段：
						</label>
						<div class="col-sm-4">
							<input type="text" name="glzd" id="glzd" class="form-control"
								   placeholder="选中对象字段，批量操作字段"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"
						> 是否退回： </label>
						<div class="col-sm-10">
							<label class="radio-inline"><input type="radio"
															   name="auto_th" id="auto_th" class="mgr" value="1"
															   checked="checked"/>是</label> <label class="radio-inline"><input
								type="radio" name="auto_th" id="auto_th" class="mgr"
								value="0"/>否</label> <font color="red">（审核通过的数据是否可以被审核退回，默认可以）</font>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"
						> 是否上报： </label>
						<div class="col-sm-10">
							<label class="radio-inline"><input type="radio"
															   name="auto_sb" id="auto_sb" class="mgr" value="1"
															   />是</label> <label class="radio-inline"><input
								type="radio" name="auto_sb" id="auto_sb" class="mgr"
								value="0" checked="checked"/>否</label> <font color="red">（被退回的数据是否可以直接上报，默认不可以）</font>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding" > 处理页面url：</label>
						<div class="col-sm-4">
							<input type="text" name="list_url" id="list_url" class="form-control" placeholder="/s/biz/test/list"/>
						</div>
						<label class="col-sm-2 control-label nopadding"> 节点状态： </label>
						<div class="col-sm-4">
							<label class="radio-inline">
								<input type="radio" name="jdzt" id="jdzt" class="mgr" value="1" checked="checked"/>启用</label>
							<label class="radio-inline">
								<input type="radio" name="jdzt" class="mgr" value="0"/>禁用</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"> 操作用户： </label>
						<div class="col-sm-10" id="userid_div">
							
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label nopadding"> 条件： </label>
						<div class="col-sm-10">
							<textarea name="param" id="param" rows="3" class="form-control" placeholder="param1='1' and param2='2'"></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="../../common/input-bottom.jsp" %>
		<%@include file="../../common/plugins/js/select2.jsp" %>
		<script type="text/javascript" src="<%=basePath%>/resources/plugins/GooFlow/GooFunc.js"></script>
		<script type="text/javascript" src="<%=basePath%>/resources/plugins/GooFlow/json2.js"></script>
		<script type="text/javascript" src="<%=basePath%>/resources/plugins/GooFlow/codebase/GooFlow.js"></script>
		<script type="text/javascript" src="<%=basePath %>/resources/plugins/GooFlow/pro.js"></script>
		<script>
			var userloginid = '<%=LoginUtil.getloginuser(request).getUserloginid()%>';
			var isadmin = <%=(Const.depart_szx.equals(LoginUtil.getloginuser(request).getDepart().getDeparttype())) %>;//是否是最
			var width = document.body.clientWidth;
			var height = parent.document.body.clientHeight;
			width = width - 100;
			height = height - 130;
			var property = {
				width: width,
				height: height,
				toolBtns: ["start round", "task round"],
				haveHead: true,
				headBtns: ["close", "save", "cancel"],//如果haveHead=true，则定义HEAD区的按钮
				haveTool: true,
				headLabel: true,
				initLabelText: '${name}&nbsp;&nbsp;&nbsp;',
				haveGroup: false,
				useOperStack: true
			};
			var remark = {};

			$(document).ready(function () {
				subPagepro.basePath = '<%=basePath%>';
				subPagepro.demo = $.createGooFlow($("#demo"), property);
				subPagepro.demo.setNodeRemarks(remark);
				subPagepro.demo.loadData(${jsonstr});
				var nr_height = height - 50;
				if (nr_height < 450) nr_height = 450;
				$('#draw_demo').parent().css({'height': nr_height, 'width': width - 65}).each(function () {
					$('.wrt').css({
						'height': height - 29,
						'width': width - 5,
						'top': getTop(this) - 15,
						'left': getLeft(this) - 34,
						'overflow-y': 'scroll'
					});
				});

				$('#draw_demo').css({'height': nr_height, 'width': width - 65});
				//$('.GooFlow_tool_div').remove();
				//$('.GooFlow_tool').remove();
				$('.GooFlow_work').css({'width': width - 44, 'margin': '0'});
				subPagepro.closewrt();

			});
			var out;
			function Export() {
				document.getElementById("result").value = JSON.stringify(demo.exportData());
			}
			/**
			 * 获得对象e到页面顶部（最上面）的距离
			 * @param e 对象
			 * @return
			 */
			function getTop(e) {
				var offset = e.offsetTop;
				if (e.offsetParent != null) offset += getTop(e.offsetParent);
				return offset;
			}

			/**
			 * 获得对象e到页面左边（最左面）的距离
			 * @param e 对象
			 * @return
			 */
			function getLeft(e) {
				var offset = e.offsetLeft;
				if (e.offsetParent != null) offset += getLeft(e.offsetParent);
				return offset;
			}
		</script>
		<style>
			.div_pro {
				background-color: #10B29D;
				font-family: '微软雅黑';
				color: #ffffff;
				text-align: center;
				padding: 10px;
				height: 50px;
				cursor: pointer;
			}

			.group_pro {
				margin-bottom: 10px;
			}

			.wrt {
				position: absolute;
				z-index: 1000;
				top: 0;
				background-color: #ffffff;
			}
		</style>
	</div>
</div>