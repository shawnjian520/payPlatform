<%@ page import="com.jd.util.CacheEnum" %>
<%@ page import="com.jd.support.cache.CacheUtils" %>
<%@ page import="com.jd.system.entity.TSysInit" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <th class="jdlanguage">操作记录</th>
        </tr>
        </thead>
        <tbody>
        ${log }
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
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end: PAGE CONTENT-->
<%if("1".equals(((TSysInit) CacheUtils.get(CacheEnum.chahe_sysInit)).getTabModels())){//如果tabModel%>
    </div>
    <%@include file="../../common/tab-model-bottom.jsp" %>
<%}%>