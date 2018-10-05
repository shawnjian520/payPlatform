<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<input type="hidden" name="currentPageno" id="yspager_currentPageno" value="${pager.currentPageno}">
<input type="hidden" name="eachPageRows" id="eachPageRows" value="${pager.eachPageRows}">
<input type="hidden" name="verResults" id="verResults" value="${verResults}">
<c:if test="${errorMsg!=''}">
   <div class="alert ${impRes}">
        <strong>${errorMsg}</strong>
    </div>
</c:if>


<table class="table table-striped table-hover dataTable table-bordered">
    <thead>
    <tr>
      <c:forEach items="${headerValue}" var="h" varStatus="s">
    		  <th>&nbsp;${h }</th>
    	</c:forEach>
    </tr>
    </thead>
   <c:if test="${fn:length(content)>0}">
    		<c:forEach items="${content}" var="c" varStatus="s">
    			<tr>
    				<c:forEach items="${c}" var="b" varStatus="sta">
    					<c:if test="${sta.index==0 }"><td class="hide"><input type="hidden" name="list[${s.index }].wid" value="${b}" /></td></c:if>
    				    <c:if test="${sta.index==1 }"><td>&nbsp;${b}</td></c:if>
    				    <c:if test="${sta.index>1}"><td><font>&nbsp;${b}</font><input class="hide" type="text" name="list[${s.index }].field${sta.index-1}" value="${b}" /></td></c:if>
    				</c:forEach>
              </tr>
    		</c:forEach>
    	</c:if>
</table>
<style>
.alert{margin-bottom: 0px !important;}
</style>