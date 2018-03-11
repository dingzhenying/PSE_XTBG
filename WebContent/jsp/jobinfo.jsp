<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户全天计划详情</title>
			<!-- 引入css文件 -->
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/font-awesome.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/form.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/ui.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/datatables.css">
			<!-- 引入js文件 -->
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/bootstrap.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/form.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/ui.js"></script>
			<script type="text/javascript">
				var context = "<%=request.getContextPath()%>";
				var userId = "<%=request.getParameter("userid")%>";
				var flags = '${flags}';
			</script>
	</head>
	<body>
	<body>
		<div class="container">
			<form id="saveForm" name="saveForm" class="form-horizontal pull-left" onsubmit="return false" style="width:600px;">
				<input name="id" value="${usersInfo.id}" type="hidden">
				<div class="form-group">
					<label class="col-xs-2 control-label">用户ID：</label>
					<div class="col-xs-9 col-md-9">
						<input id="user_id" name="userid" class="form-control ue-form" value="${usersInfo.userid}" readonly="true">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">创建日期：</label>
					<div class="col-xs-9 col-md-9">
						<input id="plantime" name="plantime" class="form-control ue-form" value="${usersInfo.plantime}" readonly="true">
					</div>
			    </div>
				<div class="form-group">
					<label class="col-xs-2 control-label">上午计划：</label>
					<div class="col-xs-9 col-md-9">
						<textarea id="job_zao" name="job_zao" class="form-control ue-form" rows="3" readonly="true">${usersInfo.job_zao}</textarea>	
					</div>		
				</div>

				<div class="form-group">
					<label class="col-xs-2 control-label">下午计划：</label>
					<div class="col-xs-9 col-md-9">
						<textarea id="job_zhong" name="job_zhong" class="form-control ue-form" rows="3" readonly="true">${usersInfo.job_zhong}</textarea>	
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">晚上计划：</label>
					<div class="col-xs-9 col-md-9">
						<textarea id="job_wan" name="job_wan" class="form-control ue-form" rows="3" readonly="true">${usersInfo.job_wan}</textarea>	
					</div>
				</div>
			</form>
		</div>
	</body>
	
</html>