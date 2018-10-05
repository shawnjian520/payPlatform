<%@page import="com.jd.system.util.LoginUtil"%>
<%@page import="com.jd.system.Const"%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .border-top {
        border-top: 1px solid #ccc;
    }

    .border-bottom {
        border-bottom: 1px solid #ccc;
    }

    .border-left {
        border-left: 1px solid #ccc;
    }

    .border-right {
        border-right: 1px solid #ccc;
    }

    .page-content {
        position: relative;
    }

    tr {
        line-height: 40px;
    }

    label, input, button, select, textarea {
        font-size: 12px;
    }
</style>
<div class="col-md-12 pt5">
    <form role="form" class="form-horizontal">
    	<div class="form-group">
            <div class=" col-sm-12">
		        <a class="btn btn-sm btn-success hide" onclick="page.open1(this)"> 节点设置 <i class="fa fa-edit"></i></a>
		        <a class="btn btn-sm btn-success hide" onclick="page.open2(this)"> 设置开启年度 <i class="fa fa-edit"></i></a>
            	<c:if test="<%=(com.jd.system.Const.depart_szx.equals(com.jd.system.util.LoginUtil.getloginuser(request).getDepart().getDeparttype())) %>">
	                <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
	                    保存 <i class="fa fa-check"></i>
	                </button>
	                <a class="btn btn-sm btn-success hide" onclick="page.deleteData(this)">
			            删除<i class="fa fa-times"></i>
			        </a>
			        <a class="btn btn-sm btn-success hide" onclick="page.doUniChangeState('1',this)"> 发布 <i class="fa fa-check"></i></a>
			        <a class="btn btn-sm btn-success hide" onclick="page.doUniChangeState('0',this)"> 撤销 <i class="fa fa-ban"></i></a>
			        <a class="btn btn-sm btn-success hide" onclick="page.copyData(this,'${tlcName.wid }')"> 复制一个新节点 <i class="fa fa-plus"></i></a>
		        </c:if>
            </div>
        </div>
        <input type="hidden" id="wid" name="wid" value="${tlcName.wid }"/>
        <input type="hidden" id="copywid" name="copywid" value="${copywid }"/>
		<c:if test="${tlcName.wid!=null && tlcName.wid!='' }">
			<div class="form-group">
	            <label class="col-sm-2 control-label" for="name">
	               状态：
	            </label>
	
	            <div class="col-sm-10">
	              	<div style="color: red;padding-top: 5px;font-size:14px;"><c:if test="${tlcName.fbzt=='1' }">已发布</c:if>
                   	<c:if test="${tlcName.fbzt!='1' }">未发布</c:if></div>
	            </div>
	        </div>
		</c:if>
 		<div class="form-group">
            <label class="col-sm-2 control-label" for="name">
               流程名称：
            </label>
            <div class="col-sm-4">
              <input type="text" name="name" id="name" class="validate[required] form-control"
                       value="${tlcName.name}"/>
                <span class="symbol required"></span>
            </div>
            <label class="col-sm-2 control-label" for="name">
                流程编码：
            </label>
            <div class="col-sm-4">
                <input type="text" name="code" id="code" class="validate[required] form-control"
                       value="${tlcName.code}"/>
                <span class="symbol required"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="name">
                操作业务表：
            </label>
            <div class="col-sm-4">
            	<select name="table_name" id="table_name" class="validate[required] select2-auto" onchange="subPage.loadfield();">
            		<c:forEach items="${DBTables }" var="obj">
            			<option value="${obj }" <c:if test="${obj==tlcName.table_name }">selected="selected"</c:if>>${obj }</option>
            		</c:forEach>
            	</select>
                <span class="symbol required"></span>
            </div>
            <label class="col-sm-2 control-label" for="name">
                审核字段：
            </label>
            <div class="col-sm-4">
            	<select name="para_name" id="para_name"  class="validate[required] select2-auto">
            	
            	</select>
                <span class="symbol required"></span>
            </div>
        </div>
        <div class="form-group">
        	<label class="col-sm-2 control-label" for="name">
                审核状态字典：
            </label>
            <div class="col-sm-4">
                <input type="text" name="zdlb" id="zdlb" class="validate[required] form-control"
                       value="${tlcName.zdlb }"/>
                <span class="symbol required"></span>
            </div>
            <label class="col-sm-2 control-label" for="name">
                年度字段：
            </label>
            <div class="col-sm-4">
            	<select name="para_nd" id="para_nd"  class="select2-auto">
            	
            	</select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="name">
                是否支持跨级审核：
            </label>
            <div class="col-sm-4">
                <select type="text" name="iskjsh" id="iskjsh" class="validate[required] select2-auto" >
                	<option value=""></option>
                    <option value="1" <c:if test="${tlcName.iskjsh=='1' }">selected="selected"</c:if>>支持</option>
                    <option value="0" <c:if test="${tlcName.iskjsh=='0' }">selected="selected"</c:if>>不支持</option>
                </select>
                <span class="symbol required"></span>
            </div>
            <label class="col-sm-2 control-label" for="name">
                子节点：
            </label>
            <div class="col-sm-4">
                <select name="node" class="form-control select2-auto">
                    <c:forEach items="${nodes }" var="obj" varStatus="staa">
                        <option value="${obj.id }"
                                <c:if test="${obj.id==tlcName.node }">selected="selected"</c:if>>${obj.caption }</option>
                    </c:forEach>
                </select>
                <span class="symbol required"></span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="name">
                执行存储过程：
            </label>

            <div class="col-sm-4">
                <input type="text" name="proced" placeholder="procedures('$departid','$updepartid')" id="proced" class="form-control"
                       value="${tlcName.proced }"/>
            </div>
            <label class="col-sm-2 control-label" for="name">
                流程类型：
            </label>
            <div class="col-sm-4">
                <select type="text" name="type" id="type" class="validate[required] select2-auto" >
                	<option value=""></option>
                    <option value="1" <c:if test="${tlcName.type!='0' }">selected="selected"</c:if>>上报流程</option>
                    <option value="0" <c:if test="${tlcName.type=='0' }">selected="selected"</c:if>>下发流程</option>
                </select>
                <span class="symbol required"></span>
            </div>
            <div class="col-sm-10 col-md-offset-2 nopadding" style="color:red">参数$departid，$updepartid，$userid，$wid表示选中数据wid</div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label" for="name">
                所属部门：
            </label>
            <div class="col-sm-4">
                <select id="depid" name="depid" class="form-control select2-auto" onchange="subPage.loaduser()">
                	<option value=""></option>
                    <c:forEach items="${deps }" var="obj" varStatus="staa">
                        <option value="${obj.id }"
                                <c:if test="${obj.id==tlcName.depid }">selected="selected"</c:if>>${obj.caption }</option>
                    </c:forEach>
                </select>
            </div>
            <label class="col-sm-2 control-label" for="name">
               指定负责人：
            </label>
            <div class="col-sm-4">
                <select id="depuser" name="depuser" class="form-control select2-auto">
                	
                </select>
            </div>
        </div>
        
    </form>
