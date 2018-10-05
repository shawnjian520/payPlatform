<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<form id="input-form" method="post" class="form-horizontal">

	<input type="hidden" id="menuid" name="menuid" value="${object.menuid}">
	<input type="hidden" id="upmenuid" name="upmenuid" value="${object.upmenuid}">
	<input type="hidden" id="depth" name="depth" value="${object.depth}">
    <div class="form-group">
        <label class="col-sm-2 control-label jdlanguage"  for="menuName">
            名称：
        </label>
        <div class="col-sm-9">
       	<input type="text"  placeholder="" class="form-control validate[required,maxSize[50]]" id="menuname" name="menuname" value="${object.menuname}">
            <span class="symbol required"></span>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label jdlanguage"  for="menuName">
            英文名称：
        </label>
        <div class="col-sm-9">
       <input type="text"  placeholder="" class="form-control" id="menunameforen" name="menunameforen" value="${object.menunameforen}">
            <span class="symbol required"></span>
        </div>
    </div>
    
    <div class="form-group hide">
        <label class="col-sm-2 control-label jdlanguage" for="subtitle">
            子标题：
        </label>

        <div class="col-sm-9">
             <input type="text"  placeholder="" class="form-control" id="subtitle" name="subtitle" value="${object.subtitle}">
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label jdlanguage"   for="menuPath">
            子节点：
        </label>
	
        <div class="col-sm-9">
           	<select id="nodeid" name="nodeid" class="form-control select2-auto" data-value="${object.nodeid}">
           		 <c:forEach items="${nodes}" var="n" varStatus="s">
           		 		<option  <c:if test="${object.nodeid==n.id}">selected="selected"</c:if> value="${n.id}">${n.caption}</option>
          		 </c:forEach>
           	</select>
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label jdlanguage"  for="menuPath">
            地址：
        </label>

        <div class="col-sm-9">
            <input type="text"  placeholder="" class="form-control validate[maxSize[200]]" id="menupath" name="menupath" value="${object.menupath}">
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label jdlanguage"   for="menuPath">
            排序值：
        </label>

        <div class="col-sm-9">
            <input type="text"  placeholder="" class="form-control validate[custom[positiveInteger],required,maxSize[6]]" id="ordernum" name="ordernum" value="${object.ordernum}">
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label jdlanguage"  for="menuicon">
            图标：
        </label>

        <div class="col-sm-9">
            <div class="input-group">
                <input type="text"  placeholder="" class="form-control validate[required]" id="menuicon" name="menuicon" value="${object.menuicon}">
                <span class="input-group-addon poi chose-icon" href="#icons" data-toggle="modal" data-localize="frame_menu.f" ><i class="fa fa-bars"></i></span>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" data-localize="frame_menu.g" >
            菜单状态：
        </label>
	
        <div class="col-sm-9">
            <label class="checkbox-inline">
                <input name="state" value="1" type="radio" class="mgr mgc-lg" <c:if test="${object.state==1}">
                       checked="checked" </c:if>>
               <font data-localize="frame_menu.h" > 启用</font>
            </label>
            <label class="checkbox-inline">
                <input name="state" value="0" type="radio" class="mgr mgc-lg" <c:if test="${object.state==0}">
                       checked="checked"  </c:if>>
                <font data-localize="frame_menu.i" > 禁用</font>
            </label>
        </div>
    </div>
    <div class="form-group hide">
        <label class="col-sm-2 control-label"  data-localize="frame_menu.j">
            所属分类：
        </label>

        <div class="col-sm-9" id="topStageMenu">

        </div>
    </div>
    <div class="form-group hide">
        <label class="col-sm-2 control-label">
            所属学段：
        </label>

        <div class="col-sm-9" id="leftStageMenu">

        </div>
    </div>
    <div class="form-group">
        <div class="col-md-offset-2 col-sm-9">
            <button type="button" class="btn btn-sm btn-success" onclick="page.saveMenu()">
                <font data-localize="frame_button.save">保存</font> <i class="fa fa-check"></i>
            </button>
          
            <button id="add-sub-menu" type="button"
                    class="btn btn-sm btn-success   <c:if test="${object.menuid==null||object.menuid==''}">dn</c:if>"
                    onclick="page.addSubMenu()">
              <font data-localize="frame_button.addnext">新增下级</font> <i class="fa fa-plus"></i>
            </button>
            <button id="del-menu" type="button"
                    class="btn btn-sm btn-success  <c:if test="${object.menuid==null||object.menuid==''}">dn</c:if>"
                    onclick="page.delMenu()">
               <font data-localize="frame_button.delete">删除</font> <i class="fa fa-times"></i>
            </button>
        </div>
    </div>

</form>
<script>
    subPage = {
        leftStageMenu: '${leftStageMenu}',
        topStageMenu: '${topStageMenu}',
        choseLeftStageMenu: '${object.leftStageMenu}',
        choseTopStageMenu: '${object.topStageMenu}',
        initStageMenu: function (data, $el, name,choseData) {
        	data = eval('('+data+')');
            if (data != null && data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    if (choseData.split(',').indexOf(data[i].id) > -1){
                        $el.append('<label class="checkbox-inline"><input name="' + name + '" type="checkbox" value="' + data[i].id + '" class="grey" checked>' + data[i].caption + '</label>');
                    }else{
                        $el.append('<label class="checkbox-inline"><input name="' + name + '" type="checkbox" value="' + data[i].id + '" class="grey">' + data[i].caption + '</label>');
                    }
                }
            }
            $el.parents('.form-group').removeClass('hide');
        }
    }
    $(document).ready(function () {
        $('.chose-icon').modal({"show": false});
        $("#icons li").off("click").click(function () {
            $("#menuicon").val($(this).find("i").attr("class"));
            $("#icons").modal('hide');
        });
        if (stageMenu) {
            subPage.initStageMenu(subPage.leftStageMenu, $('#leftStageMenu'), 'leftStageMenu',subPage.choseLeftStageMenu);
            subPage.initStageMenu(subPage.topStageMenu, $('#topStageMenu'), 'topStageMenu',subPage.choseTopStageMenu);
        }
    })
  
</script>
<script src="<%=basePath%>resources/js/language.js"></script>