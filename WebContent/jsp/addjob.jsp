<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>新增用户</title>
			<!-- 引入css文件 -->
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/font-awesome.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/form.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/ui.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/datatables.css">
			<!-- 引入js文件 -->
			<script type="text/javascript">
				var context = "<%=request.getContextPath()%>";
				var userId = "<%=request.getParameter("userid")%>";
				var flags = '${flags}';
			</script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/bootstrap.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/form.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/ui.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/addjob.js"></script>
	</head>
	<body>
	<body>
		<div class="container" style="margin-top:60px;">
			<form id="saveForm" name="saveForm" class="form-horizontal pull-left" onsubmit="return false" style="width:600px;">
				<input name="id" value="${usersInfo.id}" type="hidden">
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">用户ID：</label>
					<div class="col-xs-9 col-md-9">
						<input id="user_id" name="userid" type="text" class="form-control" value="${usersInfo.userid}" placeholder="用户ID不能为空">
					</div>
				</div>
				<div class="form-group">
			        <label for="date" class="col-sm-3 control-label">创建日期</label>
			        <div class="col-sm-9">
			            <div class="input-group date" id="dateDemo">
			                <div id="create-date">
			                    <input type="text" id="plantime" class="form-control ue-form" name="plantime" style="height: 35px" value="${usersInfo.plantime}" placeholder="日期不能为空"/>			                	
			                </div>
			                <span class="input-group-addon ue-form-btn">
			                    <i class="fa fa-calendar"></i>
			                </span>
			            </div>
			        </div>
			    </div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">上午计划：</label>
					<div class="col-xs-9 col-md-9">
						<input id="job_zao" name="job_zao" type="text" class="form-control" value="${usersInfo.job_zao}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">下午计划：</label>
					<div class="col-xs-9 col-md-9">
						<input id="job_zhong" name="job_zhong" type="text" class="form-control" value="${usersInfo.job_zhong}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 col-md-3 control-label">晚上计划：</label>
					<div class="col-xs-9 col-md-9">
						<input id="job_wan" name="job_wan" type="text" class="form-control" value="${usersInfo.job_wan}">
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