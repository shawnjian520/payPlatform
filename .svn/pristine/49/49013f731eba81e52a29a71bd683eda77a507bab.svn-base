var jsonlanguage=parent.jsonlanguagemain;
var cookiename = "jdLanguage"; 
jQuery(function(){
	getUserChosoe();
}); 

function getUserChosoe(){
	var cname=getCookie(cookiename);
	  if (cname != ""&&cname!=null) {
		  $("#ddlSomoveLanguage").val(cname);
        if (cname == "en") {
      	  if(parent.jsonlanguagemain==null){
	        	  if(parent.jsonlanguage==null){
	        		  getjson();
	        		  parent.jsonlanguagemain=jsonlanguage;
	        		  parent.cookielang=cname;
	        	  }
      	  }
      	  localize();
        }
   }
}
/**
 * 修改标签
 */
function localize(){
	 $("[data-localize]").each(function(){
		 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
	 })
	  $('[placeholder]').each(function(){
       	var txt=valueforkey($(this).attr("placeholder"), jsonlanguage);
       	$(this).attr("placeholder",txt);
    })
    $(".jdlanguage").each(function(){
    	 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
    })
    $(".control-label").each(function(){
    	 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
		 if(attr==$.trim($(this).html())){
			 console.log(attr);
		 }
    })
    $("th").each(function(){
    	 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
		 if(attr==$.trim($(this).html())){
			 console.log(attr);
		 }
    })
    $("button").each(function(){
    	var at=$.trim($(this).html());
    	var attr=$.trim($(this).html().substring(0,$(this).html().indexOf("<")));
    	 $(this).html(valueforkey(attr,jsonlanguage));
    	 if(at==$.trim($(this).html())){
    		 console.log(attr);
    	 }
    })
    $("td .btn").each(function(){
    	 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
		 if(attr==$.trim($(this).html())){
			 console.log(attr);
		 }
    })
     $(".panel-title").each(function(){
    	 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
		 if(attr==$.trim($(this).html())){
			 console.log(attr);
		 }
    })
    
    $(".mt5").each(function(){
    	 var attr=$.trim($(this).html());
		 $(this).html(valueforkey(attr,jsonlanguage));
		 if(attr==$.trim($(this).html())){
			 console.log(attr);
		 }
    })
}

function getjson(){
	$.ajaxSettings.async = false;
	var dataroot=tool.procee+"s/langurejson/getJson"; 
	$.getJSON(dataroot, function(data){ 
		jsonlanguage=data;
	})
}
/**
 * 根据key得到value
 * @param key
 * @param data
 * @returns
 */
function valueforkey(key,data){
	 var keys, value, _i, _len;
     keys = key.split(/\./);
     value = data;
     for (_i = 0, _len = keys.length; _i < _len; _i++) {
       key = keys[_i];
       value = value != null ? value[key] : null;
     }
     return value;
	
}
/**
 * 设置Cookie
 * @param name
 * @param value
 */
function  SetCookie(name,value){   
	var Days = 30; //此 cookie 将被保存 30 天  
    var exp = new Date();    //new Date("December 31, 9998");  
    exp.setTime(exp.getTime() + Days*24*60*60*1000);  
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+";path=/";  
 }  
/**
 * 得到Cookie
 * @param name
 * @returns
 */
function getCookie(name)//取cookies函数     
{  
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
	if(arr != null) return unescape(arr[2]); return null;  
}  
/**
 * 修改语言
 */
function  chgLang() {  
    var value = $("#ddlSomoveLanguage").children('option:selected').val();
    SetCookie(cookiename,value);  
    location.reload();    
}
