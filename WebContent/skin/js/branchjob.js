var oTable;
var week1=getWeekOfYear();

$(document).ready(function(){
	$("#showweek").val(week1);
	//初始化表格
	initTable();
	
	//搜索用户
	$("#search").on("click",function(){
		var week = $("#searchVal").val();
		if(1<=week&&week<=53){
			week1=week;
			query(week);
			$("#showweek").val(week1);
		}else{
			$.dialog({
		        type: 'alert',
		        content: '查询日期超出范围！'
		    });
		}
		
	});
	
	//回车查询事件
	$("#searchVal").keydown(function(event) {
		if (event.keyCode == 13) {
			alert(event.keyCode);
			var week = $("#searchVal").val();
			week1=week;
			query(week);
			$("#showweek").val(week1);
			}
		});
	
	//上一周计划
	$("#lastweek").on("click",function(){
		if( week1>1){
			week1--;
			var lastweek = week1;
			LastWeek(lastweek);
			$("#showweek").val(week1);
			
		}else{
			$.dialog({
		        type: 'alert',
		        content: '查询日期超出范围！'
		    });	
			
		}
	});

	//下一周计划
	$("#nextweek").on("click",function(){
		if( week1<53){
			week1 ++;
			var nextweek = week1;
			NextWeek(nextweek);
			$("#showweek").val(week1);
		}else{
			$.dialog({
		        type: 'alert',
		        content: '查询日期超出范围！'
		    });
			
		}
		
	});

	
	});


function initTable(){
	oTable = $("#userList").dtable({
					//显示“正在加载”的图标
					"processing":true,
					"ajax":context + "/service/demo1/job/findPlan?userid="+branchuser+"&week="+week1,
					"serverSide":false,//服务器分页
					"bPaginate": true,//翻页功能
					"ordering":false,//排序按钮	
					"iDisplayLength" : 7,  //默认每页显示多少条记录  
					"bLengthChange": false, //改变每页显示数据数量  
					"bFilter": true, //过滤功能  
					"bSort":true, //排序功能  
					"bInfo": true,//页脚信息  
					"bAutoWidth": true,//自动宽度  
					"columns":[
						{"data":"weekday"},
						{"data":"userid"},
						{"data":"plantime"},
						{"data":"day"},
						{"data":"week"},
						{"data":"job_zao"},
						{"data":"job_zhong"},
						{"data":"job_wan"},
						{"data":"id"},	
					],

					"columnDefs":[
						  {
								"targets":0,
								"data":"weekday",
								"render":function(data,type,full){
									if(full.weekday !="" || full.weekday != null){
										var week1=String(data).replace("7","日").replace("1","一").replace("2","二").replace("3","三").replace("4","四").replace("5","五").replace("6","六")//就是你要的星期几
										var week="星期"+week1;
									}else{
										
									}
									return week;
								}
						  },
						  {
								"targets":3,
								"data":"day",
								"visible": false, 
								"render":function(data,type,full){
									if(full.day !="" || full.day != "null"){
										var week1=String(data).replace("7","日").replace("1","一").replace("2","二").replace("3","三").replace("4","四").replace("5","五").replace("6","六")//就是你要的星期几
										var week="星期"+week1;
									}
									return week;
								}
						  },
						{
							"targets":8,
							"data":"id",
							"render":function(data,type,full){
								return '<div><a id="edit" onclick="lookinfo('+"'"+ full.id+ "'"+')" href="#">查看</a></div>'
							}
						}
					]
					
				});
		return oTable;
}

//查看详情
function lookinfo(id){
	
	if(id!= "null"){
	    $.dialog({
	        type: 'iframe',
	        url: context+'/service/demo1/job/userinfo?id='+id,
	        title: '计划详情',
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
	    })
	    
	}else{
		$.dialog({
	        type: 'alert',
	        content: '当前日期未建计划'
	    });

	}
	
}

//查询按钮
function query(week){
	if ((week == "" || week == null)) {
		week=getWeekNumber();
		oTable.ajax.url(context + "/service/demo1/job/findPlan?userid="+branchuser+"&week="+week).load();
		return week1=week;
	} else {
		var url=context + "/service/demo1/job/findPlan?userid="+branchuser+"&week="+week;
		oTable.ajax.url(url).load();
	}
}



//获取上一周时间
function LastWeek(lastweek){
	var url=context + "/service/demo1/job/findPlan?userid="+branchuser+"&week="+lastweek;
	oTable.ajax.url(url).load();
}
//获取下一周时间
function NextWeek(nextweek){
	var url=context + "/service/demo1/job/findPlan?userid="+branchuser+"&week="+nextweek;
	oTable.ajax.url(url).load();
}


//获取当前日期的周
/**
 * 判断年份是否为润年
 *
 * @param {Number} year
 */
function isLeapYear(year) {
    return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
}
/**
 * 获取某一年份的某一月份的天数
 *
 * @param {Number} year
 * @param {Number} month
 */
function getMonthDays(year, month) {
    return [31, null, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month] || (isLeapYear(year) ? 29 : 28);
}26 
/**
 * 获取某年的某天是第几周
 * @param {Number} y
 * @param {Number} m
 * @param {Number} d
 * @returns {Number}
 */
function getWeekNumber() {
    var now = new Date(),
        year = now.getFullYear(),
        month = now.getMonth(),
        days = now.getDate();
    //那一天是那一年中的第多少天
    for (var i = 0; i < month; i++) {
        days += getMonthDays(year, i);
    }
    //那一年第一天是星期几
    var yearFirstDay = new Date(year, 0, 1).getDay() || 7;
    var week = null;
    if (yearFirstDay == 1) {
        week = Math.ceil(days / yearFirstDay);
    } else {
        days -= (7 - yearFirstDay + 1);
        week = Math.ceil(days / 7) + 1;
    }
    return week;
}

function getWeekOfYear(){
	  var today = new Date();
	  var firstDay = new Date(today.getFullYear(),0, 1);
	  var dayOfWeek = firstDay.getDay(); 
	  var spendDay= 1;
	  if (dayOfWeek !=0) {
	    spendDay=7-dayOfWeek+1;
	  }
	  firstDay = new Date(today.getFullYear(),0, 1+spendDay);
	  var d =Math.ceil((today.valueOf()- firstDay.valueOf())/ 86400000);
	  var result =Math.ceil(d/7);
	  return result+1;
}
