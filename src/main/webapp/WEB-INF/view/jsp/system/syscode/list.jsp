<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>

<div class="row">
    <div class="col-xxl-12 col-xl-12 col-sm-12">
        <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
            <div class="form-group">
                <label title="${lbmc }" class="col-sm-3 control-label ell nopadding" for="xxbt"> ${lbmc }：</label>
                <div class="col-sm-9">
                    <input type="text" id="zdmc" name="zdmc" class="form-control  pull-left" placeholder="${lbmc }"
                           value="${object.zdmc }"/>
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
                查询 <i class="fa fa-search"></i>
            </a>
            <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                重置 <i class="fa fa-mail-reply-all"></i>
            </a>
        </div>
    </div>
</div>

<hr class="dividing-line"/>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" onclick="tool.addData(this,'zdlb=${zdlb}&lbmc=${lbmcbm }')">
            新增 <i class="fa fa-plus"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">
            删除<i class="fa fa-times"></i>
        </a>
        <a class="btn btn-sm btn-success" onclick="tool.editData(this)">
            修改 <i class="fa fa-edit"></i>
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
            <th>编码</th>
            <th>${lbmc }</th>
            <th>排序</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj" varStatus="sta">
            <tr id="tr_${obj.wid}">
                <td class="center" width="25">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" class="mgc foocheck" name="selectNode" value="${obj.wid}">
                        </label>
                    </div>
                </td>
                <td><a onclick="tool.editDataById(this,'${obj.wid}')" href="javascript:void(0)">${obj.zdbm}</a></td>
                <td>${obj.zdmc}</td>
                <td>${obj.zdpx}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">视图查询sql配置规则</h4>
            </div>
            <div class="modal-body">
                <table style="width: 100%;border:0;">
                    <tr>
                        <td style="padding: 5px;text-align: left;"><font>实例：select xsxm a_学生姓名,sfzh
                            a_身份证号,gxbm a_G高校_depart_22,yxbm a_G院系_depart_23,xb a_G性别_code_xb,csny
                            a_出生年月,rxnd a_G入学年度,pcwid a_G申请年度,nj a_G年级,bjbm a_G班级,lxdh a_联系的话,xh a_学号,mz
                            a_民族_code_mz,to_number(sqje) a_申请金额 from t_dk_xyd_sqxx</font></td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;"><font>创建ywlx_gjcx字典，字典值用字母表示，比如a:生源地申请</font></td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;">
                            1、每个字段必须使用中文别名【由“业务名称_字段名称”组成】<font>（比如【 xsxm 业务名称_学生姓名,sfzh 业务名称_身份证号】）</font>，
                            数值类型字段请自觉使用to_number()转换<font>（比如【 to_number(sqje) 业务名称_申请金额】）</font>，
                            日期类型字段请自觉使用to_date()转换<font>（比如【 to_number(sqje) 业务名称_申请金额】）</font>，
                            查询字段排序既为显示页面标题排序，<br/>
                            <font>注：别名字段长度不能超过30字符</font>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;">
                            2、字段需要使用数据字典表别名配置【业务名称_中文别名_code_字典类型】<font>（比如【mz 业务名称_民族_code_mz,xb
                            业务名称_性别_code_xb】）</font>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;">
                            3、字段需要使用数据字典视图别名配置【业务名称_中文别名_codev_字典类型】<font>（高校就业使用）</font>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;">
                            4、字段需要使用部门表别名配置【业务名称_中文别名_depart_部门类型】<font>（比如【gxbm 业务名称_高校_depart_22,yxbm
                            业务名称_院系_depart_23】）</font>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;">
                            5、字段需要其他表转化的别名配置【业务名称_中文别名_表名_关联字段_名称字段】<font>（比如【zybm 业务名称_G专业_dm_zy_code_name】）</font>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;text-align: left;">
                            6、字段可分组别名配置【G中文别名】<font>（比如【xb G性别,gxbm G高校,yxbm G院系】）</font>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<style>
    .modal-body table tr {
        line-height: 20px;
        height: 20px;
    }

    .modal-body table tr font {
        color: red;
    }
</style>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>
<script>
    function isRefresh() {
        return true;
    }
</script>