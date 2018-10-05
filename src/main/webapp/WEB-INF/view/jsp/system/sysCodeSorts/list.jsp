<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top"
           onclick="tool.addData(this)">新增 <i class="fa fa-plus"></i></a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">删除 <i class="fa fa-times"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)">修改 <i
                class="fa fa-edit"></i></a>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered ">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th>
                字典类别编码
            </th>
            <th>
                字典类别名称
            </th>
        </tr>
        </thead>
        <tbody>
        	<c:forEach items="${resultData}" var="o" varStatus="s">
        		 <tr id="tr_${o.zdlb}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                          <input id="${o.zdlb}" type="checkbox" name="selectNode" value="${o.zdlb }" class="mgc foocheck">
                        </label>
                    </div>
                </td>
                <td>
                    <a onclick="tool.editDataById(this,'${o.zdlb}')"
                       href="javascript:void(0)">
                       ${o.zdlb}
                    </a>
                </td>
                <td>
                    ${o.lbmc}
                </td>
            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>
<input type="hidden" name="currentPageno" value="${pager.currentPageno}" id="yspager_currentPageno"/>
<input type="hidden" name="eachPageRows" value="${pager.eachPageRows}" id="eachPageRows"/>
<div class="row">
    <tags:pagination paginationSize="${pager.eachPageRows}" page="${pager}"></tags:pagination>
</div>
<%@include file="../../common/plugins/js/blockUI.jsp"%>
<%@include file="../../common/list-bottom.jsp" %>
