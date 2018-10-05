<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/uploadify.jsp" %>
<div id="importload_back" style="display: none;"></div>
<div id="importload" style="display: none;">
    <div style="width: 100%;float: left;height: 40px;line-height: 40px;border-bottom: 2px solid #cccccc;">
        <div style="float: left;color: #448db8;font-size: 16px;font-weight: bold;padding-left: 15px;">导入数据</div>
        <div style="float: right;color: #a2a2a2;font-size: 14px;padding-right: 15px;">窗口数据导入完成之后自动关闭</div>
    </div>
    <div id="importcontent" style="width: 350px;float: left;margin-top: 10px;padding-left: 20px;">
        &nbsp;
    </div>
    <div style="float: left;margin-top: 10px;padding-top:50px;padding-left: 10px;">
        <img src="<%=basePath %>/resources/images/sysimport.gif"/>
    </div>
</div>
<div id="page-content" class="row">
    <div class="col-md-12 ">
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title"></h4>
                <div class="panel-tools">
                    <div class="dropdown">
                        <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                            <i class="fa fa-cog"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                            <li>
                                <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i>
                                    <span>收起</span> </a>
                            </li>
                            <li>
                                <a class="panel-refresh" href="#">
                                    <i class="fa fa-refresh"></i> <span>刷新</span>
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
                <form method="post" class="form-horizontal" data-action=tool.initParams("<%=basePath%>system/excelUserImport-list.action?sheetName=0")>
                	<input type="hidden" id="importTempID" name="importTempID" value="${importTempID}">
                	<input type="hidden" id="table_type" name="table_type" value="${table_type}">
                	<input type="hidden" id="sequence" name="sequence" value="${sequence}">
                	<input type="hidden" id="tzurl" name="tzurl" value="${tzurl}">
                    <div class="row">
                        <div class="col-md-12">
                       	<c:if test="${object.modelfile!=null&&object.modelfile!=''}">
                       	<a target="_blank" onclick="tool.exportData('${object.modelfile}','${object.nodeid}')" class="btn btn-primary btn-sm">下载导入模板 <i class="fa fa-cloud-download"></i></a>
                       	</c:if>
                        <c:if test="${object.modelfile==null||object.modelfile==''}">
                       	<a target="_blank" onclick="tool.exportData('exportTempMb.jsp?importTempID=${importTempID}','<%=basePath %>')" class="btn btn-primary btn-sm">下载导入模板 <i class="fa fa-cloud-download"></i></a>
                       	</c:if>
                            <input type="file" id="fileUpload"/>
                            <a id="upload" class="btn btn-info dn btn-sm">
                                导入<i class="fa fa-cloud-upload"></i>
                            </a>
                            <a id="editData" class="btn btn-info dn btn-sm" onclick="subPage.editData()">
                                 编辑数据<i class="fa fa-edit"></i>
                            </a>
                            <a id="saveData" class="btn btn-info dn btn-sm" onclick="subPage.saveData()">
                                 保存数据<i class="fa fa-check"></i>
                            </a>
                            <a id="exportErrorData" class="btn btn-info dn btn-sm">
                                 导出错误数据<i class="fa fa-cloud-download"></i>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="uploadfileQueue"></div>
                        </div>
                    </div>
                    <div class="dataTables_wrapper form-inline">

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/uploadify.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<style>
.uploadifive-button{line-height: 20px !important;height: 28px !important;}
</style>
<script type="text/javascript">
  subPage = {
       form_el: null,
        el: null,
        url: '',
        timeout_import: null,
        times_import: 0,
        openimport: function (info) {
            clearTimeout(subPage.timeout_import);
            subPage.initimport();
            $('#import_times').remove();
            $('#importcontent').find('font').css({'color': '#b1b1b1', 'font-weight': 'normal', 'font-size': '14px'});
            $('#importcontent').find('font:last').append('，用时' + subPage.times_import + '秒');
            $('#importcontent').append('<font>' + info + '<span id="import_times"><lable>0</lable>秒</span></font>');
            $('#importcontent').find('font:last').css({'color': '#555555', 'font-weight': 'bold', 'font-size': '14px'});
            $('div[id*="importload"]').css('display', '');
            subPage.times_import = 0;
            subPage.timeout_import = setTimeout('subPage.importtimes()', 1000);

        },
        initimport: function () {
            var h = document.body.scrollHeight;
            if (h < document.documentElement.clientHeight) {
                h = document.documentElement.clientHeight;
            }
            $('#importload_back').css("height", h);
            $('#importload_back').css("width", document.body.scrollWidth);
            $('#importload').css("left", (document.body.scrollWidth - 700) / 2);
            $('#importload').css("top", (h - 400) / 2);
        },
        closeimport: function () {
            $('#importcontent').html('');
            $('div[id*="importload"]').css('display', 'none');
        },
        importtimes: function () {
            subPage.times_import++;
            $('#import_times').find('lable').html(subPage.times_import);
            subPage.timeout_import = setTimeout('subPage.importtimes()', 1000);
        },
        onUploadStart: function () {
        	subPage.openimport('开始上传文件...');
        },
        onUploadError: function () {
        	subPage.closeimport();
        },
        onSelect: function (file) {
            $("#upload").css({"display": "inline-block"});
        },
        onUploadSuccess: function (file, data, response) {
            $("#uploadfileQueue").html("解析中...");
            $("#yspager_currentPageno").val(1);
            subPage.openimport('文件已上传，解析中...');
            data = data.replace("\\", "");
            data = data.replace("\\", "/");

            data = eval("(" + data + ")");
  
            $.ajax({
                url: tool.initParams("<%=basePath%>/s/system/excelUserImport/list?filePath=" + data.filePath + "&sheetName=0"),
                cache: false,
                type: "post",
                data: subPage.form_el.serialize(),
                dataType: "html",
                timeout: 1000 * 60 * 10,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $("#uploadfileQueue").html("");
                    subPage.form_el.find(".dataTables_wrapper").html(XMLHttpRequest.responseText);
                    subPage.closeimport();
                },
                success: function (data) {
                 	subPage.openimport('文件解析完成，数据验证中...');
		             $("#uploadfileQueue").html("");
		             subPage.form_el.find(".dataTables_wrapper").html(data);
		             subPage.form_el.attr("data-action", tool.initParams("<%=basePath%>/s/system/excelUserImport/list?sheetName=0"));
                   subPage.importback(data);
                }
            });
        },
       importback: function (data){
        	
             if ($('#verResults').val() == '2') {
                 $.ajax({
                     url: tool.initParams(subPage.url + "/importBefore"),
                     cache: false,
                     type: "post",
                     data: subPage.form_el.serialize(),
                     dataType: "html",
                     timeout: 1000 * 60 * 10,
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                         $("#uploadfileQueue").html("");
                         subPage.form_el.find(".dataTables_wrapper").html('导入前方法执行错误' + XMLHttpRequest.responseText);
                         subPage.closeimport();
                     },
                     success: function (data) {
                     	subPage.openimport('数据验证完成，保存数据中...');
                         $.ajax({
                             url: tool.initParams("<%=basePath%>/s/system/excelUserImport/saveContext?sheetName=0"),
                             cache: false,
                             type: "post",
                             data: subPage.form_el.serialize(),
                             dataType: "html",
                             timeout: 1000 * 60 * 10,
                             error: function (XMLHttpRequest, textStatus, errorThrown) {
                                 $("#uploadfileQueue").html("");
                                 subPage.form_el.find(".dataTables_wrapper").html('导入方法执行错误' + XMLHttpRequest.responseText);
                                 subPage.closeimport();
                             },
                             success: function (data) {
                                 $.ajax({
                                     url: tool.initParams(subPage.url + "/importAfter"),
                                     cache: false,
                                     type: "post",
                                     data: subPage.form_el.serialize(),
                                     dataType: "html",
                                     timeout: 1000 * 60 * 10,
                                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                                         $("#uploadfileQueue").html("");
                                         subPage.form_el.find(".dataTables_wrapper").html('导入后方法执行错误' + XMLHttpRequest.responseText);
                                         subPage.closeimport();
                                     },
                                     success: function (data) {
                                     	subPage.openimport('数据导入完成');
                                         setTimeout('subPage.closeimport()', 1000);
                                         if($('#tzurl').val()!=null && $('#tzurl').val()!='' && 
                                         	subPage.form_el.find(".dataTables_wrapper").find("table.dataTable").find("tr").length<=1)
                                         	tool.openview(subPage.el,$('#tzurl').val());
                                     }
                                 });
                                 subPage.form_el.find(".dataTables_wrapper").html(data);
                                 subPage.form_el.attr("data-action", tool.initParams("<%=basePath%>/s/system/excelUserImport/errorList?sheetName=0"));
                                 //导出错误数据
                                 $("#exportErrorData").click(function () {
                                     tool.exportData("exportTempExcelData.jsp?importTempID=${importTempID}&table_type=${table_type}");
                                 });
                                  if(subPage.form_el.find(".dataTables_wrapper").find("table.dataTable").find("tr").length>1){
                                  	$('#editData').removeClass('dn');
                                  }else{
                                  	$('#editData').removeClass('dn').addClass('dn');
                                  	$('#saveData').removeClass('dn').addClass('dn');
                                  }
                                 
                                // Main.initElement();
                             }
                         });
                     }
                 });
             } else {
              	//导出错误数据
                  $("#exportErrorData").click(function () {
                      tool.exportData("exportTempExcelData.jsp?importTempID=${importTempID}&table_type=${table_type}");
                  });
              	 $('#exportErrorData').removeClass('dn');
              	 $('#editData').removeClass('dn');
              	 subPage.closeimport();
              }
              subPage.form_el.find(".dn").removeClass("dn");
              //Main.initElement();
        },
        saveData :function(){
        	subPage.openimport('数据解析中...');
        	 $.ajax({
                url: tool.initParams("<%=basePath%>/s/system/excelUserImport/savelist?sheetName=0"),
                cache: false,
                type: "post",
                data: subPage.form_el.serialize(),
                dataType: "html",
                timeout: 1000 * 60 * 10,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $("#uploadfileQueue").html("");
                    subPage.form_el.find(".dataTables_wrapper").html(XMLHttpRequest.responseText);
                    subPage.closeimport();
                },
                success: function (data) {
                 	subPage.openimport('文件解析完成，数据验证中...');
		             $("#uploadfileQueue").html("");
		             subPage.form_el.find(".dataTables_wrapper").html(data);
		             subPage.form_el.attr("data-action", tool.initParams("<%=basePath%>/s/system/excelUserImport/savelist?sheetName=0"));
                   subPage.importback(data);
                }
            });
        },
        editData:function(){
        	$('#saveData').removeClass('dn');
        	subPage.form_el.find(".dataTables_wrapper").find("table.dataTable").find("font").removeClass("hide").addClass("hide");
        	subPage.form_el.find(".dataTables_wrapper").find("table.dataTable").find("input").removeClass("hide");
        }
    }
   
    $(document).ready(function () {
        subPage.url = '${object.url}';
        if(subPage.url!=null && subPage.url.indexOf('/s/')==0){
        	subPage.url = '<%=basePath%>'+subPage.url;
        }
        tool.initFileUpload("#fileUpload", null, null, false, "*.xlsx;*.xls;*.dbf", 1, subPage.onSelect, subPage.onUploadSuccess, null,'200MB','uploadfileQueue');
        $("#upload").click(function () {
        	subPage.form_el = $(this).parents(".form-horizontal");
            subPage.el = this;
            tool.startUpload($("#fileUpload"));
        });
    });

</script>
