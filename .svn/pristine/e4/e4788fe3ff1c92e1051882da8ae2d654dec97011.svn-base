<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>

<div class="row">
    <form role="form" class="form-horizontal">

        <table style="width: 100%;">
            <tr>
                <td width="45%" valign="top">
                    <div class="col-md-12 col-sm-12">
                        <jd:panel className="input-panel" title="原始字段（单击字段选中）">
                            <div class="panel-group" id="accordion" role="tablist"
                                 aria-multiselectable="true">
                                <input type="text" class="searchleft" id="searchleft" size="20" placeholder="输入筛选条件"/>
                                <ul id="leftable" class="sortable">
                                    <c:forEach items="${list }" var="obj">
                                        <li class="ui-state-default" value="${obj.id }"><span
                                                class="ui-icon ui-icon-arrowthick-2-n-s"></span>${obj.caption }</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </jd:panel>
                    </div>
                </td>
                <td width="70px" valign="top">
                    <div class="form-group">
                        <div class="col-md-offset-2 col-sm-9">
                            <button class="btn btn-sm btn-success" type="button" style="width: 60px;" id="aaaa"
                                    onclick="subPage.selectall(this)">
                                全选 <i class="fa fa-angle-double-right"></i>
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-sm-9">
                            <button class="btn btn-sm btn-success" type="button" style="width: 60px;" id="aaaa"
                                    onclick="subPage.selectallb(this)">
                                反选 <i class="fa fa-refresh"></i>
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-sm-9">
                            <button class="btn btn-sm btn-success" type="button" style="width: 60px;" id="aaaa"
                                    onclick="subPage.removeall(this)">
                                删除 <i class="fa fa-angle-double-left"></i>
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-sm-9">
                            <button class="btn btn-sm btn-success" type="button" style="width: 60px;" id="aaaa"
                                    onclick="subPage.saveok(this)">
                                保存 <i class="fa fa-check"></i>
                            </button>
                        </div>
                    </div>
                </td>
                <td valign="top">
                    <div class="col-md-12 col-sm-12">
                        <jd:panel className="input-panel" title="已选中字段（单击字段删除、可拖动字段排序）">
                            <div class="panel-group" id="accordion" role="tablist"
                                 aria-multiselectable="true">
                                <input type="text" class="searchleft" id="searchright" size="20" placeholder="输入筛选条件"/>
                                <ul id="sortable" class="sortable">

                                </ul>
                            </div>
                        </jd:panel>
                    </div>
                </td>
            </tr>
        </table>
        <script src="<%=basePath %>/resources/plugins/jquery-ui-1.11.4/jquery-ui.js"></script>
        <style>
            .sortable {
                list-style-type: none;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100px;
            }

            .sortable li {
                border: 1px solid #cccccc;
                float: left;
                padding: 0 10px;
                margin-left: 10px;
                margin-top: 3px;
                height: 25px;
                line-height: 25px;
                cursor: pointer;
            }

            .searchli {
                background-color: red;
                color: #ffffff;
            }

            .sortable li span {
                position: absolute;
                margin-left: -1.3em;
            }

            .searchleft {
                margin-left: 10px;
            }
        </style>

        <script>
            subPage = {
                addParam: function (el, oo) {
                    $('#sortable').append($(el).prop('outerHTML'));
                    $(el).remove();
                    $('#sortable').find('li:last').unbind('click');
                    $('#sortable').find('li:last').bind('click', function () {
                        subPage.removeParam(this);
                    });
                    $('#sortable').find('li:last').each(function () {
                        $(this).removeClass('searchli');
                    });
                    if (oo) subPage.initSort();
                },
                removeParam: function (el) {
                    $('#leftable').append($(el).prop('outerHTML'));
                    $(el).remove();
                    $('#leftable').find('li:last').unbind('click');
                    $('#leftable').find('li:last').bind('click', function () {
                        subPage.addParam(this, true);
                    });
                    $('#leftable').find('li:last').each(function () {
                        $(this).removeClass('searchli');
                    });
                },
                initSort: function () {
                    $("#sortable").sortable();
                    $("#sortable").disableSelection();
                },
                saveok: function () {
                    var param = '[';
                    var param_name = '[';
                    $('#sortable').find('li').each(function (i) {
                        if (i != 0) {
                            param += ',';
                            param_name += ',';
                        }
                        param += '\'' + $(this).attr('value') + '\'';
                        param_name += '\'' + $(this).text() + '\'';
                    });
                    param += ']';
                    param_name += ']';
                    tool.choseParamBack(param + ";" + param_name);
                },
                selectall: function () {
                    $('#leftable').find('li').each(function () {
                        subPage.addParam(this, false);
                    });
                    subPage.initSort();
                },
                selectallb: function () {
                    $('#leftable').find('li').each(function () {
                        $(this).attr('isold', 'true');
                    });
                    subPage.removeall();
                    $('#leftable').find('li[isold="true"]').each(function () {
                        $(this).removeAttr('isold');
                        subPage.addParam(this, false);
                    });
                    subPage.initSort();
                },
                removeall: function () {
                    $('#sortable').find('li').each(function () {
                        $(this).click();
                    });
                }
            };
            $(function () {
                $('#leftable').find('li').bind('click', function () {
                    subPage.addParam(this, true);
                });
                $('#searchleft').bind('keyup', function () {
                    var v = $('#searchleft').val();
                    if (v == null || v == '') {
                        return false;
                    }
                    $('#leftable').find('li').each(function () {
                        if ($(this).text().indexOf(v) != -1) {
                            $(this).addClass('searchli');
                        } else {
                            $(this).removeClass('searchli');
                        }
                    });
                });
                $('#searchright').bind('keyup', function () {
                    var v = $('#searchright').val();
                    if (v == null || v == '') {
                        return false;
                    }
                    $('#sortable').find('li').each(function () {
                        if ($(this).text().indexOf(v) != -1) {
                            $(this).addClass('searchli');
                        } else {
                            $(this).removeClass('searchli');
                        }
                    });
                });
            })
        </script>
    </form>
</div>
