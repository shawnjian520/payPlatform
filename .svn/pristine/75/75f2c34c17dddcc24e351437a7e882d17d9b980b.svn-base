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
<div class="row">
    <div class="col-md-12">
          <a class="btn btn-sm btn-success" onclick="excahangefdy(this)">
            	 替换辅导员<i class="fa fa-exchange"></i>
         </a>
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
                <label>
                    <input type="checkbox" class="mgc selectall">
                </label>
            </th>
            <th>班级名称</th>
            <th>辅导员</th>
            <th>班级编码</th>
            <th>专业</th>
            <th>状态</th>
            <th>创建时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.wid}">
                <td class="center">
                    <label>
                      <input type="checkbox" class="mgc foocheck"  name="selectNode" value="${obj.wid}">
                    </label>
                </td>
                <td>${obj.name}</td>
                <td>${obj.depname}</td>
                <td>${obj.code}</td>
                <td>${obj.zymc}</td>
                <td>
               		<c:if test="${obj.state=='1' }">正常</c:if>
               		<c:if test="${obj.state!='1' }">关闭</c:if>
                </td>
                <td>
                	<fmt:formatDate value="${obj.createtime }" pattern="yyyy-MM-dd HH:mm" var="createtime"/>${createtime }
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
<%@include file="../../common/list-bottom.jsp" %>
<script type="text/javascript">
    function excahangefdy(el){
        var slength = 0;
        var a = document.getElementsByName("selectNode");
        for (var i = 0; i < a.length; i++) {
            if (a[i].checked) {
                slength += 1;
            }
        }
        if(slength>=1){
            var id = tool.getChoseData($(el).parents('.form-horizontal'));
            tool.openSubviewByForm(el,'<%=basePath%>s/system/sysbj/edit/'+id,true);
        }else{
            tool.alertWarning("请选择要替换辅导员的班级!");
        }
    }
</script>