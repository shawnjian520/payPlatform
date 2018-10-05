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

function ajaxLogin() {
	if ($('#form-login').validationEngine('validate')) {
        $('.errorHandler').addClass('hide');
        $('#loginbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> <font>登录中...</font>');
        $('#loginbutton').attr('disabled','disabled');
        login_suc();
    }
}

function login_suc( ) {
    var userloginid = document.getElementById("userloginid").value;
    userloginid = userloginid.replace(/\s+/,'');
    var userpwd = document.getElementById("userpwd").value;
    var u_v_i_c ='';
    if(document.getElementById("yzm")) u_v_i_c = document.getElementById("yzm").value;
    $.post(basePath + 'identity/ajaxlogin.action', {
        'act': 'loginxs',
        'table': document.getElementById("table").value,
        'tsysUser.userloginid': userloginid,
        'tsysUser.userpwd': userpwd,
        'u_v_i_c': u_v_i_c
    }, function (data) {
        var jsonarray = eval("(" + data + ")");
        var obj = jsonarray;
        if (obj.msg == 'success') {//成功登录
//	    		if($("#sfjzdlzt[checked]")[0]){//记住我
//	    			var exp = new Date(); 
//	    			exp.setTime(exp.getTime() + 10*365*24*60*60*1000);//10年
//	    			document.cookie = "userLoginId="+userLoginId+";path=/;expires="+exp.toGMTString();
//	    			document.cookie = "userPawd="+userPawd+";path=/;expires="+exp.toGMTString();
//	    		}
            var returl = $('#returl').val();
            if (returl == null || returl == '') {
               if(document.getElementById("table").value=='gx') returl = basePath + 'identity/indexgx.action';
               if(document.getElementById("table").value=='xfbc') returl = basePath + 'identity/indexxfbc.action';
               if(document.getElementById("table").value=='gz') returl = basePath + 'identity/indexgz.action';
               if(document.getElementById("table").value=='jdlk') returl = basePath + 'identity/indexjdlk.action';
            }
            window.location.href = returl;
        } else {
        	errortit(obj);
        	changeyzm();
        }
    });
}
function changeyzm() {
    $('#img_u_v_i_c').attr('src', basePath+'/generateImage/u_v_i_c?aaa=' + new Date());
}
function ys_onkeydown(num, event) {
    if (num == 0 && (event.keyCode == 13 )) {
        document.getElementById("userpwd").focus();
    } else if (num == 1 && (event.keyCode == 13 )) {
        document.getElementById("yzm").focus();
    } else if (num == 2 && (event.keyCode == 13 )) {
        ajaxLogin();
    }
}

