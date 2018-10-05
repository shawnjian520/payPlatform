<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<jsp:include page="../../../common/portals-header.jsp"></jsp:include>
<title>作用域测试</title>
<div class="container">
    <div class="row">
        <a href="javascript:void(0)" onclick="loadPage1()">加载页面2</a></br>
        <a href="javascript:void(0)" onclick="loadPage2()">加载页面3</a></br>
        <a href="javascript:void(0)" onclick="Main.init()">Main.init</a></br>

    </div>
    <div id="ajax-content">

    </div>
</div>
<jsp:include page="../../../common/portals-bottom.jsp"></jsp:include>
<script>
    //Main Object here
    var Main = {};
    //App Object here
    var App = {};
    Main.init = function (){
        alert('Main init.');
    }
    App.init = function (){
        alert('App init.');
    }
    $(document).ready(function () {
//        Main.init();
    });
    function loadPage1(){
        $.ajax({
            url: 'http://192.168.0.145:8080/traffic/s/scopes2',
            cache: false,
            type: 'post',
            dataType: 'html',
            timeout: 1000 * 10,
            error: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            success: function (data) {
                $('#ajax-content').html(data);
            }
        });
    }
    function loadPage2(){
        $.ajax({
            url: 'http://192.168.0.145:8080/traffic/s/scopes3',
            cache: false,
            type: 'post',
            dataType: 'html',
            timeout: 1000 * 10,
            error: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            success: function (data) {
                $('#ajax-content').html(data);
            }
        });
    }
    function loadPage3(){

    }

</script>
</body>
</html>