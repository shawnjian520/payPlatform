<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<%@include file="../../common/input-header.jsp"%>
<style>
#accordion .panel-title {
	cursor: pointer;
}

#accordion .panel-heading {
	min-height: 20px;
	padding: 5px;
	background-color: #fff !important;
}

#accordion .panel-title {
	font-size: 13px;
}

#accordion .panel-body {
	border: 0 !important;
	padding: 5px 15px;
}

#accordion .panel {
	box-shadow: none !important;
}

#accordion ul {
	padding-left: 20px;
	margin: 0;
}

#accordion ul li {
	cursor: pointer;
}

.panel-body {
	padding: 5px 10px 10px 10px;
}

.panel-tabs>.panel-heading {
	min-height: 35px;
	background-color: #f2f2f2;
}

#code-mirror-html,#code-mirror-js {
	padding: 5px !important;
}

.panel-title {
	height: 17px;
}

.label-info {
	margin-right: 5px;
}

.label-info .red {
	cursor: pointer;
}

.layout-active {
	display: block !important;
	padding: 20px !important;
	cursor: pointer !important;
	box-shadow: inset 0 0 10px #0CC !important;
}

.layout-active * { /*display: none;*/
	
}

.CodeMirror {
	height: 350px !important;
}

.tabbable.edit-element .nav-tabs {
	border: medium none;
	float: none;
	margin-top: 0;
}

.tabbable.edit-element {
	padding: 1px;
	margin-bottom: 15px;
}

.modal-container {
	display: block;
}

.mask {
	box-sizing: border-box;
	border: 2px dashed #ff0033;
	box-shadow: inset;
	cursor: pointer;
	opacity: 0.5;
	position: absolute;
	color: #ff0033;
	font-weight: bold;
	background-color: #eee;
}
</style>
<div class="row">
	<form role="form" class="form-horizontal">
		<input type="hidden" name="wid" id="wid" value="${object.wid}" />
		<textarea id="tcontroller" hidden="hidden">${object.controllercode}</textarea>
		<textarea id="tserviceImpl" hidden="hidden">${object.serviceimplcode}</textarea>
		<textarea id="tservice" hidden="hidden">${object.servicecode}</textarea>
		<div class="col-md-2">
			<jd:panel className="input-panel" title="功能配置">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne"
							role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">
							<h4 class="panel-title">
								<i class="fa fa-plus"></i> Controller
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<ul>
									<li data-temple-index="1">新增请求方法</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingtwo"
							role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo" aria-expanded="true"
							aria-controls="collapseTwo">
							<h4 class="panel-title">
								<i class="fa fa-plus"></i> ServiceImpl
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingtwo">
							<div class="panel-body">
								<ul>
									<li data-temple-index="20">普通分组</li>
									<li data-temple-index="21">input数据分组</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</jd:panel>
		</div>
		<div class="col-md-10">
			<div class="panel panel-white panel-tabs">
				<div class="panel-heading">
					<h4 class="panel-title" id="common-jsp"></h4>
				</div>
				<div class="panel-body">
					<div class="tabbable">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"
								href="#code-mirror-controller">Controller</a></li>
							<li><a data-toggle="tab" href="#code-mirror-serviceImpl">ServiceImpl
							</a></li>
							<li><a data-toggle="tab" href="#code-mirror-service">Service
							</a></li>
						</ul>
						<div class="tab-content">
							<div id="code-mirror-controller" style="height:100%;"
								class="tab-pane fade in active">
								<div class="row">
									<div class="col-xs-12">

										<button class="btn btn-sm btn-success" type="button"
											onclick="show()">Test</button>
										<button class="btn btn-sm btn-success" type="button"
											onclick="subPage.saveData(this)">
											保存 <i class="fa fa-check"></i>
										</button>
									</div>
								</div>
								<textarea style="width:100%;height:530px;"></textarea>
							</div>
							<div id="code-mirror-serviceImpl" style="height: 100%"
								class="tab-pane fade  active">

								<textarea style="width:100%;height:530px;"></textarea>
							</div>
							<div id="code-mirror-service" style="height: 100%"
								class="tab-pane fade  active">

								<textarea style="width:100%;height:530px;"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<div id="MController" class="hide">
	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 group-name">
                <div class="form-group">
                    <label title="分组名称"
                           class="col-sm-3 control-label ell validate[required]"
                           for="group-name">分组名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="group-name" class="form-control"> <span
                            class="symbol required"></span>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 group-name">
                <div class="form-group">
                    <label title="分组名称"
                           class="col-sm-3 control-label ell validate[required]"
                           for="group-name">分组名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="group-name" class="form-control"> <span
                            class="symbol required"></span>
                    </div>
                </div>
            </div>
            
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 group-name">
                <div class="form-group">
                    <label title="分组名称"
                           class="col-sm-3 control-label ell validate[required]"
                           for="group-name">分组名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="group-name" class="form-control"> <span
                            class="symbol required"></span>
                    </div>
                </div>
            </div>
