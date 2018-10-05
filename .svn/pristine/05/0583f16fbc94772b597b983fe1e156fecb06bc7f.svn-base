﻿<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>

<div class="row">
    <div class="col-sm-12 col-xl-10 nopadding">
    	<div id="" class="layout col-xs-9">
	    	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element"  >
			    <div class="form-group">
			        <label  class="col-sm-3 control-label ell nopadding" for="xxbt"><font data-localize="frame_tzgl.xtz_bt">主题</font>：</label>
			        <div class="col-sm-9">
	    			 <input type="text" id="xxbt" name="xxbt" class="form-control   "  value="${tsysMessage.xxbt }"/>
			        </div>
			    </div>
			</div>
	    	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element"  >
			    <div class="form-group">
			        <label  class="col-sm-3 control-label ell nopadding" for="xxbt"><font data-localize="frame_tzgl.xtz_sfck">是否查看</font>：</label>
			        <div class="col-sm-9">
	    			 <select value="${tsysMessage.xxzt}"
								 zdlb="SFCK"  name="xxzt" id="xxzt"
								 class="validate[required]  form-control select2-code"
								 style="width: 100%;height: 32px;"></select>
			        </div>
			    </div>
			</div>
          <div class="col-xs-4">
             <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
	          <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
	        </a>
	        <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
	            <font data-localize="frame_button.reset"> 重置</font> <i class="fa fa-mail-reply-all"></i>
	        </a>
         </div>
		</div>
    </div>
</div>
    	
	  <div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-align-center">
	        <thead>
	        <tr>
    			<th data-localize="frame_gwgl.csgw_tzzt">公文主题</th>
    			<th data-localize="frame_gwgl.csgw_zxr">公文撰写人</th>
    			<th data-localize="frame_tzgl.sjx_fsr">发送人</th>
    			<th data-localize="frame_tzgl.yftz_fssj">发送时间</th>
    			<th data-localize=frame_tzgl.yftz_cksj>查看时间</th>
    			<th data-localize="frame_gwgl.csgw_zfxx">查看转发信息</th>
	        </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${resultData}" var="data">
	                <tr id="tr_${data.wid}">
	                    <td id="td${data.wid}">
	                    	<a style="cursor: pointer;" onclick="tool.openview(this,'<%=basePath%>s/system/sysDoc/input/${data.wid}/3')">${data.xxbt}</a>
	                    </td>
						<td>
						${data.zfcon }
						</td>
                    	<td>${data.xxfsr_s}</td>
                    	<td>
                    		${data.xxfssj_s }
                    	</td>
                    	<td>
							<c:if test="${data.xxzt=='0' }"><font data-localize="frame_tzgl.sjx_wck">未查看</font></c:if>
							<c:if test="${data.xxzt=='1' }">${data.xxjssj_s}</c:if>
						</td>
						<td><a style="cursor: pointer;" onclick="page.ckjsr('${data.wid}')" data-localize="frame_gwgl.yfgw_jsr">查看接收人</a></td>
	                </tr>
	                <tr id="tr${data.wid}" style="display: none;">
	                    <td class="center" colspan="6">
	                         <table id="contentTable" class="table table-striped table-bordered table-hover">
						        <thead>
						        <tr>
					    			<th data-localize="frame_gwgl.yfgw_jsr">接受人</th>
					    			<th data-localize="frame_tzgl.xtz_sfck">是否查看</th>
					    			<th data-localize="frame_tzgl.yftz_cksj">查看时间</th>
						        </tr>
						        </thead>
						        <tbody id="tbody${data.wid}">
						        
						        </tbody>
					        </table>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
   </div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>
<script>
var deltitle='';
	var yck='';
	var wck='';
	function getCookie(name)//取cookies函数     
{  
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
	if(arr != null) return unescape(arr[2]); return null;  
}  
 var cookielang=getCookie("jdLanguage");
	if(cookielang == "en"){
			yck='Already view';
			wck='Not viewed';
		}else{
			yck='已查看';
			wck='未查看';
		}
page={
	ckjsr:function(wid){
		$.post(tool.initParams(basePath+'/s/system/sysDoc/getjsr'),{'wid':wid},function(data){
			var html = '';
			$(data).each(function(i){
				html += '<tr>'+
						'<td>'+data[i].jsr+'</td>'+
						'<td>';
				if(data[i].xxzt=='1') html +=yck;
				if(data[i].xxzt=='0') html +=wck;
				html +='</td>'+
						'<td>'+data[i].xxjssj_s+'</td>'+
					'</tr>';
			});
			
			$('#tbody'+wid).html(html);
			if($('#tr'+wid).css('display')=='none'){
				$('#tr'+wid).css('display','');
			}else{
				$('#tr'+wid).css('display','none');
			}
		});
		
	}
		
}

</script>