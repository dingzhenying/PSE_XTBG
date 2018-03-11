//添加adduser.js文件，并赋值代码如下：
$(document).ready(function(){
	if(flags=="edit"){
		 $("#user_id").attr("readonly",true);
	}
	$("#saveBtn").on("click",function(){
		if($("#user_id").val()==null || $("#user_id").val()==""){
			alert("用户id不能为空");
			return false;
		}else if($("#user_name").val()==null || $("#user_name").val()==""){
			alert("用户名字不能为空");
			return false;
		}else if($("#user_password").val()==null || $("#user_password").val()==""){
			alert("用户密码不能为空");
			return false;
		}
		if(flags=="edit"){
			var url = context + "/service/demo1/user/update";
			saveForm.action = url;
			saveForm.method = "POST";
			saveForm.submit();
		}else{
			var url = context + "/service/demo1/user/adduser";
			saveForm.action = url;
			saveForm.method = "POST";
			saveForm.submit();
		};
		dialog.remove();
	});
	$("#returnBtn").on("click",function(){
		dialog.remove();
//		window.location.href=context+"/jsp/index.jsp";
	});
	$("#user_name").blur(function(){
		$.ajax({
			url:context+"/service/demo1/user/getUserByName?name="+$("#user_name").val(),
			type:"POST",
			success:function(data){
				if(data.userInfo!=null && userId=="null"){
					$("#saveBtn").attr("disabled", true);
					alert("用户已存在，请修改用户名");
				}else{
					$("#saveBtn").attr("disabled", false);
				}
			}
		});
	});
	$("#user_id").blur(function(){
		$.ajax({
			url:context+"/service/demo1/user/getUserById?userid="+$("#user_id").val(),
			type:"POST",
			success:function(data){
				if(data.userInfo!=null && userId=="null"){
					$("#saveBtn").attr("disabled", true);
					alert("ID已存在，请修改用户名");
				}else{
					$("#saveBtn").attr("disabled", false);
				}
			}
		});
	});
});

