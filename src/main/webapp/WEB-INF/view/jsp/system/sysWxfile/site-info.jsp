<%@page import="com.jd.util.ClientUtil"%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
    String _mainProjectUrl = ClientUtil.getString("node.main.url");;
%>
<style>
	.controlLeft{
		width: 18%;
		float:left;
		margin-right: 3%;
	}
	.viewRight{
		width: 52%;
		float:right;
	 	height: 700px;
	}
	#HTMLDATWAP {
		    width: 360px;
		    height: 754px;
		    position: absolute;
		    padding: 60px 0 88px 0;
		    left:18%;
		    margin-top: -5%;
	}
#wqdIphoneHead {
    position: absolute;
    width: 100%;
    height: 50px;
    background: url("<%=basePath%>/resources/wp/images/phone_head.png") no-repeat center center;
}
	#wqdIphoneContainer {
    position: absolute;
    width: 100%;
    height: auto;
    margin: 110px 0 88px 0;
    top: 0;
    bottom: 0;
    background: url("<%=basePath%>/resources/wp/images/phone_body.png") repeat-y 0px center;
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
#wqdIphoneFooter {
    position: absolute;
    width: 100%;
    height: 88px;
    bottom: 0px;
    background: url("<%=basePath%>/resources/wp/images/phone_footer.png") no-repeat center center;
}
.wqContent{
	width: 320px;
	height: 100%;
	margin-left: 30px;
}
::-webkit-scrollbar {
		  width: 2px;
}  
	::-webkit-scrollbar-track {
		  background-color: #e2e3e5;
	} /* 滚动条的滑轨背景颜色 */

	::-webkit-scrollbar-thumb {
		  background-color: rgba(0, 0, 0, 0.2); 
	} /* 滑块颜色 */

	::-webkit-scrollbar-button {
		   background-color: rgba(0, 0, 0, 0.2);
	} /* 滑轨两头的监听按钮颜色 */

	::-webkit-scrollbar-corner {
		  background-color: black;
} /* 横向滚动条和纵向滚动条相交处尖角的颜色 */
 .thumbnail2 a{
	float: left; width: 100px;height:58px;margin: 10px;padding: 3px; border: 1px solid #ddd;border-radius: 4px;
 }
 .thumbnail2 a:HOVER{
	  border: 1px solid #3399CC; 
 }
 #code-mirror-js {
        padding: 5px !important;
 }
</style>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %> 
<%@include file="../../common/input-header.jsp" %> 
<!-- 左边模块配置start -->
<div class="panel panel-default controlLeft">
	<div class="panel-heading">
		<h3 class="panel-title">
			${themeName}
		</h3>
	</div>
	<div class="panel-body">
	 	<div id='site-List' class="ztree">
	 		loading...	
	 	</div>
	</div>
</div>
<!-- 左边模块配置end-->

<!-- 右边模块预览start -->
<!-- <div class="panel panel-default viewRight">
	<div class="panel-heading">
		<h3 class="panel-title">
			H5预览
		</h3>
	</div>
	<div class="panel-body" style="">
	</div>
</div> -->
<div id="HTMLDATWAP"style="float: left;">
			<div id="wqdIphoneHead"></div>
			<div id="wqdIphoneContainer">
				<div class="wqContent" overflow-y:scroll;>
						<iframe src="" 
						name="contain" marginwidth="0" marginheight="0" scrolling="yes" frameborder="0" id="contain"  width="100%" height="100%"></iframe>
				</div>
			</div>
			<div id="wqdIphoneFooter"></div>
</div>

<div class="panel panel-default viewRight">


<ul id="myTab" class="nav nav-tabs">
	<li class="active">
		<a href="#baseInfos" data-toggle="tab">
			基本信息
		</a>
	</li>
	<li><a href="#code-mirror-js" data-toggle="tab">JavaScript</a></li>
</ul>

