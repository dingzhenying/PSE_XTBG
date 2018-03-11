$(document).ready(function(){
	$("#loginbtn").on("click",function(){
		if($("#userid").val()==null || $("#userid").val()==""){
			alert("用户名字不能为空");
			return false;
		}else if($("#password").val()==null || $("#password").val()==""){
			alert("用户密码不能为空");
			return false;
		}
	});
	
//	$("#addbtn").on("click",function(){
//		window.location.href=context+'/jsp/adduser-ls.jsp';
//	});
	$("#addbtn").click(function() {
	    $.dialog({
	        type: 'iframe',
	        url: 'adduser.jsp',
	        title: '注册',
	        width: 700,
	        height: 400,
	        onshow: function () {
	        },              
	        onclose: function () {
	            if(this.returnValue != ""){
	                eval("var str='"+JSON.stringify(this.returnValue)+"';");
	                $('#rtnValue').val(str);
	            }
	        },
	        oniframeload: function () {
	        }
	    });
	});
});