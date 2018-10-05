<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<%
    String basePath = request.getContextPath();
%>
<div id="page-content">
    <div class="col-md-12">
        <div class="panel panel-white">
            <div class="panel-heading" style="padding: 5px;"><h3>&nbsp;转发公文</h3></div>
            <hr style="margin-top: 0;">
            <form role="form" class="form-horizontal">
                <input type="hidden" id="wid" name="wid" value="${tsysDoc.wid}"/>
                <input type="hidden" id="jsrid" name="jsrid" value="${jsrid}"/>
                <input type="hidden" id="type" name="type" value="1"/>

                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name"> 接收部门 ： </label>

                    <div class="col-sm-11">
                        <input type="text" id="jsrname" name="jsrname"
                               readonly="readonly" class="validate[required] form-control" value="${jsrname }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name">  </label>

                    <div class="col-sm-11" style="height: 480px;">
                           <div class="tabbable" style="height: 480px;">
                               <ul style="height: 35px;"
                                   class="nav nav-tabs padding-12 tab-color-blue background-blue"
                                   id="myTab4">
                                   <li class="active" style="height: 35px;"><a style="height: 35px;">接收人</a>
                                   </li>
                                   <div style="margin-top: 10px;" id="xzbms">还未选中接收人</div>
                               </ul>

                               <div class="tab-content" style="height: 410px;">
                                   <div id="home4" name="jsrDiv" class="tab-pane in active"
                                        style="padding: 0px;">
                                      <iframe width="270px" marginwidth="0" scrolling="yes" height="410px"
                                               frameborder="0" name="jsbmIframe" id="jsbmIframe"
                                               loadsrc="<%=basePath%>/s/biz/sysDoc/getjsbm?wid=${tsysDoc.wid}"></iframe>
                                   
                                   </div>
                               </div>
                           </div>
                    </div>
                </div>
                

                <div class="form-group" id="savediv">
                    <div class="col-md-offset-1 col-sm-9">
                        <button class="btn btn-sm btn-success" type="button"
                                onclick="tool.saveData(this)">
                            发送 <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
                <br/>
            </form>


        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>
<script>
    subPage = {

        save_callback: function (data, form_element) {
            $('#savediv').remove();
            $('a[name*="deletefj"]').remove();
        }
    }
    $(document).ready(function () {
    	 $('#jsbmIframe').each(function () {
             var tt = $(this);
             var url = $(this).attr('loadsrc');

             if (url != null && url.indexOf('jd=') == -1) {
                 $.post(basePath + '/s/geturl', {'url': url}, function (data) {
                     if (url.indexOf('?') != -1) tt.attr('src', url + '&jddes=' + data);
                     else tt.attr('src', url + '?jddes=' + data);
                 });
             }
         });
    });
</script>