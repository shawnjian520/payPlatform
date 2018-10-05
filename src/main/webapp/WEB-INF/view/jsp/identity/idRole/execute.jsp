<%@ page import="com.jd.util.CacheEnum" %>
<%@ page import="com.jd.support.cache.CacheUtils" %>
<%@ page import="com.jd.system.entity.TSysInit" %>
<%@ page language="java" pageEncoding="utf-8" %>
<!-- start: PAGE CONTENT -->
<%@include file="../../common/other/tab-model-header.jsp" %> 
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div class="tabModel-content animated hide">
    <!-- start: PAGE CONTENT -->
    <div id="page-content" class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-sm-3">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class="" data-localize="frame_xtgl.bmgl_zzjglxgl_zzjglxlb">用户角色分组</span></h4>
                        </div>
                        <div class="panel-body">
                            <div id="menuTree" class="ztree">loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9 padding-left-0" id="input-page-content">
                    <div>loading...</div>
                </div>
            </div>
        </div>
    </div>
    <!-- end: PAGE CONTENT-->
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/other/tab-model-bottom.jsp" %>
<script type="text/javascript">
    page = {
        //不使用ztree节点图标,使用矢量字体库作为图标
        treeObj: null,
        /**
         * 点击节点事件
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) {
            Main.ajaxLoaderUrl(basePath + "/s/id/idRole/list?roletype=" + treeNode.id, $("#input-page-content"), '角色列表');
        }
    }

    $(function () {
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
        }
        $.post(basePath + "/s/ajax/getroletype", function (data) {
        	if(data!="null"){
            page.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval(data));
            //默认选中第一个父节点
            var pNode = page.treeObj.getNodeByParam("id","1", null);
            page.treeObj.selectNode(pNode);
            page.zTreeOnClick(null, null, pNode);
            }else{
            	Main.ajaxLoaderUrl(basePath + "/s/id/idRole/list", $("#input-page-content"), '角色列表');
            }
        });
    });


</script>