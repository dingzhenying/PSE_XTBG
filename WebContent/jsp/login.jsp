<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登陆界面</title>
   		<!-- 引入css文件 -->
   		<link rel="stylesheet" href= "<%=request.getContextPath()%>/skin/css/style.css" type="text/css"/> 
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/datatables.css">
		<!-- 引入js文件 -->
<script type="text/javascript"src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/skin/js/bootstrap.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/skin/js/ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/login.js"></script>
		<script type="text/javascript">
			var context = "<%=request.getContextPath()%>";
		</script>
  </head>
  
  <body>
  <div class="body">
	  <div class="div_table">
	   <form role="form" action="<%=request.getContextPath()%>/service/demo1/user/login" method="post" class="form">  
		   <table  class="table table-striped table-bordered table-hover">
		   	   <tr class="success">
		   	   	<th colspan="2" style="padding-left: 10px;"><h3>PSE 协同办公系统</h3></th>
		   	   </tr>
			   <tr >
				   <td style="padding:10px;"><h5>管理员账户：</h5></td>
				   <td style="padding: 10px;"><input style="float: left;  width: 200px;" type="text" id="userid" name="userid" placeholder="请输入用户名:root" class="form-control">
				   <font color="red"><h5> ${data.msname}</h5></font>
				   </td>
			   </tr>
			   <tr> 
				   <td style="padding:10px;"><h5>管理员密码：</h5></td>
				   <td  style="padding:10px;"><input style="float: left; width: 200px;" type="password"  id="password" name="password" placeholder="请输入密码:1234" class="form-control">
				    <font color="red"><h5> ${data.mspassword}</h5></font>
				   </td>
			   </tr>
			   <tr style="text-align: center;" >
			   		<td colspan="2">
			   		<div class="button">
			   		<div ><input  class="btn btn-success " type="submit" value="登陆" id="loginbtn"></div>
			   		<div ><input class="btn btn-infor" type="button" value="注册" id="addbtn"></div>
			   		<div ><input class="btn btn-infor" type="reset" value="重置" ></div>
			   		</div>			   		
			   		</td>
			   </tr>
		   </table>
	   </form>
	   </div>
   </div> 
  </body>
</html>
  