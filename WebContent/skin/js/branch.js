
  var editFlag = "";
  var oldPNodeIdforDrag;
  $(document).ready(function(){
  	// 初始化模块树
  	initTree();
  });
  

 function initTree(){
 	
 	var setting = {
 			view: {
 				addHoverDom:null,//用于当鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
 												//请务必与 setting.view.removeHoverDom 同时使用；属于高级应用，使用时请确保对 zTree 比较了解。
 												//默认值：null
 				removeHoverDom: null,
 				selectedMulti: false//是否允许同时选中多个节点
 				},
 			edit: {
 				drag : {
 					isCopy : false,
 					isMove : true
 				},
 				//添加编辑树功能
 				enable: true,
 				//移除ztree自带编辑及删除按钮
 				showRenameBtn:false,
 				showRemoveBtn:false,
 				//双击是否打开子目录
 				dblClickExpangd:true
 			},
 			data: {
 				key: {
 					name: "username"
 				},
 				simpleData: {
 					enable: true
 				}
 			},
 			async: {
 				enable: true,
 				url: context +"/service/organ/getAllNodes",
 				//当点击节点的时候自动提交的数据
 				autoParam:["userid"],
 				dataFilter: datafilter
 			},
 			callback:{
 				onClick: clickHandler,
 				beforeAsync: beforeAsync,		
 			}
 			
 		};
 	
 	/**记录原始的父节点ID，拖拽失败时恢复用*/
	//var oldPNodeIdforDrag;
/**定义根节点*/
 
var treeNodes = [];
var root = {
		userid:userid, 
		nodeType:'root',
		username: '我的下属',
		isParent: true,
		iconSkin:'icon01'//节点自定义图标的 className
	};
treeNodes.push(root);

//初始化功能操作树
$.fn.zTree.init($("#tree"), setting, treeNodes);

}
/**
* 数据过滤处理
* @param treeId
* @param parentNode
* @param childNodes
* @returns
* Author:GongZhf
*/
 //实现多级树显示
 function datafilter(treeId, parentNode, childNodes){
	 if (!childNodes) return null;
		for (var i=0, l=childNodes.length; i<l; i++) {
			if(childNodes[i].isParent == "1") {
				childNodes[i].isParent = true;
			} else {
				childNodes[i].isParent = false;
			}
			
		}  
		return childNodes;
 }

function clickHandler(event, treeId, treeNode, clickFlag){
if(treeNode.nodeType=="root"){
	return;
}else{
	var userid2 = treeNode.userid;
	var nodeType = treeNode.nodeType;
	$("#gn_iframe").attr("src",context+"/service/demo1/job/finduserjob?userid="+userid2+"&week="+35);
}
};
/**
* 判断是否需要异步加载数据
* @param treeId
* @param treeNode
* @returns {Boolean}
*/
function beforeAsync(treeId, treeNode){
//如果是加载根节点数据
if(!treeNode){
	return true;
}
//如果是叶子节点，则不进行加载
if(treeNode.isParent == false){
	return false;
}
return true;
};

function beforeDropTree(treeId, treeNodes, targetNode, moveType) {
oldPNodeIdforDrag = treeNodes[0].pId;
};
