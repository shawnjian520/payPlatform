<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<div class="col-md-10 col-md-offset-1">
    <h3>
班级信息  
  </h3>
    <hr>
    <form role="form" class="form-horizontal">
        <input type="hidden" id="wid" name="wid" value="${object.wid }" />

        <div class="form-group">
            <label class="col-sm-2 control-label" for="name">
                班级名称：
            </label>

            <div class="col-sm-10">
				<input type="text"  name="name" id="name" class="validate[required] form-control" value="${object.name}"/>
				<span class="symbol required"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="zybm">
                专业：
            </label>

            <div class="col-sm-10">
            	<c:forEach items="${zys }" var="obj">
            	 <label class="radio-inline">
            		<input type="radio" name="zybm"  class="validate[required] grey"  value="${obj.id }"  <c:if test="${obj.id==object.zybm }"> checked="checked"</c:if>  />${obj.caption }
            	</label>
            	</c:forEach>
				<span class="symbol required"></span>
            </div>
        </div>
        <c:if test="${object==null || object.wid==null || object=='' || object.state=='1' }">
	        <div class="form-group">
	            <div class="col-md-offset-2 col-sm-9">
	                <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
	                    保存 <i class="fa fa-check"></i>
	                </button>
	            </div>
	        </div>
        </c:if>
    </form>
</div>
<%@include file="../../common/input-bottom.jsp" %>