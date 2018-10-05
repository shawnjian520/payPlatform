<%@ page language="java" pageEncoding="utf-8"%>
<% String basePath = request.getContextPath(); %>
<html>
	<head>
        <title>请选择复制到哪个节点下面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=basePath %>/resources/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<link rel="stylesheet" href="<%=basePath %>/resources/plugins/zTree_v3/css/metroStyle/metroStyle.css" type="text/css">
		<script type="text/javascript" src="<%=basePath %>/resources/plugins/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>/resources/plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="<%=basePath %>/resources/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script src="<%=basePath %>/resources/js/language.js"></script>
		<script type="text/javascript">
		var isclick = false;//控制是点击节点前的符号还是点击的是节点（默认点击节点会调用本身方法+点击符号的方法）
		var setting = {
			check: {
				enable: true
			},
			view: {
				dblClickExpand: false,//是否关闭双击事件
				showLine: true//是否显示节点连线
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick,//点击节点会调用方法
				onExpand: onExpand,//点击节点会符号调用方法
				onCheck: onCheck
			}
		};
function getCookie(name)//取cookies函数     
{  
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
	if(arr != null) return unescape(arr[2]); return null;  
}  
 var cookielang=getCookie("jdLanguage");
	var zNodes=null;
		if(cookielang == "en"){
			 zNodes =[
				{ id:"0", pId:'', name:"Select", open:true}
				${ztreehtml}
			];
		}else{
			 zNodes =[
				{ id:"0", pId:'', name:"全选", open:true}
				${ztreehtml}
			];
		}

		function dblClickExpand(treeId, treeNode) {
			return treeNode.level > 0;
		}

		function onClick(e,treeId, treeNode) {
			isclick = true;
			var zTree = $.fn.zTree.getZTreeObj("ztree");
			if(treeNode.id!='1'&&!treeNode.open){//不是根节点并且该节点未打开
				zTree.expandNode(treeNode, null, null, null, true);
			}
			if(!treeNode.isParent && treeNode.id.length<=2){
				getHtmlByPid(treeNode);
			}
		}

		//点击“+”号调用
		function onExpand(e,treeId, treeNode) {
			if(isclick){//如果是点击的节点，直接返回，不继续执行
				isclick = false;
				return false;
			}
			var zTree = $.fn.zTree.getZTreeObj("ztree");
			if(!treeNode.isParent && treeNode.id.length<=2){
				getHtmlByPid(treeNode);
			}
		}
		
		function onCheck(e,treeId, treeNode){
			var btn = $("#diyBtn_"+treeNode.pId);
			if (btn.attr('type')=='checkbox'){
				checkNode(treeNode.id,btn.attr('checked'),0);
			}else if(treeNode.id.length<=2){
				checkNode(treeNode.id,true,0);
			}else{
				tj();
			}
			
		}
		
		var yxz='';
		var gbm='';
		if(cookielang == "en"){
			 yxz='';
			 gbm=' User';
		}else{
			 yxz='已选中';
			gbm='个用户';
		}
		function tj(){
			var zTree = $.fn.zTree.getZTreeObj("ztree");
			var treeNodes = zTree.getCheckedNodes();
			
			
			var xzid = '';
			var xzname = '';
			var count = 0;
			for(var i =0;i<treeNodes.length;i++){
				if(treeNodes[i].id.length>2){
					xzid += treeNodes[i].id+',';
					xzname += treeNodes[i].name+' ';
					count++;
				}
			}
			
			parent.document.getElementById('jsrid').value=xzid;
			parent.document.getElementById('jsrname').value=xzname;
			parent.document.getElementById('xzbms').innerHTML=yxz+count+gbm;
			parent.document.getElementById('jsrname').focus();
		}

		function getHtmlByPid(treeNode){
			var wid = '${wid}';
			$.post(parent.tool.initParams('<%=basePath%>/s/system/sysDoc/getuserbytype'),{'type':treeNode.id,'wid':wid},function(data){
				add(treeNode,data);
			});
		}

		function add(treeNode,strhtml){
			var zTree = $.fn.zTree.getZTreeObj("ztree");
			treeNode.isParent=true;
			zTree.updateNode(treeNode);
			zTree.addNodes(treeNode, eval(strhtml));
			var wid = '${wid}';
			if(wid!=null && wid!=''){
				tj();
			}
		}
		
		function checkNode(id,check,num) {
			var zTree = $.fn.zTree.getZTreeObj("ztree");
			var node = zTree.getNodeByParam("id", id, null);
			if(check && node.isParent){
				var nodes = node.children;
				if(nodes!=null){
					for(var i=0;i<nodes.length;i++){
						zTree.checkNode(nodes[i], node.checked, false, null);
						checkNode(nodes[i].id,true,1);
					}
				}
			}
			if(num==0) tj();
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#ztree"), setting, zNodes);
			document.getElementById('ztree').style.height = 'auto';
			document.getElementById('ztree').style.width = 'auto';
			type = { "Y":"", "N":""};
			$.fn.zTree.getZTreeObj("ztree").setting.check.chkboxType = type;
			tj();
		});
		
		</script>
		<style type="text/css">
			.ztree li span.button.switch.level0 {visibility:hidden; width:1px;}
			.ztree li ul.level0 {padding:0; background:none;}
			.ztree li button.switch {visibility:hidden; width:1px;}
			.ztree li button.switch.roots_docu {visibility:visible; width:16px;}
			.ztree li button.switch.center_docu {visibility:visible; width:16px;}
			.ztree li button.switch.bottom_docu {visibility:visible; width:16px;}
			.checkDemo{height: 16px;overflow: hidden;width: 90px;float: right;}
			.checkDemo input{background-color: #ffffff;margin-top: 2px;float: left;}
			.checkDemo lable{float: left;line-height: 16px;color: #8b91a3;}
		</style>
	</head>

	<body style="">
<%--		<label class="checkbox inline" style="margin-bottom: 5px;">--%>
<%--			<input type="checkbox" onclick="if($(this).val()=='0') $(this).val('1');else $(this).val('0');" value="0" id="sign"> 同步选中所选部门的所有下属部门--%>
<%--		</label>--%>
		<ul id="ztree" class="ztree" style="width:280px; overflow:auto;border: 0;height: 95%;margin-bottom: 10px;padding: 0px 5px;"></ul>
	</body>
</html>
