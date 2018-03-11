<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>新增用户</title>
			<!-- 引入css文件 -->
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/datatables.css">
			<!-- 引入js文件 -->
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/adduser.js"></script>
			<script type="text/javascript">
				var context = "<%=request.getContextPath()%>";
				var userId = "<%=request.getParameter("userid")%>";
				var flags = '${flags}';
			</script>
	</head>
	<body>
	<body>
		<div class="container" style="margin-top:60px;">
			<form id="saveForm" name="saveForm" class="form-horizontal pull-left" onsubmit="return false" style="width:600px;">
				<input name="id" value="${usersInfo.id}" type="hidden">
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">登录账号：</label>
					<div class="col-xs-9 col-md-9">
						<input id="user_id" name="userid" type="text" class="form-control" value="${usersInfo.userid}" placeholder="用户ID不能为空">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">姓名：</label>
					<div class="col-xs-9 col-md-9">
						<input id="user_name" name="username" type="text" class="form-control" value="${usersInfo.username }" placeholder="名字不能为空">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">密码：</label>
				<div class="col-xs-9 col-md-9">
					<input id="user_password" name="password" type="password"
						class="form-control" value="${usersInfo.password }"
						placeholder="密码不能为空">
				</div>
			</div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">上级ID：</label>
					<div class="col-xs-9 col-md-9">
						<input id="sj_id" name="sj_id" type="text" class="form-control" value="${usersInfo.sj_id}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label"></label>
					<div class="col-xs-9 col-md-9">
						<button type="button" class="btn btn-primary" id="saveBtn">保存</button>
						<button type="button" class="btn" id="returnBtn">返回</button>
					</div>
				</div>
			</form>
		</div>
	</body>
	
</html>