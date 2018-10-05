<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%@include file="../../common/input-header.jsp" %>
<style>
    #accordion .panel-title {
        cursor: pointer;
    }

    #accordion .panel-heading {
        min-height: 20px;
        padding: 5px;
        background-color: #fff !important;
    }

    #accordion .panel-title {
        font-size: 13px;
    }

    #accordion .panel-body {
        border: 0 !important;
        padding: 5px 15px;
    }

    #accordion .panel {
        box-shadow: none !important;
    }

    #accordion ul {
        padding-left: 20px;
        margin: 0;
    }

    #accordion ul li {
        cursor: pointer;
    }

    .panel-body {
        padding: 5px 10px 10px 10px;
    }

    .panel-tabs > .panel-heading {
        min-height: 35px;
        background-color: #f2f2f2;
    }

    #code-mirror-html, #code-mirror-js {
        padding: 5px !important;
    }

    .panel-title {
        height: 17px;
    }

    .label-info {
        margin-right: 5px;
    }

    .label-info .red {
        cursor: pointer;
    }

    .layout-active {
        display: block !important;
        padding: 20px !important;
        cursor: pointer !important;
        box-shadow: inset 0 0 10px #0CC !important;
    }

    .layout-active * { /*display: none;*/

    }

    .CodeMirror {
        height: 350px !important;
    }

    .tabbable.edit-element .nav-tabs {
        border: medium none;
        float: none;
        margin-top: 0;
    }

    .tabbable.edit-element {
        padding: 1px;
        margin-bottom: 15px;
    }

    .modal-container {
        display: block;
    }

    .mask {
        box-sizing: border-box;
        border: 2px dashed #ff0033;
        box-shadow: inset;
        cursor: pointer;
        opacity: 0.5;
        position: absolute;
        color: #ff0033;
        font-weight: bold;
        background-color: #eee;
    }
</style>
<div class="row data-group" data-order="100">
    <div data-group-name="TESt" tit-remind="" data-order="100" class="layout col-xs-12" data-wid="yJX9454"
         data-assembly-id="5">
        <div class="panel input-panel">
            <div class="panel-heading"><h4 class="panel-title">条件筛选<font
                    style="color:red;font-size:12px;font-weight:bold;"></font></h4></div>
            <div class="panel-body">
              <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding ">
                    <div class="form-group">
                        <label style="margin-top: 7px;" title="Key"
                               class="col-sm-3 control-label ell nopadding" data-localize="">Key：</label>
                        <div class="col-sm-9">
                            <input type="text" id="mkbms"  class="form-control" placeholder="Key"/>
                        </div>
                    </div>
                </div>
              <div  style="margin-top: 7px; text-align: right; float: right;" class="col-xs-2">
                        <a class="btn btn-sm btn-primary" onclick="searchbykey()">
                            <font data-localize="">查询</font> <i class="fa fa-search"></i>
                        </a>
                        <a class="btn btn-sm btn-primary btn-reset" onclick="resetForm()">
                            <font data-localize="">重置</font> <i class="fa fa-mail-reply-all"></i>
                        </a>
                    </div>
              
            </div>
        </div>
    </div>
</div>

<div class="row">
    <form role="form" class="form-horizontal">

        <div class="col-md-3">
            <jd:panel className="input-panel" title="json模块">
                <div class="panel-group" style="position:relative;height:300px; overflow:auto"  id="accordion" role="tablist"
                     aria-multiselectable="true">
                </div>
            </jd:panel>
        </div>
        
        <div class="col-md-9">
            <jd:panel className="input-panel" title="详细信息">
          		<jd:lable  col="1" lable="Key">
                    <input type="text" id="mkbm"  class="form-control"
                           value=""/>
            	</jd:lable>  
            	<!-- validate[required]  -->
           		 <jd:lable  col="1" lable="Value">
                           <textarea id="mkjs"  class=" form-control"></textarea>
            	</jd:lable>  
            
             	<%-- <jd:lable  col="1" lable="Key">
                    <input type="text" id="key"  class=" form-control"
                           value=""/>
                </jd:lable>
                <jd:lable  col="1" lable="value">
                           <textarea id="value"  class=" form-control"></textarea>
            	</jd:lable>   --%>
            	 <div class="col-md-offset-2 col-sm-9">
                    <div class="form-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="savejson()">
                 	  	         保存 <i class="fa fa-check"></i>
                        </button>
                         <button class="btn btn-sm btn-success" type="button" onclick="addjson()">
                 	  	     新增 <i class="fa fa-plus"></i>
                        </button>
                        <button class="btn btn-sm btn-success" type="button" onclick="deljson()">
                 	  	         删除 <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
            </jd:panel>
            
        </div>
    </form>
</div>

<%@include file="../../common/input-bottom.jsp" %>

