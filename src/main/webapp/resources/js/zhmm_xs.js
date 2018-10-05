//var compnent_list = new Array("userloginid", "userPawd", "u_v_i_c", "postButton");
var basePath = "";
var returnURL = "";
var compnent_list = new Array("userloginid", "userPawd", "postButton");
$(document).ready(function () {
    //document.getElementById("username").focus();
    //记住我，自动登录
    //var userloginid = getCookieValue("UHsTwUjda12jLk39");
    //if(userloginid!=null && userloginid!=''){
    //	$("#username").val(userloginid);
    //   $("#pwd").val(userloginid);//not empty
    //    ajaxLogin();//auto login
    //}
});

function ajaxzhmm() {
	if ($('#form-find').validationEngine('validate')) {
         $('.errorHandler').addClass('hide');
         $('#zhmmbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> 处理中...');
         $('#zhmmbutton').attr('disabled','disabled');
        zhmm_suc();
    }
}

function zhmm_suc( ) {
    var sfzh = document.getElementById("sfzh").value;
    var table = document.getElementById("table").value;
    
    $.post(basePath + 's/zhmm/zhmm', {'table': table,'sfzh':sfzh}, function (data) {
        var jsonarray = eval("(" + data + ")");
        var obj = jsonarray;
        if (obj.res == true) {//成功登录
        	window.location = obj.data.url;
        } else {
        	 $('.errorHandler').html(obj.msg).removeClass('hide').css('color','red');
	         $('#zhmmbutton').html('确定');
	         $('#zhmmbutton').removeAttr('disabled');
        }
    });
}

function ajaxreset() {
	if ($('#form-find').validationEngine('validate')) {
		$('.errorHandler').addClass('hide');
		$('#zhmmbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> 保存中...');
		$('#zhmmbutton').attr('disabled','disabled');
		reset_suc();
	}
}

function reset_suc( ) {
	var id = document.getElementById("id").value;
	var pwd = document.getElementById("pwd").value;
	var table = document.getElementById("table").value;
	var yzm = document.getElementById("yzm").value;
	$.post(basePath + 's/zhmm/savereset', {'pwd': pwd,'table':table,'yzm':yzm,'id':id}, function (data) {
		var jsonarray = eval("(" + data + ")");
		var obj = jsonarray;
		if (obj.res == true) {//成功登录
			alert("密码修改成功！");
			tourl();
		} else {
			 $('.errorHandler').html(obj.msg).removeClass('hide').css('color','red');
	         $('#zhmmbutton').html('确定');
	         $('#zhmmbutton').removeAttr('disabled'); 
		}
	});
}
function pwdeq(){
	var pwd = $('#pwd').val();
    var pwd1 = $('#pwd1').val();
    if(pwd1!='' && pwd!='' && pwd1!=pwd){
         return '2次输入的密码不一致';
    }
    return '';
}