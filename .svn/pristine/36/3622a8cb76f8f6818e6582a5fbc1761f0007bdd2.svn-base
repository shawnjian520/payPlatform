<%@page import="com.jd.system.Const"%>
<%@ page import="com.jd.system.util.LoginUtil" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<%@include file="../../common/other/tab-model-header.jsp" %>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/jQuery-Validation-Engine.jsp" %>
<div class="tabModel-content animated hide">
    <div id="page-content" class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-sm-3">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class="">流程</span></h4>
                            
                        </div>
                        <div class="panel-body">
                        	<c:if test="<%=(Const.depart_szx.equals(LoginUtil.getloginuser(request).getDepart().getDeparttype())) %>">
	                        	<a class="btn btn-sm btn-success" onclick="page.addData(this)">
						            新增流程 <i class="fa fa-plus"></i>
						        </a>
					        </c:if>
                            <div id="menuTree" class="ztree">loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class="">详细信息</span></h4>
                        </div>
                        <div class="panel-body">
                            <div class="alert dn">
                                <button data-dismiss="alert" class="close">
                                    ×
                                </button>
                                <strong></strong>
                            </div>
                            <div id="input-page-content">
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/jQuery-Validation-Engine.jsp" %>
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/other/tab-model-bottom.jsp" %>
<!-- end: PAGE CONTENT-->
<script type="text/javascript">
    page = {
        treeObj: null,
        /**
         * 点击节点事件
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) {
        	if(treeNode.pId=='0' || treeNode.id=='0'){
        		return false;
        	}
            Main.ajaxLoaderUrl(basePath + "/s/biz/process/input/" + treeNode.id, $("#input-page-content"));
        },
        /**
         * 新增下级
         */
         addData: function () {
            Main.ajaxLoaderUrl(basePath + "/s/biz/process/openCreate", $("#input-page-content"));
            $(".form-horizontal").validationEngine();
        },
        loaddata:function(){
        	var setting = {
                    view: {
                        showIcon: false,
                        nameIsHTML: true,
                        showTitle: false
                    },
                    data: {
                        simpleData: {
                            enable: true
                        },
                        key: {
                            url: ""
                        }
                    },
                    callback: {
                        onClick: page.zTreeOnClick
                    }
                };
        	$.post(tool.initParams(basePath + "/s/biz/process/listdata"), function (data) {
                page.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval(data));
            });
        },
        loadi:function(wid){
        	Main.ajaxLoaderUrl(basePath + "/s/biz/process/input/" + wid, $("#input-page-content"));
        },
        doUniChangeState:function(type,el){
			var ids = $('#wid').val();
			$.post(tool.initParams('<%=basePath%>/s/biz/process/upzt'),{'wid':ids,'type':type},function(data){
				if(data=='SUCCESS'){
					page.loadi(ids);
				}else{
                     tool.alertWarning(data);
				}
			});
		},
		copyData:function(el,wid){
			Main.ajaxLoaderUrl(basePath + "/s/biz/process/copy/"+wid, $("#input-page-content"));
            $(".form-horizontal").validationEngine();
		},
		open1:function(el){
			var ids = $('#wid').val();
		 	tool.openview(el,'<%=basePath%>/s/biz/process/pro/'+ids);
			
		},
		open2:function(el){
			var ids = $('#wid').val();
			tool.openview(el,'<%=basePath%>/s/biz/processlog/listlog/'+ids);
			
		},
		deleteData:function(el){
			var ids = $('#wid').val();
			 $.ajax({
		            url: tool.initParams('<%=basePath%>/s/biz/process/remove'),
		            type: "post",
		            data: {"wid": ids},
		            dataType: "json",
		            timeout: 1000 * 5,
		            error: function (XMLHttpRequest, textStatus, errorThrown) {
		                tool.ajaxError(XMLHttpRequest, textStatus, errorThrown, backdrop);
		            },
		            success: function (data) {
		                //tool.removeWaitForResponseStatus();
		                data = eval(data);
		                if (data.res) {
		                	$("#input-page-content").html('');
		                	page.loaddata();
		                } else {
		                    setTimeout('tool.alertError("操作失败!","' + data.msg + '")', 100);
		                }
		            }
		        });
		}
    };

    $(function () {
        
        page.loaddata();

    });
</script>