<div id="myTabContent" class="tab-content">
<div class="tab-pane fade in active" id="baseInfos">
	<textarea id="htmlDoc" hidden="hidden">1</textarea>
	<div class="panel-heading">
	 <a href="javascript:void(0)" id="enableEdit"  class="btn btn-success btn-xs editE" title="启用编辑" onclick="subPage.enableEdit()">  <i class="fa fa-edit"></i> 启用编辑 </a>
	 <a href="javascript:void(0)" id="disableEdit"  class="btn btn-success btn-xs editE" title="关闭编辑" onclick="subPage.disableEdit()">  <i class="fa fa-clipboard"></i> 关闭编辑 </a>
	 <a href="javascript:void(0)" id="saveEdit" class="btn btn-success btn-xs editE" title="保存编辑" onclick="subPage.saveEdit()">  <i class="fa fa-save"></i> 保存编辑 </a>
	 <a href="javascript:void(0)" id="saveEditFile" class="btn btn-success btn-xs" title="生成网页" onclick="subPage.saveEditFile()">  <i class="fa fa-save"></i> 生成网页 </a>
	</div>
	<div class="panel-body">
		<h3 id="elementName">尚未编辑</h3>
	<hr/>
		  <div style="border: 1px solid white;clear:both;">
		     <h4>元素操作</h4> 
		      <a href="javascript:void(0)" id="removeElement"  class="btn btn-primary btn-xs editE" title="移除元素" onclick="subPage.removeElement()">  <i class="fa  fa-trash-o"></i>  移除元素 </a>
		      <a href="javascript:void(0)" id="copyElement" class="btn btn-primary btn-xs editE" title="复制元素" onclick="subPage.copyElement()">  <i class="fa   fa-copy"></i>  复制元素 </a>
		      <a href="javascript:void(0)" id="upElement" class="btn btn-primary btn-xs editE" title="上移元素" onclick="subPage.upElement()">  <i class="fa   fa-copy"></i>  上移元素 </a>
		      <a href="javascript:void(0)" id="downElement"  class="btn btn-primary btn-xs editE" title="下移元素" onclick="subPage.downElement()">  <i class="fa   fa-copy"></i>  下移元素 </a>
		  </div>
	<div id="_baseInfo">
	 <h4 style="color: #30866B;">基本信息</h4>
	 	<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "  >
		    <div class="form-group">
		        <label title="ID" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >页面名称：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control" placeholder="pageName" id="pageName" name="pageName"><span class="symbol"></span>
		        </div>
		   </div>
		</div>
		
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "   >
		    <div class="form-group">
		        <label title="pageEntity" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >实体类：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control" placeholder="com.apexedu.biz." id="pageEntity" name="pageEntity"><span class="symbol"></span>
		        </div>
		   </div>
		</div>
		
		 <div class="col-xxxl-4 col-md-6 col-sm-12 nopadding " style="margin-top: 10px;" >
		    <div class="form-group">
		        <label title="Name" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >选择节点：</label>
		        <div class="col-sm-10">
		            <select  class="form-control" id="eleNode"  name="eleNode">
		            		<option value="">请选择节点</option>
		            		<c:forEach items="${nodes}" var="n">
		            			<option value="${n.id}">${n.caption}</option>
		            		</c:forEach>
		            </select>
		        </div>
		    </div>
		</div>
		
		<div style="clear: both;"></div>
	 	  <div class="col-xxxl-4 col-md-6 col-sm-12 nopadding editE"style="margin-top: 10px;display: none;"   >
		    <div class="form-group">
		        <label title="ID" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >ID：</label>
		        <div class="col-sm-10">
		        	  <input type="text" class="form-control" placeholder="未设置" id="eleId" name="eleId"><span class="symbol"></span>
		        </div>
		   </div>
		</div>
		 <div class="col-xxxl-4 col-md-6 col-sm-12 nopadding editE" style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="Name" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >Name：</label>
		        <div class="col-sm-10">
		            <select  class="form-control" id="eleName"  name="eleName"></select>
		        </div>
		    </div>
		</div>
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "  style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="Text" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >Text：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control" placeholder="未设置" id="eleText" name="eleText"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "  style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="Src" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >Src：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control" onfocus="selectPic()" placeholder="未设置" id="eleSrc" name="eleSrc"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		
		 <div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "  style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="eleCk" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >点击事件：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control"  placeholder="未设置" id="eleCk" name="eleCk"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "  style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="Href" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >Href：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control"  placeholder="未设置" id="eleHref" name="eleHref"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding "  style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="Value" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >Value：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control"  placeholder="未设置" id="eleval" name="eleval"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		
		
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding " style="margin-top: 10px;display: none;" >
		    <div class="form-group">
		        <label title="显示条数" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >显示条数：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control" placeholder="未设置" id="eleCount" name="eleCount"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding " style="margin-top: 10px;display: none;"  >
		    <div class="form-group">
		        <label title="数据源地址" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >数据源地址：</label>
		        <div class="col-sm-10">
		            <input type="text" class="form-control" placeholder="/biz/s/getList" id="eleData" name="eleData"><span class="symbol"></span>
		        </div>
		    </div>
		</div>
		
		</div>
		     <div class="_listBox"  style="border: 1px solid white;clear:both; display: none;">
		     <h4>列表数据</h4>
		     	<div id="listContent">
		     	</div>
		     </div>
	</div>
	</div>
	<div class="tab-pane fade" id="code-mirror-js">
	<textarea></textarea>
	</div>
