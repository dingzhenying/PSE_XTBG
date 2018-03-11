//添加adduser.js文件，并赋值代码如下：
$(document).ready(function(){
	$("#user_id").attr("readonly",true);
	$("#saveBtn").on("click",function(){
		if($("#user_id").val()==null || $("#user_id").val()==""){
			alert("用户id不能为空");
			return false;
		}else if($("#plantime").val()==null || $("#plantime").val()==""){
			alert("时间不能为空");
			return false;
		}
		if(flags=="edit"){
			$("#dateDemo").attr("contenteditable",true)
			var url = context + "/service/demo1/job/update";
			saveForm.action = url;
			saveForm.method = "POST";
			saveForm.submit();
		}else{
			var url = context + "/service/demo1/job/addjob";
			saveForm.action = url;
			saveForm.method = "POST";
			saveForm.submit();
		}
	});
	$("#returnBtn").on("click",function(){
		window.location.href=context+"/jsp/userjob.jsp";
	});
	$('#dateDemo').datetimepicker({
	    container: $("#create-date"),
	    language: "zh-CN",
	    autoclose: 1,
	    startView: 2,
	    minView: 2,
	    format: "yyyy-mm-dd"
	});
	$("#plantime").blur(function(){		
		$('#dateDemo').datetimepicker('hide');
		
	});
	$("#plantime").change( function (event) {
	if(flags=="add"){			
		$.ajax({
				url:context+"/service/demo1/job/getplantime?plantime="+$("#plantime").val()+"&userid="+userId,
				type:"get",
				success:function(data){
					if(data.weekinfo=="fail"){
						$("#saveBtn").attr("disabled", true);
						alert("该天计划已创建，请修改时间");
					}else{
						$("#saveBtn").attr("disabled", false);
					}
				}
			});
		}else{
			$("#saveBtn").attr("disabled", false);
		}		
	});
});