</div>

<script type="text/javascript">
subPage={
		save_callback:function(data, form_element, el){
			$('a').removeClass('hide');
			page.loaddata();
			if($('#copywid').val()!=null && $('#copywid').val()!=''){
				page.loadi($('#wid').val());
			}
		},
		loaduser:function(){
			var depuser = '${tlcName.depuser}';
			var depid = $('#depid').val();
			$.post(tool.initParams(basePath + "/s/biz/process/getuser"),{'depid':depid},function(data){
				data = eval('('+data+')');
				var s = '';
				$(data).each(function(i){
					if(depuser==data[i].id) s += '<option value="'+data[i].id+'" selected="selected">'+data[i].caption+'</option>';
					else s += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
				});
				$('#depuser').html(s).trigger("change");
				
			});
		},
		para_name:'${tlcName.para_name}',
		para_nd:'${tlcName.para_nd}',
		loadfield:function(){
			var table_name = $('#table_name').val();
			$.post(tool.initParams(basePath + "/s/biz/process/getfield"),{'tablename':table_name},function(data){
				data = eval('('+data+')');
				var s = '';
				var s_nd = '<option value=""></option>';
				$(data).each(function(i){
					if(subPage.para_name==data[i]) s += '<option value="'+data[i]+'" selected="selected">'+data[i]+'</option>';
					else s += '<option value="'+data[i]+'">'+data[i]+'</option>';
					if(subPage.para_nd==data[i]) s_nd += '<option value="'+data[i]+'" selected="selected">'+data[i]+'</option>';
					else s_nd += '<option value="'+data[i]+'">'+data[i]+'</option>';
				});
				$('#para_name').html(s).trigger("change");
				$('#para_nd').html(s_nd).trigger("change");
				
			});
		}
}
$(function () {
    if($('#wid').val()!=null && $('#wid').val()!=''){
    	$('a').removeClass('hide');
    }
    subPage.loaduser();
    subPage.loadfield();
    

});
</script>
