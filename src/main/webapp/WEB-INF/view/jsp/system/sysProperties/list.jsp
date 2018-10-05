<%@ page language="java" pageEncoding="utf-8" %>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-sm-5">
        <div class="form-group">
            <label class="control-label col-xs-4" for="csfl">
                <font data-localize="frame_xtgl.xtsz_xtcssz_csmc">参数名称</font>：
            </label>

            <div class="col-xs-8">
                <input type="text" name="csfl" id="csfl" class="form-control">
            </div>
        </div>
    </div>
    <div class="col-sm-2 searchbtn-group">
        <a class="btn btn-sm btn-primary" data-startFrom="top" onclick="tool.doSearch(this)">
          <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
        </a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)"><font data-localize="frame_button.add"> 新增</font> <i class="fa fa-plus"></i></a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)"><font data-localize="frame_button.delete">删除 </font> <i class="fa fa-times"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)"><font data-localize="frame_button.update">修改</font> <i class="fa fa-edit"></i></a>
   
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
            <th data-localize="frame_xtgl.xtsz_xtcssz_csmc">参数名称</th>
            <th data-localize="frame_xtgl.xtsz_xtcssz_cs">参数</th>
            <th data-localize="frame_xtgl.xtsz_xtcssz_csz">参数值</th>
            <th data-localize="frame_xtgl.xtsz_xtcssz_cslx">参数类型</th>
            <th data-localize="frame_xtgl.xtsz_xtcssz_cssm">参数说明</th>
        </tr>
        </thead>
        <tbody>
        	<c:forEach items="${resultData}" var="o" varStatus="s">
        		 <tr id="tr_${o.wid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                        	<input  type="checkbox" name="selectNode" value="${o.wid}" class="mgc foocheck">
                        </label>
                    </div>
                </td>
                <td>
                    <a onclick="tool.editDataById(this,'${o.wid}')" href="javascript:void(0)">
                      ${o.csfl }
                    </a>
                </td>
                <td>&nbsp;${o.csmc }</td>
                <td>&nbsp;${o.cs}</td>
                <td>&nbsp;${o.cslx }</td>
                <td>&nbsp;${o.cssm }</td>
            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>
<script type="text/javascript">
    page = {
        doRefreshSysProp: function () {
            document.cookie = "dorefresh=true;";
            jQuery.post(tool.initParams("/s/system/sysProperties/refreshSysProp"),
                    function (data) {
                       window.location.reload(); 
                    }
            );
        }
    }

</script>