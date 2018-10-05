<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();

%>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <h3>新增信息</h3>
        <hr>
        <div class="row">
            <form role="form" class="form-horizontal">
                <input type="hidden" name="wid" id="wid" value="${object.wid}">
                <jd:lable id="ywmc" col="1" lable="业务名称">
                    <input type="text" id="ywmc" name="ywmc" class="validate[required] form-control"
                           value="${object.ywmc}"/>
                </jd:lable>
                <jd:lable id="Lpagename" col="1" lable="文件名称">
                    <input type="text" id="pagename" name="pagename" class="validate[required] form-control"
                       placeholder="只填业务名称，如：gxjyXsxxtj"    value="${object.pagename}"/>
                </jd:lable>
                
                <jd:lable id="node" col="1" lable="基本功能">
                  <label class="checkbox-inline">
					  <input class="mgc"  <c:if test="${fn:contains(object.jbmethod, '1')}"> checked="checked"</c:if><c:if test="${fn:length(object.jbmethod) == 0}">checked="checked"</c:if>type='checkbox'  name='jbmethod' value="1">新增
					</label>
					<c:if test=""></c:if>
					<label class="checkbox-inline">
					  <input  class="mgc" <c:if test="${fn:contains(object.jbmethod, '2')}"> checked="checked"</c:if><c:if test="${fn:length(object.jbmethod) == 0}">checked="checked"</c:if>type="checkbox" name='jbmethod' value="2">保存
					</label>
					
					<label class="checkbox-inline">
					  <input  class="mgc" <c:if test="${fn:contains(object.jbmethod, '3')}"> checked="checked"</c:if><c:if test="${fn:length(object.jbmethod) == 0}">checked="checked"</c:if>type="checkbox" name='jbmethod' value="3"> 修改
					</label>
					<label class="checkbox-inline">
					  <input  class="mgc" <c:if test="${fn:contains(object.jbmethod, '4')}"> checked="checked"</c:if><c:if test="${fn:length(object.jbmethod) == 0}">checked="checked"</c:if> type="checkbox" name='jbmethod' value="4"> 删除
					</label>
					<label class="checkbox-inline">
					  <input  class="mgc" <c:if test="${fn:contains(object.jbmethod, '5')}"> checked="checked"</c:if> <c:if test="${fn:length(object.jbmethod) == 0}">checked="checked"</c:if>type="checkbox" name='jbmethod' value="5"> 查询
					</label>
                </jd:lable>
              <input type="hidden" name="savetype" value="1">
             
                <jd:lable id="node" col="1" lable="节点">
                    <select id="node" name="node" class="form-control select2-auto validate[required]"
                            data-val="${object.node}"
                            data-table-name="T_SYS_PRO_URL" data-field-id="wid" data-field-name="name"></select>
                </jd:lable>
              
                <jd:lable id="path" col="1" lable="实体">
                    <textarea type="text" id="entity" name="entity" class="validate[required] form-control"
                              placeholder="com.apexedu.biz.entity.Test;">${object.entity}</textarea>
                </jd:lable>
                <div class="col-md-offset-2 col-sm-9">
                    <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                        保存 <i class="fa fa-check"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script>

</script>