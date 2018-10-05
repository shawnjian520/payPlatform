<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<div class="col-md-12">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title" data-localize="frame_xtgl.sjzd_zdwh_zdwh">数据字典比对</h4>
            <div class="panel-tools">
                <div class="dropdown">
                    <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                        <i class="fa fa-cog"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                        <li>
                            <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i> <span>收起</span>
                            </a>
                        </li>
                        <li>
                            <a class="panel-expand" href="#">
                                <i class="fa fa-expand"></i> <span>全屏</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <form method="post" class="form-horizontal">
                <div class="row">
                    <div class="col-md-12">
                        <a class="btn btn-sm btn-success" onclick="refresh('3')">
                            <font data-localize="">根据数据库生成新js文件</font><i class="fa fa-refresh"></i>
                        </a>
                        <a class="btn btn-sm btn-success" onclick="refresh('1')">
                            <font data-localize="">将js文件同步到数据库</font> <i class="fa fa-refresh"></i>
                        </a>
                        <a class="btn btn-sm btn-success" onclick="refresh('2')">
                            <font data-localize="">将js文件同步到数据库 ，并删除之前存在的数据</font><i class="fa fa-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="dataTables_wrapper form-inline">
                    <table
                            class="table table-striped table-hover dataTable table-bordered table-order">
                        <thead>
                        <tr>
                            <th colspan="2" data-localize="">数据库</th>
                            <th colspan="2" data-localize="">js文件</th>
                            <th rowspan="2" data-localize="">是否一致</th>
                            <%--<th rowspan="2">操作</th>--%>
                        </tr>
                        <tr>
                            <th data-localize="">字典名称</th>
                            <th data-localize="">字典数</th>
                            <th data-localize="">字典名称(数据库)</th>
                            <th data-localize="">字典数</th>
                        </tr>
                        </thead>
                        <tbody id="codetbody">
                        <c:forEach items="${codes}" var="obj">
                            <tr name="code" value="${obj.zdlb }">
                                <td>${obj.lbmc}(${obj.zdlb })</td>
                                <td>${obj.zds}</td>
                                <td></td>
                                <td></td>
                                <td>比对中...</td>
                                    <%--<td>比对明细</td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>
<script>
    function initcode() {
        var key_exist = ',';
        $('tr[name*="code"]').each(function (i) {
            var zdlb = $(this).attr('value');
            key_exist += zdlb + ',';
            var size = codes.getsize(zdlb + '_code_html');
            if (size > 0) {
                $(this).find('td').eq(2).html($(this).find('td:first').html());
                $(this).find('td').eq(3).html(size);
                if (size == $(this).find('td').eq(1).html()) {
                    $(this).find('td').eq(4).html('一致');
                } else {
                    $(this).find('td').eq(4).html('不一致');
                    $(this).addClass('text-danger');
                }

            } else {
                $(this).find('td').eq(4).html('不一致');
                $(this).addClass('text-danger');
            }
        });

        var key = codes.getkey().split(',');
        for (var a = 0; a < key.length; a++) {
            if (key_exist.indexOf(',' + key[a] + ',') == -1 && key[a] != '') {
                var htm = '<tr class="text-danger"><td></td><td></td>' +
                    '<td>' + key[a] + '</td>' +
                    '<td>' + codes.getsize(key[a] + '_code_html') + '</td>' +
                    '<td>不一致</td>' +
                    '<td>比对明细</td>' +
                    '</tr>';
                $('#codetbody').append(htm);
            }
        }
    }
    initcode();

    function refresh(type) {
        if (type == '1') {
            if (confirm('您确定要将js文件中的数据同步到数据库中吗？,数据同步可能需要时间，请耐心等待。')) {
                var keys = codes.getallkey();
                for (var i = 0; i < keys.length; i++) {
                    var key = keys[i];
                    var zdmc = codes.get_name_key(key);
                    var zdbm = codes.get_id_key(key);
                    var zdlb = key.substring(0, key.indexOf('_code_html'));
                    $.post('<%=basePath%>s/ajax/refresh/syscode', {
                        'zdlb': zdlb,
                        'zdbm': zdbm,
                        'zdmc': zdmc
                    }, function () {

                    })
                }
            }

        } else if (type == '2') {
            if (confirm('您确定要将js文件中的数据同步到数据库中，并将数据库中之前存在的数据删除吗？,数据同步可能需要时间，请耐心等待。')) {
                var keys = codes.getallkey();
                for (var i = 0; i < keys.length; i++) {
                    var key = keys[i];
                    var zdmc = codes.get_name_key(key);
                    var zdbm = codes.get_id_key(key);
                    var zdlb = key.substring(0, key.indexOf('_code_html'));
                    var isdel = '1';
                    if (i == 0) isdel = '0';
                    $.post('<%=basePath%>s/ajax/refresh/syscode', {
                        'zdlb': zdlb,
                        'zdbm': zdbm,
                        'zdmc': zdmc,
                        'isdel': isdel
                    }, function () {

                    })
                }
            }
        } else if (type == '3') {
            if (confirm('您确定要根据数据库生成新的js文件吗？,数据同步可能需要时间，请耐心等待。')) {
                $.post('<%=basePath%>s/ajax/refresh/syscode', {'zdlb': 'crecodejs'}, function () {

                })
            }

        }
    }
</script>