</div>

<%@include file="../../common/input-bottom.jsp"%>
<link rel=stylesheet
	href="<%=basePath%>/resources/plugins/CodeMirror-master/lib/codemirror.css">
<script
	src="<%=basePath%>/resources/plugins/CodeMirror-master/lib/codemirror.js"></script>
<script
	src="<%=basePath%>/resources/plugins/CodeMirror-master/mode/clike/clike.js"></script>
<script
	src="<%=basePath%>/resources/plugins/CodeMirror-master/addon/edit/matchbrackets.js"></script>
<script src="<%=basePath%>/resources/js/formatting.js"></script>
<script>
	var codeMirrorController;
	var codeMirrorServiceImpl;
	var codeMirrorService;
	$(document).ready(
			function() {
				codeMirrorController = CodeMirror.fromTextArea(
						$("#code-mirror-controller textarea")[0], {
							lineNumbers : true,
							matchBrackets : true,
							indentUnit : 0,
							indentWithTabs : true,
							mode : "text/x-java"
						});
				codeMirrorController.setValue($("#tcontroller").val());

				codeMirrorServiceImpl = CodeMirror.fromTextArea(
						$("#code-mirror-serviceImpl textarea")[0], {
							lineNumbers : true,
							matchBrackets : true,
							indentUnit : 0,
							indentWithTabs : true,
							mode : "text/x-java"
						});

				codeMirrorServiceImpl.setValue($("#tserviceImpl").val());
				codeMirrorService = CodeMirror.fromTextArea(
						$("#code-mirror-service textarea")[0], {
							lineNumbers : true,
							matchBrackets : true,
							indentUnit : 0,
							indentWithTabs : true,
							mode : "text/x-java"
						});
				codeMirrorService.setValue($("#tservice").val());

				$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
					if (e.target.hash == "#code-mirror-service") {//激活代码tab

					}
					if (e.target.hash == "#code-mirror-serviceImpl") {//激活代码tab

					}
					if (e.target.hash == "#code-mirror-controller") {//激活代码tab

					}
				});
				$('li[data-temple-index]').click(function() {
					var $el = $(this);
					index = Number($el.attr('data-temple-index'));
					showDia('MController', 'Controller自定义方法', '');
				});

			});

	function showDia(modalId, title, functionName) {
		var message = '<div class="pl30 pr30"><form role="form" class="form-horizontal"><div class="row">'
				+ $('#' + modalId).html() + '</div></form></div>';
		window.parent.bootbox.dialog({
			title : title,
			className : '',
			message : message,
			buttons : {
				copy : {
					label : "确定",
					className : 'btn-sm btn-success',
					callback : function() {
						functionName();
					}
				},
				close : {
					label : "关闭",
					className : "btn-default btn-sm",
					callback : function() {
					}
				}
			}
		});
	}

	function show2() {
		alert(111);
	}
</script>