<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<style>
    .theme-screenshot {
        background-position: center;
        background-repeat: no-repeat;
        height: 600px;
    }
</style>
<%@include file="../../common/input-header.jsp" %>
<ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#sysTheme" data-toggle="tab">
            系统模板
        </a>
    </li>
    <!-- <li><a href="#usrTheme" data-toggle="tab">用户模板</a></li> -->
</ul>
<div id="myTabContent" class="tab-content">

    <div class="tab-pane fade in active" id="sysTheme">
        <div class="row">
            <div class="col-xs-12 margin-bottom-10">
                <!--    <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)">添加网站
                       <i class="fa fa-plus"></i></a> -->
                <script>
                    $(function () {
                            tool.initFileUpload("#fileupload", null, null, true, "", "", null, function (file, data, response) {
                                    data = data.replace("\\", "");
                                    data = data.replace("\\", "/");
                                    data = eval("(" + data + ")");
                                    $("#file_name").val(data.fileold);
                                    $("#file_font a").html(data.fileold);
                                    $("#file_path").val(data.filePath);
                                    $.ajax({
                                        url: tool.initParams('<%=basePath%>/s/system/wxfile/addSize'),
                                        data: {
                                            'filePath': data.filePath,
                                            'fileName': data.fileold,
                                            'type': 'sysThemes'

                                        },
                                        type: "post",
                                        dataType: "json",
                                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                                            parent.toastr.warning(errorThrown);
                                        },
                                        success: function (data) {
                                            if (data) {
                                                parent.toastr.warning("添加网站成功！");
                                                location.reload();
                                            }
                                        }
                                    });
                                }
                                , null, null, '', '添加网站 <i class=\"fa fa-plus\"></i>');
                        }
                    );
                </script>
                <input type="file" data-filelength="" id="fileupload">
                <input type="hidden" name="file.path" id="file_path" value="${object.file.path}">
                <input type="hidden" name="file.name" id="file_name" value="${object.file.name}">
            </div>
            <c:forEach items="${resultData}" var="obj">
                <c:if test="${obj.praent==rootpath}">
                    <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12" id="theme_${obj.id}">
                        <div class="thumbnail theme-box ">
                            <div class="theme-screenshot"
                                 style="background-image: url('<%=basePath%>/themes/sysThemes/${obj.name}/screenshot.jpg')"></div>
                            <div class="caption" align="center">
                                <h3 class="ell">${obj.name}
                                </h3>
                                <p>
                                    <a href="javascript:void(0)" class="btn btn-sm btn-primary"
                                       onclick="preview('${obj.name}')">
                                        预览
                                    </a>
                                    <a href="javascript:void(0)" class="btn btn-sm btn-primary"
                                       data-tab-name="${obj.name}-编辑"
                                       onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/system/wxfile/edit?themeName=${obj.name}&user=0')">
                                        编辑
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <%--  <div class="tab-pane fade " id="usrTheme">
     <div class="row">
           <div class="col-xs-12 margin-bottom-10">
               <script>
                                   $(function(){
                                       tool.initFileUpload("#fileupload2",null,null,true,"","",null,function(file, data, response){
                                           data=data.replace("\\","");
                                           data=data.replace("\\","/");
                                           data = eval("("+data+")");
                                           $("#file_name2").val(data.fileold);
                                           $("#file_font2 a").html(data.fileold);
                                           $("#file_path2").val(data.filePath);
                                            $.ajax({
                                                   url: tool.initParams('<%=basePath%>/s/system/wxfile/addSize'),
                                                   data: {
                                                       'filePath':data.filePath,
                                                       'fileName':data.fileold,
                                                       'type':'usrThemes'

                                                   },
                                                   type:"post",
                                                   dataType: "json",
                                                   error: function (XMLHttpRequest, textStatus, errorThrown) {
                                                      parent.toastr.warning(errorThrown);
                                                   },
                                                   success: function (data) {
                                                          if(data){
                                                              parent.toastr.warning("添加网站成功！");
                                                          }
                                                   }
                                           });
                                       }
                                                           ,null,null,'','添加网站 <i class=\"fa fa-plus\"></i>');
                                   }
                                    );
                               </script>
                               <input type="file" data-filelength="" id="fileupload2">
                               <input type="hidden" name="file.path" id="file_path2" value="${object.file.path}">
                               <input type="hidden" name="file.name" id="file_name2" value="${object.file.name}">
           </div>
           <c:forEach items="${resultData2}" var="obj">
           <c:if test="${obj.praent==rootpath2}">
               <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12" id="theme_${obj.id}">
                   <div class="thumbnail theme-box ">
                       <div class="theme-screenshot" style="background-image: url('<%=basePath%>/themes/usrThemes/${obj.name}/screenshot.jpg')"></div>
                       <div class="caption" align="center">
                           <h3 class="ell">${obj.name}
                           </h3>
                           <p>
                               <a href="javascript:void(0)" class="btn btn-sm btn-primary"
                                  onclick="preview('${obj.name}')">
                                   预览
                               </a>
                               <a href="javascript:void(0)" class="btn btn-sm btn-primary" data-tab-name="${obj.name}-编辑"
                                  onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/system/wxfile/edit?themeName=${obj.name}&user=1')">
                                   编辑
                               </a>
                           </p>
                       </div>
                   </div>
               </div>
               </c:if>
           </c:forEach>
       </div>
     </div>   --%>

</div>
<%@include file="../../common/input-bottom.jsp" %>
<script>
    function preview(path) {
        window.open("<%=basePath%>/preview-h5.html?theme=" + path);
    }
</script>