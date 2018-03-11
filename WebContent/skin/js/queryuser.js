var oTable;
$(document).ready(function(){

	//初始化表格
	initTable();

	$("#addusers").on("click",function(){
		window.location.href=context+"/jsp/adduser.jsp";
	});
	
	//搜索用户
	$("#search").on("click",function(){
		var tmp = $("#searchVal").val();
		query(tmp);

	});
	
	//回车查询事件
	$("#searchVal").keydown(function(event) {
		if (event.keyCode == 13) {
			var srcName = $("#searchVal").val();
			query(srcName);
		}
	});
});

function initTable(){
	oTable = $("#userList").dtable({
					//显示“正在加载”的图标
					"processing":true,
					"ajax":context + "/service/demo1/user/findAll",
					"serverSide":true,
					"bPaginate": false,
					"ordering":false,
					"columns":[
						{"data":"userid"},
						{"data":"username"},
						{"data":"password"},
						{"data":"sj_id"},
						{"data":"id"}
					],
					"columnDefs":[
						{
							"targets":4,
							"data":"id",
							"render":function(data,type,full){
								return '<div><a id="edit" onclick="forUpdate('+"'"+ full.userid+ "'"+')" href="#">编辑</a>'+'<span>&nbsp;&nbsp</span>'
								+'<a id="del" onclick="del('+"'"+ full.userid+ "'"+')" href="#">删除</a></div>'
							}
						}
					]
				});
		return oTable;
}

//查询
function query(userid){
	if ((userid == "" || userid == null)) {
		oTable.ajax.url(context + "/service/demo1/user/findAll").load();
	} else {
		var url=context + "/service/demo1/user/findOne?userid=" + userid;
		oTable.ajax.url(url).load();
	}
}

//删除用户信息
function del(userid){
	$.ajax({
		url:context+"/service/demo1/user/del?userid="+userid,
		type:"get",
		async:false,
		success:function(){
			oTable.ajax.url(context + "/service/demo1/user/findAll").load();
		},
		error:function(data){
		alert(data);
	}
	});
}

//编写用户信息
function forUpdate(userid){
	window.location.href=context+"/service/demo1/user/edits?userid="+userid;
}
