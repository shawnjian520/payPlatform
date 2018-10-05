﻿<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>

<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-order">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="grey selectall">
                    </label>
                </div>
            </th>
            <th>待办任务</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.wid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                          <input type="checkbox" class="grey foocheck"  name="selectNode" value="${obj.wid}">
                        </label>
                    </div>
                </td>
                <td>
                	<c:if test="${obj.node==null || obj.node=='' || obj.node=='null' }">
	                	<a style="cursor: pointer;" onclick="Main.ajaxLoaderUrl('<%=basePath %>${obj.url}',null,'${obj.ywmc }','${obj.ywmc }')">${obj.descr }</a>
                	</c:if>
                	<c:if test="${obj.node!=null && obj.node!='' && obj.node!='null'}">
	                	<a style="cursor: pointer;" onclick="Main.ajaxLoaderUrl('${obj.node}${obj.url}',null,'${obj.ywmc }','${obj.ywmc }')">${obj.descr }</a>
                	</c:if>
                </td>
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
<script>
</script>
<%@include file="../../common/list-bottom.jsp" %>