</div>
</div>

<div class="modal fade" id="picModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1010px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">选择图片</h4>
            </div>
            <div class="modal-body" style="height: 400px;">
            	<!-- <div style="width: 20%;float: left;">
            		<div id='pic-List' class="ztree">
	 					loading...	
	 				</div>
            	</div> -->
            		<div style="overflow-y:scroll;height: 400px;">
						<c:forEach items="${imgList}" var="o">
							<c:if test="${o.fullName!=null &&o.fullName!='' }">
							 <div class="thumbnail2" align="center">
							    <a href="javascript:void(0)">
							      <img  src="${o.fullName }" width="50" height="50" />${o.name }
							    </a>
					 		 </div>
					 		 </c:if>
						</c:forEach>
					</div>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" data-dismiss="modal" class="btn btn-primary">确定</button>
            </div>
        </div> 
    </div> 
</div>
<!-- 右边模块预览end-->
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<%@include file="../../common/input-bottom.jsp" %> 
<link rel=stylesheet href="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/lib/codemirror.css">
<link rel=stylesheet href="<%=_mainProjectUrl%>/resources/plugins/jQuery-Raty/demo/css/application.css">
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/lib/codemirror.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/clike/clike.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/javascript/javascript.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/css/css.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/xml/xml.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/htmlmixed/htmlmixed.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/php/php.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/addon/edit/matchbrackets.js"></script>
<script src="<%=basePath%>/resources/js/formatting.js"></script>
<script>

  subPage = {
        treeObj: null,
        documentHtml:null,
        listHtml:null,
        currentEl:null,
        listItem:null,
        sysJs:'',
        usrJs:'',
        codeMirrorJs: null,
        needRefreshCodeJs: true,
        tableColoum:'',
        fileName:'index.html',
        selectNode: {},
        /**
         * 节点被折叠的事件回调函数
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnCollapse: function (event, treeId, treeNode) {
            var node_icon = $("#" + treeNode.tId + "_span > i").attr("class");
            if (node_icon == "fa fa-folder-open") {
                $("#" + treeNode.tId + "_span > i").removeClass("fa-folder-open").addClass("fa-folder");
            }
        },
        /**
         * 节点被展开的事件回调函数
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnExpand: function (event, treeId, treeNode) {
            var node_icon = $("#" + treeNode.tId + "_span > i").attr("class");
            if (node_icon == "fa fa-folder") {
                $("#" + treeNode.tId + "_span > i").removeClass("fa-folder").addClass("fa-folder-open");
            }
        },
        /**
         * 点击节点
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) { 
      			  subPage.tableColoum="";
      			  subPage.usrJs="";
      			  clearRightBox();//清除右边组件
        		   //subPage.saveEdit();
	      		   if(treeNode.value.indexOf(".html")!=-1){
	      		   		if(treeNode.level==1){
	      		   			$(".editE").hide();
	      		   		}else{
	      		   			$(".editE").show();
	      		   		}
	      		      	subPage.fileName=treeNode.value;
			        	subPage.initMobileHtml();
	      		   }
	      		   $("#pageName").val(subPage.fileName.substring(subPage.fileName.lastIndexOf("\\")+1));
        },
        /**
        * 移除选中的元素
        **/
        removeElement:function(){
        	subPage.currentEl.remove();
        },
        /**
        * 拷贝选中元素
        */
        copyElement:function(){
          subPage.currentEl.parent().append(subPage.currentEl.prop("outerHTML"));
        },
        /**
        * 上移选中元素
        */
        upElement:function(){
       		 var currentSortEl=null;
        	if(subPage.currentEl.hasClass("_sort")){
        		 currentSortEl=subPage.currentEl;
        	}else{
        		 currentSortEl=subPage.currentEl.parents("._sort");
        	}
        	var upele=currentSortEl.prev();
        	currentSortEl.prev().remove();
        	currentSortEl.after(upele);
        },
        /**
        * 下移选中元素
        */
        downElement:function(){
         var currentSortEl=null;
        	if(subPage.currentEl.hasClass("_sort")){
        		 currentSortEl=subPage.currentEl;
        	}else{
        		 currentSortEl=subPage.currentEl.parents("._sort");
        	}
      	   var nextele=currentSortEl.next();
        	currentSortEl.next().remove();
        	currentSortEl.before(nextele);
        },
        //启用编辑按钮事件
        enableEdit:function(){
        	if ($("#htmlDoc").val()=='1') {
				$("#htmlDoc").val($(window.frames['contain'].document.body).html());
			}
        	var element=new Array("._list","._text","._img","._item","_a","._input","._select","._ck");
        	  for(var el in element){
          			  $(element[el],$('#contain').contents()).each(function(){
	        				if($(this).parents().hasClass("_list")){
	        					return;
	        				}
	        				$(this).addClass("_edit");
	        				if($(this).hasClass("_item")){
	        					subPage.initEditBox($(this),1);
	        				}else{
			        		    subPage.initEditBox($(this),2);
	        				}
        			})
      			} 
      		var content= $('#contain').contents();
      		subPage.documentHtml=content;
      		$("._item",content).each(function(){
        			$(this).click(function(){
        			subPage.currentEl=$(this);
        			$("#_baseInfo").hide();
        		})
        	})
        	$("._edit",content).each(function(){
        		$(this).click(function(){
        			subPage.currentEl=$(this);
        		 	$("#eleName").html("<option value=''>请选择</option>"+subPage.tableColoum);
        			$("#eleName").val('').trigger("change"); 
        			$("#listContent").html("");
        			clearRightBox();//清除右边组件
        			//$("#listContent").html('');
        			if(subPage.currentEl.hasClass("_list")){
        				$("#eleCount").parents(".col-xxxl-4").show();
        				$("#eleData").parents(".col-xxxl-4").show();
        				$("._listBox").show();
        				$("#elementName").html("循环列表");
        				 subPage.listHtml=$(subPage.currentEl.find(":first-child").prop("outerHTML"));//获取列表第一个元素
        				 var i=0;
        				 $(subPage.listHtml).find("._img").each(function(){
        				 	var _imgHtml='<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding " style="margin-top: 10px;">'+
					   						 '<div class="form-group">'+
										        '<label title="" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >'+$(this).attr("data-text")+'：</label>'+
										        '<div class="col-sm-10">'+
										           ' <input type="text" class="form-control" onfocus="selectPic()" placeholder="" id="listPic'+(i+1)+'"  name="listPic"><span class="symbol"></span>'+
										      '  </div>'+
					   						 '</div>'+
										 '</div>';
							 $(this).addClass("listPic"+(i+1));			 
							$("#listContent").append(_imgHtml);		
							i++;	 
        				 });
        				 i=0;
        				 $(subPage.listHtml).find("._text").each(function(){
        				 	var _txtHtml='<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding " style="margin-top: 10px;">'+
					   						 '<div class="form-group">'+
										        '<label title="" class="col-sm-2 control-label ell nopadding" style="margin-top: 10px;"  >'+$(this).attr("data-text")+'：</label>'+
										        '<div class="col-sm-10">'+
										           ' <select data-name="'+$(this).attr("data-name")+'" class="form-control"  id="listText'+(i+1)+'"  name="listText"></select>'+
										      '  </div>'+
					   						 '</div>'+
										 '</div>';
							 $(this).addClass("listText"+(i+1));
							$("#listContent").append(_txtHtml);		 
							i++;
        				 });
        				 i=0;
        				 $(subPage.listHtml).find("._a").each(function(){
        				 	var _txtHtml='<div class="col-xxxl-2 col-md-12 col-sm-12 nopadding " style="margin-top: 10px;">'+
					   						 '<div class="form-group">'+
										        '<label title="'+$(this).attr("data-text")+'" class="col-sm-1 control-label ell nopadding" style="margin-top: 10px;"  >'+$(this).attr("data-text")+'：</label>'+
										        '<div class="col-sm-5">'+
										           ' <input  type="text"   data-name="'+$(this).attr("data-name")+'" value="'+$(this).attr("data-url")+'"   class="form-control" id="listA'+(i+1)+'"   name="listHref">'+
										      '  </div>'+
										       '<label title="条件字段" class="col-sm-1 control-label ell nopadding"style="margin-top: 10px;margin-left: 10px"  >条件字段：</label>'+
										        '<div class="col-sm-5">'+
										           '  <select data-name="'+$(this).attr("data-name")+'"  class="form-control" id="listA'+(i+1)+'"   name="listHrefCon"></select>'+
										      '  </div>'+
					   						 '</div>'+
										 '</div>';
							 
							 $(this).addClass("listA"+(i+1));	
							$("#listContent").append(_txtHtml);		
							i++;
        				 });
        				$("[name='listText']").each(function(){
			        			$(this).html(subPage.tableColoum);
			        			 if($(this).attr("data-name")!="undefined")
				        		{
				        			$(this).val($(this).attr("data-name")).trigger("change");
				        		} 
			        	})
			        	$("[name='listHrefCon']").each(function(){
			        			$(this).html(subPage.tableColoum);
			        			 if($(this).attr("data-name")!="undefined")
				        		{
				        			$(this).val($(this).attr("data-name")).trigger("change");
				        		} 
			        		})	 	 
        			}else if(subPage.currentEl.hasClass("_img")){//如果点击的是图片
        				$("#_baseInfo").show();
        				$("#elementName").html("图片");
        				$("#eleSrc").parents(".col-xxxl-4").show();
        				$("#eleSrc").val(subPage.currentEl.attr("src"));
        				stopevt();
        			}else if(subPage.currentEl.hasClass("_text")){//如果点击的是文本
        				$("#_baseInfo").show();
        				$("#elementName").html("文本");
        				$("#eleText").parents(".col-xxxl-4").show();
        				$("#eleText").val(subPage.currentEl.html());
        				stopevt();
        			}else if(subPage.currentEl.hasClass("_a")){
        				$("#_baseInfo").show();
        				$("#eleHref").html("链接");
        				$("#eleHref").parents(".col-xxxl-4").show();
        				$("#eleHref").val(subPage.currentEl.attr('href'));
        				subPage.currentEl.attr('href',"javascript:void(0)");
        				stopevt();
        			}else if(subPage.currentEl.hasClass("_input")){
        				$("#_baseInfo").show();
        				$("#eleText").parents(".col-xxxl-4").show();
        				$("#eleText").val(subPage.currentEl.find("label").html());
        				$("#eleName").val(subPage.currentEl.find("input").attr("name"));
        				console.log(subPage.currentEl.find("input").attr("name"));
			        	if(subPage.currentEl.find("input").attr("name")!="undefined")
				        {
				        	$("#eleName").val(subPage.currentEl.find("input").attr("name")).trigger("change");
				        } 
        			}else if(subPage.currentEl.hasClass("_ck")){
        				$("#_baseInfo").show();
        				$("#eleCk").parents(".col-xxxl-4").show();
        				$("#eleCk").val($(this).attr("onClicks"));
        				stopevt();
        			}
        			//判断ID
        			if (subPage.currentEl.attr("id")==null || subPage.currentEl.attr("id")=="") {
        				var radomId=getNewElementId();
						subPage.currentEl.attr("id",radomId);
						$("#eleId").val(radomId);
					}else{
						$("#eleId").val(subPage.currentEl.attr("id"));
					}
					if(subPage.currentEl.attr("data-url")!=null || subPage.currentEl.attr("data-url")!=""){
						$("#eleData").val(subPage.currentEl.attr("data-url"));
					}
        		})
        	})
        },
         /**
         * 保存编辑
         */
        saveEdit:function(){
        		//subPage.usrJs=subPage.codeMirrorJs.getValue();
        		if($("#pageEntity").val()!=null&&$("#pageEntity").val()!=""){
        			$(window.frames['contain'].document.body).children(":first").attr("att_table",$("#pageEntity").val());
        		}
        		if (subPage.currentEl==null) {
        			parent.toastr.warning("请先编辑文件再保存！");
					return;
				}
				subPage.sysJs="";   
		 		//如果是循环列表
		 		var id=$("#eleId").val();
		 	 	var dataUrl=$("#eleData").val();
		 		subPage.currentEl.attr("id",id);//保存用户设置的id;
		 		if ($("#eleData").val()!=null&&$("#eleData").val()!="") {
			 		subPage.currentEl.attr("data-url",dataUrl);//保存用户设置的id;
				} 
		 		if(subPage.currentEl.hasClass("_list")){//如果修改的是列表类
					 		$("[name='listText']").each(function(){
					 					 subPage.listHtml.find("."+$(this).attr("id")).html("'+$"+$(this).val()+"+'");
					 					 subPage.listHtml.find("."+$(this).attr("id")).attr("data-name",$(this).val());
							 })
						 	 $("[name='listHrefCon']").each(function(){
						 			 var url=$(this).parent().parent().find("input:first").val();
						 			 subPage.listHtml.find("."+$(this).attr("id")).attr("data-url",url);
						 			 subPage.listHtml.find("."+$(this).attr("id")).attr("href",url+"&"+$(this).val()+"='+$"+$(this).val()+"+'");
						 			 
						 	 })
						 			subPage.currentEl.html(subPage.listHtml.prop("outerHTML"));
						 			var itemHtml=subPage.listHtml.prop("outerHTML");
						 			itemHtml="'"+itemHtml.replaceAll('$','data[i].')+"'";
						 			itemHtml=itemHtml.replace(/[\r\n]/g, '');
						 			var isCount='';
						 			if($("#eleCount").val()!=null&&$("#eleCount").val()!=""){
						 				isCount='if(i=='+parseInt($("#eleCount").val())+') break;'
						 			}
						 			var listScript='$(function(){\n'+
							 				'$.ajax({\n'+
								           ' url:"'+dataUrl+'",\n'+
								           ' dataType: "json",\n'+
								            'type:"post",'+
								           ' error: function (XMLHttpRequest, textStatus, errorThrown) {\n'+
								          '    console.log(errorThrown);\n'+
								           ' },\n'+
								         '   success: function (data) {\n'+
								         'var listhtml_=\'\';\n'+
								         '      	for ( var i = 0; i < data.length; i++) {\n'+isCount+
													'listhtml_+='+itemHtml+
										'		   \n }\n'+
										'$("#'+id+'").html(listhtml_)\n'+
								         '   }\n'+
						 		'	})\n})\n';
						 			subPage.sysJs=listScript;
		 		}else if(subPage.currentEl.hasClass("_text")){ //如果修改的是文本信息
		 			subPage.currentEl.html($("#eleText").val());
		 		}else if(subPage.currentEl.hasClass("_img")){  //如果修改的是图片
		 			subPage.currentEl.attr("src",$("#eleSrc").val());
		 		}else if(subPage.currentEl.hasClass("_a")){
		 			subPage.currentEl.attr("_href",$("#eleHref").val());
		 		}else if(subPage.currentEl.hasClass("_input")){
		 			subPage.currentEl.find("label").html($("#eleText").val());
        			subPage.currentEl.find("input").attr("name",$("#eleName").val());
		 		}else if(subPage.currentEl.hasClass("_ck")){
		 			subPage.currentEl.attr("onClick",$("#eleCk").val());
		 		}
		 		//判断是不是异步取值设置隐藏文本方便修改
		 		if(subPage.sysJs!=""){
		 			 if(subPage.currentEl.prev().attr("name")=="hideJs"){
						 subPage.currentEl.prev().html(subPage.sysJs);
		 			 }else{
		 		    	 subPage.currentEl.before('<textarea style="display:none" id="'+id+'js" name="hideJs">'+subPage.sysJs+'</textarea>');
		 			 }
		 		}
		 		//将修改后的数据存入内存，但不保存到文件
		 		$("#htmlDoc").val($(window.frames['contain'].document.body).html());//暂存修改数据
		 		parent.toastr.warning("暂存成功！");
        },
        disableEdit:function(){
        	$("._item",$('#contain').contents()).each(function(){
        		$(this).css("background-color","");
        		$(this).unbind();
        	});
        	$("._edit",$('#contain').contents()).each(function(){
        		$(this).css({ "border":"none","cursor":"","opacity":"","color":"","font-weight":"","background-color":""});
        		$(this).unbind();
        	});
        	$("a[_href]",$('#contain').contents()).each(function(){
        	 	$(this).attr("href",$(this).attr("_href"));
        	});
        	$("#htmlDoc").val($(window.frames['contain'].document.body).html());//暂存修改数据
        },
        /**
         * 启用编辑box
         */
        initEditBox:function($el,type){
        	if(type==1){
        	 //  $el.css("background-color","#D9D9D9");
        	 $("a",$('#contain').contents()).each(function(){
        	 	$(this).attr("href","javascript:void(0)");
        	});
        	}else{
        	   $el.css({ "border":"2px dashed #ff0033","cursor":"pointer","opacity":"0.5","color":"#ff0033","font-weight":"bold","background-color":"#eee"});
        	}
        },
		saveEditFile:function(){
				subPage.disableEdit();
				$(window.frames['contain'].document.body).find("#sysJs").remove();
				$(window.frames['contain'].document.body).append("<div id='sysJs'></div>")
				$(window.frames['contain'].document.body).find("#usrJs").remove();
				$(window.frames['contain'].document.body).append("<div id='usrJs'></div>")
				$(window.frames['contain'].document.body).find("#usrJsCode").remove();
				$(window.frames['contain'].document.body).append('<textarea style="display:none" id="usrJsCode" >'+subPage.usrJs+'</textarea>')
				if($("#pageEntity").val()!=null&&$("#pageEntity").val()!=""){
        			$(window.frames['contain'].document.body).children(":first").attr("att_table",$("#pageEntity").val());
        		}
        		if($("#eleNode").val()!=null&&$("#eleNode").val()!=""){
        			$(window.frames['contain'].document.body).children(":first").attr("att_node",$("#eleNode").val());
        		}
				$("#htmlDoc").val($(window.frames['contain'].document.body).html());//暂存修改数据
			 	  $.ajax({
			            url: tool.initParams('<%=basePath%>/s/system/wxfile/saveEdit'),
			            data: {
			                'documentHtml':$("#htmlDoc").val(),//修改后的网页内容
			                'themeName':'${themeName}',//系统路径
			                'url':url,//模板url。
			                'fileName':subPage.fileName,//文件名称
			                'userFileName':$("#pageName").val(),//用户生成的文件名称
			                'usrJs':subPage.usrJs//用户自定义js代码
			            },
			            type:"post",
			            dataType: "json",
			            error: function (XMLHttpRequest, textStatus, errorThrown) {
			               parent.toastr.warning(errorThrown);
			            },
			            success: function (data) {
			               	if(data){
			               		parent.toastr.warning("生成网页成功！");
			               		//window.location.reload(); 
			               	}
			            }
      		  });  
		},
		initMobileHtml:function(){
				var user='${user}';
				var url2="";
				if(user=='0'){
				     url2="<%=basePath%>/themes/sysThemes/${themeName}/"+subPage.fileName;
				     if(subPage.fileName.indexOf("\\")!=-1){
						   url="<%=basePath%>/themes/sysThemes/${themeName}/"+encodeURIComponent(subPage.fileName.substring(0,subPage.fileName.indexOf("\\"))+".html");
						   $("#pageName").parents(".col-xxxl-4").hide();
						   $("#eleNode").parents(".col-xxxl-4").hide();
						   $("#pageName").parents(".col-xxxl-4").next().hide();
				     }else{
				     	  url="<%=basePath%>/themes/sysThemes/${themeName}/"+encodeURIComponent(subPage.fileName);
				     	  $("#pageName").parents(".col-xxxl-4").show();
				     	    $("#eleNode").parents(".col-xxxl-4").show();
				     	  $("#pageName").parents(".col-xxxl-4").next().show();
				     }
				}else{
					url2="<%=basePath%>/themes/usrThemes/${themeName}/"+subPage.fileName;
				}
      		    document.getElementById("contain").src=url2+"?r="+Math.random();
      		    //判断iframe是否加载完成
      		    var oFrm = document.getElementById('contain');
      		   oFrm.onload = oFrm.onreadystatechange = function () {
					 if(this.readyState && this.readyState != 'complete') {
					      console.log("加载中。。。");
					    }else {
							var tableName=$(window.frames['contain'].document.body).children(":first").attr("att_table");
							if(tableName==null||tableName==""){
								return;
							}
							var node=$(window.frames['contain'].document.body).children(":first").attr("att_node");
							if(node==null||node==""){
								return;
							}
							getTableColoumn(tableName,node);
							subPage.usrJs=$(window.frames['contain'].document.body).find("#usrJsCode").val();
				    }
				} 
		}
    }
 function getTableColoumn(tableName,node){
 		  $.ajax({
			       url: tool.initParams('<%=basePath%>/s/system/wxfile/getTablecoloumn'),
			      data: {
			              'tableName':tableName,
			              'node':node
			            },
			      type:"post",
			  dataType: "json",
 			   success: function (data) {
			    var optHtml="";
			    for(var i=0;i<data.length;i++){
			    	optHtml+='<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			    }
			    subPage.tableColoum=optHtml;
			 }
      	});  
 }   
    
 /**
 * 获取随机数
 * @returns {*}
 */
function getNewElementId() {
    var temp = tool.randomString(7);
    return temp;  //+ (Math.floor(Math.random() * 10000))
}
var url;    
    
 //扩展jsReplace方法   
String.prototype.replaceAll = function (str1,str2) {
		var text=this;
		while(text.indexOf(str1)!=-1){
			text=text.replace(str1, str2);
		}
		return text;
}    
    
    function clearRightBox(){
    	$("#eleCount").parents(".col-xxxl-4").hide();
    	$("#eleData").parents(".col-xxxl-4").hide();
    	$("._listBox").hide();
    	$("#eleText").parents(".col-xxxl-4").hide();
    	$("#eleSrc").parents(".col-xxxl-4").hide();
    	$("#eleHref").parents(".col-xxxl-4").hide();
    	$("#eleCk").parents(".col-xxxl-4").hide();
    }

    
    $(document).ready(function () {
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
                onCollapse: subPage.zTreeOnCollapse,
                onExpand: subPage.zTreeOnExpand,
                onClick: subPage.zTreeOnClick
            }
        };
        $.ajax({
            url: tool.initParams('<%=basePath%>/s/system/wxfile/ztreeList'),
            data: {
                'themeName': '${themeName}',
                'user':'${user}'
            },
            type:"post",
            dataType: "json",
            error: function (XMLHttpRequest, textStatus, errorThrown) {
               
            },
            success: function (data) {
                subPage.treeObj = $.fn.zTree.init($("#site-List"), setting, data);
            }
        });
         subPage.initMobileHtml();
         setPicCss();
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
             	if (e.target.hash == "#code-mirror-js") {//激活代码tab
             	if (subPage.needRefreshCodeJs) {
                    subPage.needRefreshCodeJs = false;
		           subPage.codeMirrorJs = CodeMirror.fromTextArea($('#code-mirror-js textarea')[0], {
		              lineNumbers: true,
		              matchBrackets: true,
		              indentUnit: 4,
		              indentWithTabs: true,
		              mode: 'javascript'
		          });   
		         }
		          subPage.codeMirrorJs.setValue(subPage.usrJs); 
       		  }
       		  	subPage.usrJs=subPage.codeMirrorJs.getValue();
            })
    });
 //设置图片选中事件
function setPicCss(){
	$(".thumbnail2 a").click(function(){
		$(".thumbnail2 a").each(function(){
			$(this).css("border","1px solid #ddd");
		})
		$(this).css("border","1px solid #3399CC");
		var imgsrc=$(this).find("img").attr("src");
		var themeName='${themeName}';

		imgsrc=imgsrc.substring(imgsrc.indexOf(themeName)+themeName.length+1);
		$("#eleSrc").val(imgsrc);
	})
} 
function selectPic(functionName){
		$('#picModal').modal('show');
}
 
  /*
   *组织冒泡点击事件
   **/
function getEvent() {
    if (document.all) {
        return window.event; //如果是ie
    }
    func = getEvent.caller;
    while (func != null) {
        var arg0 = func.arguments[0];
        if (arg0) {
            if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                return arg0;
            }
        }
        func = func.caller;
    }
    return null;
}
function stopevt() {
	var ev = getEvent();
    if (ev.stopPropagation) {
        ev.stopPropagation();
    } else if (window.ev) {
        window.ev.cancelBubble = true;
    }
}
</script>
