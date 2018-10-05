<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%@include file="../../common/list-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div class="row">
 <div class="col-sm-12 col-xl-10 nopadding">
    	<div id="" class="layout col-xs-9">
	    	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element"  >
			    <div class="form-group">
			        <label title="业务名称" class="col-sm-3 control-label ell nopadding">业务名称：</label>
			        <div class="col-sm-9">
	    			 <input type="text" id="ywmc" name="ywmc" class="form-control   " placeholder="业务名称" value="${object.ywmc }"/>
			        </div>
			    </div>
			</div>
	    	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element"  >
			    <div class="form-group">
			        <label title="页面名称" class="col-sm-3 control-label ell nopadding">页面名称：</label>
			        <div class="col-sm-9">
	    			 <input type="text" id="pagename" name="pagename" class="form-control   " placeholder="页面名称" value="${object.pagename }"/>
			        </div>
			    </div>
			</div>
	    	<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element"  >
			    <div class="form-group">
			        <label title="页面类型" class="col-sm-3 control-label ell nopadding">页面类型：</label>
			        <div class="col-sm-9">
	    			 <select id="pagetype" name="pagetype" class="select2-auto">
	    			 	<option value=""></option>
	    			 	<option value="list" <c:if test="${object.pagetype=='list'  }">selected="selected"</c:if>>列表页面</option>
	    			 	<option value="input" <c:if test="${object.pagetype=='input'  }">selected="selected"</c:if>>表单页面</option>
	    			 	<option value="tab" <c:if test="${object.pagetype=='tab'  }">selected="selected"</c:if>>tab页面</option>
	    			 </select>
			        </div>
			    </div>
			</div>
		</div>
          <div class="col-xs-2">
             <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
	            查询 <i class="fa fa-search"></i>
	        </a>
	        <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
	            重置 <i class="fa fa-mail-reply-all"></i>
	        </a>
         </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)">新增 <i class="fa fa-plus"></i></a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">删除 <i class="fa fa-times"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)">修改 <i class="fa fa-edit"></i></a>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-order">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th data-order-name="ywmc">业务名称</th>
            <th data-order-name="pagename">页面名称</th>
            <th data-order-name="pagetype">页面类型</th>
            <th data-order-name="nodename">节点名称</th>
            <th data-order-name="path">页面路径</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="object">
            <tr id="tr_${object.wid}">
                <td class="center w20">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" name="selectNode" class="mgc foocheck" id="${object.wid}"
                                   value="${object.wid}">
                        </label>
                    </div>
                </td>
                <td>
                    <a onclick="tool.editDataById(this,'${object.wid}')" href="javascript:void(0)">${object.ywmc}</a>
                </td>
                <td>
                    ${object.pagename}
                </td>
                <td>
                	<c:if test="${object.pagetype=='list'}">列表页面</c:if>
                	<c:if test="${object.pagetype=='input'}">表单页面</c:if>
                	<c:if test="${object.pagetype=='tab'}">tab页面</c:if>
                </td>
                <td>${object.nodename}</td>
                <td>${object.path}</td>
                <td>
                    <a class="btn btn-xs btn-primary tooltips" data-tab-name="${object.ywmc}>${object.pagename}" data-placement="top" data-original-title="编辑页面" onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/biz/sysJsp/configTemple/${object.wid}')" href="javascript:void(0)"><i class="fa fa-edit"></i></a>
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
    $(document).ready(function () {

//        $("#pagetype").select2({
//            theme: "bootstrap",
//            width: '100%'
//        }).prop('disabled',true);

//        $("#pagetype").next().addClass('select2-container--disabled');

//        $("#pagetype").prop("disabled", false);
//        $("#pagetype-multi").prop("disabled", false);
//        $('#pagetype').select2("readonly", true);

    });
    function isSubmitForm(){
        return true;
    }
</script>