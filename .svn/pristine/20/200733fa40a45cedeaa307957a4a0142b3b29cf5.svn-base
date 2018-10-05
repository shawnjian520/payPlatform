<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<% String basePath = request.getContextPath(); %>

<div class="col-md-10 col-md-offset-1">
    <h3>
        替换辅导员
    </h3>
    <hr>
    <form role="form" class="form-horizontal">
        <input type="hidden" id="wid" name="wid" value="${wid }"/>

        <div class="form-group">
            <label class="col-sm-2 control-label">
                请选择替换辅导员：
            </label>

            <div class="col-sm-10">
                <c:forEach items="${list }" var="obj">
                    <label class="radio-inline">
                        <input type="radio" class="validate[required] grey" value="${obj.departid }" name="departid"
                               id="departid"/>${obj.departname }
                    </label>
                </c:forEach>
            </div>
        </div>
        <div class="form-group" id="aa">
            <div class="col-md-offset-2 col-sm-9">
                <button class="btn btn-sm btn-success" type="button" onclick="savechangge(this)">
                    替换 <i class="fa fa-check"></i>
                </button>
            </div>
        </div>
    </form>
    <%@include file="../../common/input-bottom.jsp" %>
    <script type="text/javascript">
        function savechangge(el) {
            $('#aa').css('display', 'none');
            var id = $('#wid').val();
            var departid = $('input[name="departid"]:checked').val();
            if (departid == null || departid == '') {
                alert("请选择一个辅导员");
                $('#aa').css('display', '');
                return false;
            }
            $.post(tool.initParams('<%=basePath%>/s/system/sysbj/saveedit'), {
                'wid': id,
                'departid': departid
            }, function (data) {
                if (data == 'SUCCESS') {
                    alert('替换成功！');
                } else {
                    alert(data);
                }
            });
        }
    </script>

</div>