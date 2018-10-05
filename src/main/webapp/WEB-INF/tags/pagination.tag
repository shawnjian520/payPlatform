<%@tag pageEncoding="UTF-8" %>
<%@ attribute name="page" type="com.jd.framework.util.Pager" required="true" %>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int current = page.getCurrentPageno();//当前页
    long totalRows = page.getTotalRows();//总记录数
    int begin = Math.max(1, current - paginationSize / 2);
    int end = Math.max(1, (int) page.getTotalRows() / page.getEachPageRows());

    int startLine = 1;//开始行
    int endLine = (int) page.getTotalRows();//结束行
    if(totalRows == 0){
        startLine = 0;
    }
    if (current != 1) {
        startLine = (page.getCurrentPageno() - 1) * page.getEachPageRows() + 1;
    }
    if (current != page.getTotalPages()) {
        endLine = page.getCurrentPageno() * page.getEachPageRows();
    }
    if (page.getTotalRows() % page.getEachPageRows() != 0)
        end = Math.max(1, (int) page.getTotalRows() / page.getEachPageRows() + 1);

    request.setAttribute("current", current);
    request.setAttribute("begin", begin);
    request.setAttribute("end", end);
%>
<input type="hidden" id="orderType" name="orderType" value="<%=page.getOrderType()%>">
<input type="hidden" id="orderField" name="orderField" value="<%=page.getOrderField()%>">
<div class="col-md-5 page-info">
    <div class="dataTables_info"><div class="dataTables_info"><font data-localize="frame_tip.page_dqxs">当前显示</font> <%=startLine%><font data-localize="frame_tip.page_d">到</font> <font data-localize="frame_tip.page_t"><%=endLine%> </font>，<font data-localize="frame_tip.page_g">共</font> <%=page.getTotalRows() %> <font data-localize="frame_tip.page_jl">条记录</font></div></div>
</div>
<div class="col-md-7 page-info">
    <div class="dataTables_paginate paging_bootstrap">
        <ul class="pagination pagination-blue">
            <% if (current != 1) {%>
            <li><a data-current-page-no="1"><i class="fa fa-angle-double-left"></i></a></li>
            <li><a data-current-page-no="<%=current-1 %>"><i class="fa fa-angle-left"></i></a></li>
            <%} else {%>
            <li class="disabled"><a><i class="fa fa-angle-double-left"></i></a></li>
            <li class="disabled"><a><i class="fa fa-angle-left"></i></a></li>
            <%} %>
            <%
                if (end <= 8 || current <= 2) {
                    for (int i = begin; i <= (end > 8 ? 8 : end); i++) {
                        if (i == current) {
            %>
            <li class="active"><a data-current-page-no="<%=i %>"><%=i %>
            </a></li>
            <%
            } else {
            %>
            <li><a data-current-page-no="<%=i %>"><%=i %>
            </a></li>
            <%
                    }
                }
            %>
            <%
            } else if (current > 2) {
                for (int i = current - 2; i <= ((current + 5 > end) ? end : (current + 5)); i++) {
            %>
            <%
                if (i == current) {
            %>
            <li class="active"><a data-current-page-no="<%=i %>"><%=i %>
            </a></li>
            <%
            } else {
            %>
            <li><a data-current-page-no="<%=i %>"><%=i %>
            </a></li>
            <%
                        }
                    }
                }
            %>

            <% if (current != end) {%>
            <li class="next"><a data-current-page-no="<%=current+1 %>"><i class="fa fa-angle-right"></i></a></li>
            <li class="next"><a data-current-page-no="<%=end %>"><i class="fa fa-angle-double-right"></i></a></li>
            <%} else {%>
            <li class="disabled"><a><i class="fa fa-angle-right"></i></a></li>
            <li class="disabled"><a><i class="fa fa-angle-double-right"></i></a></li>
            <%} %>
        </ul>
    </div>
</div>