function pwdeq(){
	var pwd = $('#pwd').val();
    var pwd1 = $('#pwd1').val();
    if(pwd1!='' && pwd!='' && pwd1!=pwd){
         return '2次输入的密码不一致';
    }
    return '';
}
function ajaxRegister(){
	if ($('#form-login').validationEngine('validate')) {
        $('.errorHandler').addClass('hide');
        $('#loginbutton').html('注册登录中...');
        $('#loginbutton').attr('disabled','disabled');
        
        $.post(basePath + 'identity/ajaxlogin.action',$("#form-login").serialize(),function(data){
				 var jsonarray = eval("(" + data + ")");
	            var obj = jsonarray;
	            if (obj.msg == 'success') {//成功登录
	            	 $.post(basePath + 'identity/ajaxlogin.action', {
	            	        'act': 'loginxs',
	            	        'table': document.getElementById("table").value,
	            	        'tsysUser.userloginid': document.getElementById("sfzh").value,
	            	        'tsysUser.userpwd': document.getElementById("pwd").value,
	            	        'u_v_i_c': document.getElementById("u_v_i_c").value
	            	    }, function (data) {
	            	        var jsonarray = eval("(" + data + ")");
	            	        var obj = jsonarray;
	            	        if (obj.msg == 'success') {//成功登录
//	            		    		if($("#sfjzdlzt[checked]")[0]){//记住我
//	            		    			var exp = new Date(); 
//	            		    			exp.setTime(exp.getTime() + 10*365*24*60*60*1000);//10年
//	            		    			document.cookie = "userLoginId="+userLoginId+";path=/;expires="+exp.toGMTString();
//	            		    			document.cookie = "userPawd="+userPawd+";path=/;expires="+exp.toGMTString();
//	            		    		}
	            	            var returl = $('#returl').val();
	            	            if (returl == null || returl == '') {
	            	            	if(document.getElementById("table").value=='gx') returl = basePath + 'identity/indexgx.action';
	            	            	if(document.getElementById("table").value=='xfbc') returl = basePath + 'identity/indexxfbc.action';
	            	                if(document.getElementById("table").value=='gz') returl = basePath + 'identity/indexgz.action';
	            	            }
	            	            window.location.href = returl;
	            	        } else {
	            	        	errortit(obj);
	            	        	changeyzm();
	            	        }
	            	    });
	            } else {
	            	errortit(obj);
	            	changeyzm();
	            }
	    });
        
    }
}
function chgxxbm_gx(tt){
	var xxbm = $(tt).val();
	if(xxbm==''){
		$('#yxbm').html('');
	}else{
		$.post(basePath+'s/ajax/getDepartByUpdepartid',{'updepartid':xxbm},function(data){
			var htm = '<option value="" selected="selected">请选择</option>';
			$(data).each(function(i){
				htm += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			});
			$('#yxbm').html(htm);
		});
	}
	$('#fdybm').html('');
	$('#bjbm').html('');
}
function chgyxbm_gx(tt){
	var yxbm = $(tt).val();
	if(yxbm==''){
		$('#fdybm').html('');
	}else{
		$.post(basePath+'s/ajax/getDepartByUpdepartid',{'updepartid':yxbm},function(data){
			var htm = '<option value="" selected="selected">请选择</option>';
			$(data).each(function(i){
				htm += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			});
			$('#fdybm').html(htm);
		});
	}
	$('#bjbm').html('');
}
function chgfdybm_gx(tt){
	var fdybm = $(tt).val();
	if(fdybm==''){
		$('#bjbm').html('');
	}else{
		$.post(basePath+'s/ajax/getBjByFdy',{'fdybm':fdybm},function(data){
			var htm = '<option value="" selected="selected">请选择</option>';
			$(data).each(function(i){
				htm += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			});
			$('#bjbm').html(htm);
		});
	}
}
function chgbjbm_gx(tt){
	var bjbm = $(tt).val();
	if(bjbm==''){
		$('#zybm').val('');
		$('#zymc').val('');
	}else{
		$.post(basePath+'s/ajax/getZyByBj',{'bjbm':bjbm},function(data){
			$('#zybm').val(data[0].id);
			$('#zymc').val(data[0].caption);
		});
	}
}
function chgshi_gz(tt,departtype){
	var shi = $(tt).val();
	if(shi==''){
		$('#xian').html('');
		$.post(basePath+'s/ajax/getDepartByUpdepartid',{'updepartid':'100000001','departtype':'05'},function(data){
			var htm = '<option value="" selected="selected">请选择</option>';
			$(data).each(function(i){
				htm += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			});
			$('#xxbm').html(htm);
		});
	}else{
		$.post(basePath+'s/ajax/getDepartByUpdepartid',{'updepartid':shi,'departtype':departtype},function(data){
			var htm = '<option value="" selected="selected">请选择</option>'
					+'<option value="'+shi+'" >'+$(tt).find('option:checked').text()+'直属</option>';
			$(data).each(function(i){
				htm += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			});
			$('#xian').html(htm);
		});
		$('#xxbm').html('');
	}
}
function chgxian_gz(tt,departtype){
	var xian = $(tt).val();
	if(xian==''){
		$('#xxbm').html('');
	}else{
		$.post(basePath+'s/ajax/getDepartByUpdepartid',{'updepartid':xian,'departtype':departtype},function(data){
			var htm = '<option value="" selected="selected">请选择</option>';
			$(data).each(function(i){
				htm += '<option value="'+data[i].id+'">'+data[i].caption+'</option>';
			});
			$('#xxbm').html(htm);
		});
	}
}