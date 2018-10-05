<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<div class="col-md-12">
    <h3>
        设置开启年度信息
    </h3>
    <hr>
    <form role="form" class="form-horizontal">
		<input type="hidden" name="lcid" value="${lcid }" />
		<div class="row">
    <div class="col-md-12">

        <a class="btn btn-sm btn-success" onclick="pagelog.addData(this)">
            新增 <i class="fa fa-plus"></i>
        </a>
    </div>
</div>
        <div class="dataTables_wrapper form-inline">
		    <table class="table table-striped table-hover dataTable table-bordered table-order" id="table_log_lc">
		        <thead>
		        <tr>
		            <th>年度</th>
		            <th>学期</th>
		            <th>条件</th>
		            <th>描述</th>
		            <th>开启时间</th>
		            <th>操作</th>
		        </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${resultData}" var="obj" varStatus="sta">
		            <tr >
		                   <td>
		                   	<input type="hidden"  name="list[${sta.index }].wid" value="${obj.wid}"/>
		                   	<input type="text"  class="validate[maxSize[4],minSize[4]] form-control" style="width: 80px;" name="list[${sta.index }].nd" value="${obj.nd}"/>
		                   </td>
		                   <td>
		                   	<select class=" form-control select2-code"  zdlb="xq" name="list[${sta.index }].jd" value="${obj.jd}"/>
		                   </td>
		                   <td>
		                   	<input type="text"  class="validate[required] form-control" name="list[${sta.index }].con" value="${obj.con}"/>
		                   </td>
		                   <td>
		                   <input type="text"  class="validate[required] form-control" name="list[${sta.index }].conMs" value="${obj.conMs}"/>
		                   </td>
		                   <td>
		                   <fmt:formatDate value="${obj.kssj }" var="kssj"/>
		                   <fmt:formatDate value="${obj.jssj }" var="jssj"/>
		                   <input type="text"  class=" form-control" data-element-type="datetimepicker" style="width: 100px;" name="list[${sta.index }].kssj_str" value="${kssj}"/>
		                   -<input type="text"  class=" form-control" data-element-type="datetimepicker" style="width: 100px;" name="list[${sta.index }].jssj_str" value="${jssj}"/>
		                   </td>
		                   <td>
		                   <a class="btn btn-sm btn-success" onclick="$(this).parent().parent().remove()">
					            删除<i class="fa fa-times"></i>
					        </a>
		                   </td>
		            </tr>
		        </c:forEach>
		        </tbody>
		    </table>
		</div>
        <input type="hidden" id="num" name="num" value="${num }"/>
        <div class="form-group">
            <div class="col-md-offset-2 col-sm-9">
                <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                    保存 <i class="fa fa-check"></i>
                </button>
            </div>
        </div>
    </form>
</div>
<%@include file="../../common/input-bottom.jsp" %>
<script>
   var pagelog={
	   addData:function(el){
		   var num = $('#num').val();
		   $('#table_log_lc').find('tbody').append(' <tr >'+
				   ' <td>'+
				   '<input type="hidden"  name="list['+num+'].wid" value=""/>'+
				   '  	<input type="text"  class="validate[maxSize[4],minSize[4]] form-control" style="width: 80px;" name="list['+num+'].nd" value=""/>'+
				   ' </td>'+
				   ' <td>'+
				   '  	<select class=" form-control select2-code"  zdlb="xq" name="list['+num+'].jd" value=""/>'+
				   ' </td>'+
				   ' <td>'+
				   '  	<input type="text"  class="validate[required] form-control" name="list['+num+'].con" value=""/>'+
				   ' </td>'+
				   ' <td>'+
				   '  <input type="text"  class="validate[required] form-control" name="list['+num+'].conMs" value=""/>'+
				   '  </td>'+
				   '<td>'+
				   ' <input type="text"  class=" form-control" data-element-type="datetimepicker" style="width: 100px;" name="list['+num+'].kssj_str" />'+
		           '        -<input type="text"  class=" form-control" data-element-type="datetimepicker" style="width: 100px;" name="list['+num+'].jssj_str" />'+
				   '</td>'+
				   '  <td>'+
				   '   <a class="btn btn-sm btn-success" onclick="$(this).parent().parent().remove()">'+
				   '       删除<i class="fa fa-times"></i>'+
				   '   </a>'+
				   '  </td>'+
				   '   </tr>');
		   $('#num').val(num+1);
		   initselectcode();
		   pagelog.inifresh();
		   var $datetimepicker = $('#table_log_lc').find('tbody').find('tr:last').find("input[data-element-type='datetimepicker']");
	        if ($datetimepicker.length) {
	            $datetimepicker.each(function () {
	                var el = $(this);
	                var format = el.attr("data-format");
	                var minDate = el.attr("data-minDate");
	                var maxDate = el.attr("data-maxDate");
	                if (isBlank(format)) {
	                    format = "YYYY-MM-DD";
	                }
	                el.datetimepicker({
	                    format: format,
	                    minDate: minDate,
	                    maxDate: maxDate
	                });
	            });
	        }
	   },
	   inifresh:function(){
			$('#table_log_lc').find('tr').each(function(){
				$(this).find('input,select').each(function(i){
					if(i==1 || i==2){
						$(this).change(function(){
							var nd = $(this).parents('tr').find('input').eq(1).val();
							var xq = $(this).parents('tr').find('select:first').val();
							var tel = /^\s*$/;
							var con = '';
							var conMs = '';
							var nd_old = 'nd';
							var xq_old = 'xq';
							var con_old = $(this).parents('tr').find('input').eq(2).val();
							if(con_old!=null && con_old!=''&& !tel.test(con_old)){
								if(con_old.indexOf(' and ')!=-1){
									nd_old = con_old.split(' and ')[0];
									xq_old = con_old.split(' and ')[1];
									nd_old = nd_old.substring(0,nd_old.indexOf('=')).trim();
									xq_old = xq_old.substring(0,xq_old.indexOf('=')).trim();
								}else{
									con_old = con_old.substring(0,con_old.indexOf('=')).trim();
									if(nd!=null && nd!='' && !tel.test(nd) && xq!=null && xq!='' && !tel.test(xq)){
										if($(this).attr('name').indexOf('nd')!=-1){
											xq_old = con_old;
										}else{
											nd_old= con_old;
										}
									}else{
										if($(this).attr('name').indexOf('nd')!=-1){
											nd_old = con_old;
										}else{
											xq_old= con_old;
										}
									}
								}
							}
							if(nd!=null && nd!='' && !tel.test(nd)){
								con = nd_old+'=\''+nd+'\''
								conMs = nd+'年';
							}
							if(xq!=null && xq!='' && !tel.test(xq)){
								if(con!='') con += ' and ';
								con += xq_old+'=\''+xq+'\' '
								if(xq=='1') conMs += '秋季学期';
								if(xq=='2') conMs += '春季学期';
							}
							$(this).parents('tr').find('input').eq(2).val(con);
							$(this).parents('tr').find('input').eq(3).val(conMs);
						});
					}
					
				});
			});
	   }
   }
   $(function(){
	   pagelog.inifresh();
   });
</script>