<script>

	function resetForm(){
		$("#mkbms").val("");
	}
	function searchbykey(){
		if($("#mkbms").val()!=""){
			ref2($("#mkbms").val());
		}else{
			ref();
		}
	}
	function ref(){
		var dataroot="<%=basePath%>/s/langurejson/getJson"; 
    	$.getJSON(dataroot, function(data){ 
    		  $("#accordion").empty();
                var html = "";
    		for(var o in data){
    		  html += "<div class='panel panel-default'>" +
    		  		  "<div class='panel-heading' role='tab'" +
    		    	  "id='heading" + o + "' role='button'" +
    		    	  "data-toggle='collapse' data-parent='#accordion'" +
                      "href='#collapse" + o + "' aria-expanded='true'" +
                      "aria-controls='collapse" + o + "'>" +
                       "<h4 class='panel-title' title=\""+data[o]+"\" onclick=\"getinfo('"+o+"','"+data[o]+"')\">" +
                       "<i class='fa fa-plus'></i> " + o + "" +
                       "</h4>" +
                       "</div>" +
                       "<div id='collapse" + o + "'" +
                       "class='panel-collapse collapse '" +
                       "role='tabpanel' aria-labelledby='heading" + o + "'>" +
                       "<div class='panel-body'>" +
                       "<ul>";
                       var a='1';
       		    	for(var e in data[o]){ 
       		  		
       		  		if(a=='1'){
       		  		 html += "<li data-temple-index='" + o+"-note' onclick=\"getinfo('"+o+"','"+data[o]["note"]+"','note','"+data[o]["note"]+"')\">模块介绍 </li>";
       		  	    	a=-1;
       		  		}
       		  		if(e!="note"){
       		  		html += "<li data-temple-index='" + o+"-"+e+ "' onclick=\"getinfo('"+o+"','"+data[o]["note"]+"','"+e+"','"+data[o][e]+"')\">" + e + "</li>";
       		  		}
       		   }
       		     html += "</ul>" +
                            "	</div>" +
                            "	</div>" +
                            "</div>";
     		 }  
     		   $("#accordion").append(html);
    	}); 
	} 

		function ref2(txt){
		var dataroot="<%=basePath%>/resources/language/lang/text-en.json"; 
    	$.getJSON(dataroot, function(data){ 
    		  $("#accordion").empty();
                var html = "";
    		for(var o in data){
    		if(o.indexOf(txt)>0){
    		  html += "<div class='panel panel-default'>" +
    		  		  "<div class='panel-heading' role='tab'" +
    		    	  "id='heading" + o + "' role='button'" +
    		    	  "data-toggle='collapse' data-parent='#accordion'" +
                      "href='#collapse" + o + "' aria-expanded='true'" +
                      "aria-controls='collapse" + o + "'>" +
                       "<h4 class='panel-title' title=\""+data[o]+"\" onclick=\"getinfo('"+o+"','"+data[o]+"')\">" +
                       "<i class='fa fa-plus'></i> " + o + "" +
                       "</h4>" +
                       "</div>" +
                       "<div id='collapse" + o + "'" +
                       "class='panel-collapse collapse '" +
                       "role='tabpanel' aria-labelledby='heading" + o + "'>";
       		     html +=  "	</div>" +
                            "</div>";
              }
     		 }  
     		   $("#accordion").append(html);
    	}); 
	} 
	



    $(function(){
    	ref();
   })
    function getinfo(mkbm,mkjs,key,value) {
    	$("#mkbm").val(mkbm);
    	$("#mkjs").val(mkjs);
    /* 	$("#key").val(key);
    	$("#value").val(value); */
    }	
    
    function savejson(){
    	var mkbm=$("#mkbm").val();
    	var mkjs=$("#mkjs").val();
    	var key=$("#key").val();
    	var value=$("#value").val();
    	 var url = '<%=basePath%>/s/langurejson/saveJson';
    	  $.ajax({
            type: "POST",
            url: tool.initParams(url),
            data: {mkbm:mkbm,mkjs:mkjs,key:key,value:value},
            dataType: "json",
            success: function (data) {
             if (data.res) {
             	 setTimeout('tool.alertSuccess("' + data.msg + '")', 100);
             	 ref();
             }else{
             	setTimeout('tool.alertError("操作失败!","' + data.msg + '")', 100);
             }
            }
            
            })
    }
    
     function addjson(){
     	$("#mkbm").val("");
    	$("#mkjs").val("");
    	$("#key").val("");
    	$("#value").val("");
     }
     
     function deljson(){
    	var mkbm=$("#mkbm").val();
    	var mkjs=$("#mkjs").val();
    	var key=$("#key").val();
    	var value=$("#value").val();
    	 var url = '<%=basePath%>/s/langurejson/deleteJson';
    	  $.ajax({
            type: "POST",
            url: tool.initParams(url),
            data: {mkbm:mkbm,mkjs:mkjs,key:key,value:value},
            dataType: "json",
            success: function (data) {
            if (data.res) {
             	 setTimeout('tool.alertSuccess("' + data.msg + '")', 100);
             	 ref();
             }else{
             	setTimeout('tool.alertError("操作失败!","' + data.msg + '")', 100);
             }
            }
            })
    }
</script>