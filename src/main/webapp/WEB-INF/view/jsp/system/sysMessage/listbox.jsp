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
	    	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element"  >
			    <div class="form-group">
			        <label  class="col-sm-3 control-label ell nopadding" for="xxbt"><font data-localize="frame_tzgl.yftz_tzlx">通知类型</font>：</label>
			        <div class="col-sm-9">
	    			 <select value="${tsysMessage.xxly}"
								 zdlb="xxly"  name="xxly" id="xxly"
								 class="validate[required]  form-control select2-code"
								 style="width: 100%;height: 32px;"></select>
			        </div>
			    </div>
			</div>
		</div>
          <div class="col-xs-2">
             <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
	            <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
	        </a>
	        <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
	         <font data-localize="frame_button.reset"> 重置</font> <i class="fa fa-mail-reply-all"></i>
	        </a>
         </div>
    </div>
</div>
    	
	  <div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered ">
	        <thead>
	        <tr>
	        	<!-- 学生页面 -->
<%--	            <th class="center" width="30px">--%>
<%--	                <label><input type="checkbox"  class="ace"><span class="lbl"></span></label>--%>
<%--	            </th>--%>
    			<th data-localize="frame_tzgl.yftz_bt">通知主题</th>
    			<th data-localize="frame_tzgl.yftz_tzlx">通知类型</th>
    			<th data-localize="frame_tzgl.sjx_fsr">发送人</th>
    			<th data-localize="frame_tzgl.sjx_fsdw">发送单位</th>
    			<th data-localize="frame_tzgl.yftz_fssj">发送时间</th>
    			<th data-localize="frame_tzgl.xtz_sfck">是否查看</th>
				<th data-localize="frame_tzgl.yftz_cksj">查看时间</th>
	        </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${resultData}" var="data">
	                <tr>
<%--	                    <td class="center" width="25">--%>
<%--	                        <label><input type="checkbox" id="${data.wid}" name="selectNode"  class="ace" value="${data.wid}" ><span class="lbl"></span></label>--%>
<%--	                    </td>--%>
	                    <td id="td${data.wid}">
	                    	<a style="cursor: pointer;" onclick="tool.openview(this,'<%=basePath%>s/biz/sysMessage/input/${data.wid}/3')">${data.xxbt}</a>
	                    </td>
	                    <td>${data.xxly_str}</td>
                    	<td>${data.xxfsr_str}</td>
                    	<td>${data.xxfsbm_str}</td>
                    	<td>
                    	<fmt:formatDate value="${data.xxfssj }" pattern="yyyy-MM-dd HH:mm" var="xxfssj"/>
                    		${xxfssj }
                    	</td>
                    	<td>
							<c:if test="${data.xxzt=='0' }"><font data-localize="frame_tzgl.sjx_wck">未查看</font></c:if>
							<c:if test="${data.xxzt=='1' }"><font data-localize="frame_tzgl.sjx_yck">已查看</font></c:if>
						</td>
						<td>${data.xxydsj}</td>
						
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
   </div>
<style>
  tr,th,td{
    text-align:center
  }
</style>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>