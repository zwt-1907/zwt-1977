<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>分类</title>
    <!--路径图片-->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/2.png" />
    <!-- Bootstrap 核心 CSS 文件-->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- zTree -->
    <link href="<%=request.getContextPath() %>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" >
    <!-- 加载bootbox -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath() %>/js/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" >

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    部门管理
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="addDeptDlg()">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        新增
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-info" onclick="showDeptDlg()">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        修改
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-danger" onclick="deleteDept()">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        删除
                    </button>
                </div>
                <ul id="ztreeDemo" class="ztree"></ul>

            </div>
        </div>
        <!--右侧-->
    </div>
</div>



<!-- 新增 -->
<div id="goClassAddForm" style="display:none">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" >父级菜单：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="fatherName" placeholder="父级菜单" style="border-color: green;" readonly="readonly">
                <input type="hidden" class="form-control" id="gId" placeholder="父级id">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >菜单名：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="gName" placeholder="菜单名" style="border-color: red;">
            </div>
        </div>
    </form>
</div>

<!-- 修改 -->
<div id="goClassShowForm" style="display:none">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" >菜单名：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="edit_gName" placeholder="菜单名" style="border-color: red;">
                <input type="hidden" class="form-control" id="edit_gId" placeholder="本级id">
            </div>
        </div>
    </form>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- zTree -->
<script src="<%=request.getContextPath() %>/js/zTree_v3/js/jquery.ztree.core.min.js"></script>
<!-- 加载bootbox -->
<script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">

    $(function(){
        initTree();
    })




    //删除
    function deleteDept(){
        //获取当前选中节点的ID
        var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length ==0) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
                size: 'small',
                title:"提示信息"});
        }else{
            bootbox.confirm({
                size: "small",
                message: "删除部门",
                callback: function(result){
                    if (result) {
                        //接收所有节点的id
                        var idList = [];
                        //接收所有选择的节点及子孙节点
                        var selectNode = [];
                        for (var i = 0; i < nodes.length; i++) {
                            //接收当前节点及子孙节点循环出来的值
                            var node = nodes[i];
                            //转换成简单数组
                            var nodeList = treeObj.transformToArray(node);
                            //循环转换完成的数组
                            for (var j = 0; j < nodeList.length; j++) {
                                //ids接收id值
                                idList.push(nodeList[j].id);
                                //selectNode 接收循环出来的子孙节点
                                selectNode.push(nodeList[j]);
                            }
                        }
                        //把IDS 发送到后台删除数据库
                        $.ajax({
                            type:"post",
                            data:{"idList":idList},
                            url:"<%=request.getContextPath()%>/goClass/deleteGoClass.jhtml",
                            success:function(result){
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除成功",
                                        size: 'small',
                                        title:"提示信息"});
                                    for (var i = 0; i < selectNode.length; i++) {
                                        treeObj.removeNode(selectNode[i]);
                                    }
                                    empTable.ajax.reload();
                                }
                            }
                        })
                    }
                }
            })
        }
    }

    //修改
    function showDeptDlg(){
        //获取当前选中节点的ID
        var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 1) {
            //获取选中节点的值
            var v_fatherId = nodes[0].id;
            var v_fatherName = nodes[0].name;
            //赋值给弹出框的输入框
            $("#edit_gName").val(v_fatherName);
            $("#edit_gId").val(v_fatherId);
            //弹出框
            var editGoClassDialog = bootbox.dialog({
                title: '修改部门',
                message:$("#goClassShowForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            //点击确定获取用户输入框里新增节点的值
                            var edit_name = $("#edit_gName",editGoClassDialog).val();
                            var param = {};
                            param.gId = v_fatherId;
                            param.gName = edit_name;
                            $.ajax({
                                type:"post",
                                data:param,
                                url:"<%=request.getContextPath()%>/goClass/updateGoClass.jhtml",
                                success:function(result){
                                    if (result.code == 200) {
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改成功",
                                            size: 'small',
                                            title:"提示信息"});
                                        //修改节点
                                        nodes[0].name = edit_name;
                                        treeObj.updateNode(nodes[0]);
                                        empTable.ajax.reload();
                                    }
                                }
                            })

                            //使用ajax把获取到的值发送到后台
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
            });
        }else if(nodes.length == 0){
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
                size: 'small',
                title:"提示信息"});
        }else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个部门",
                size: 'small',
                title:"提示信息"});
        }
    }


    //新增
    function addDeptDlg(){
        //获取当前选中节点的ID
        var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 1) {
            //获取选中节点的值
            var v_Id = nodes[0].id;
            var v_Name = nodes[0].name;
            //赋值给弹出框的输入框
            $("#fatherName").val(v_Name);
            $("#gId").val(v_Id);
            //弹出框
            var addGoClassDialog = bootbox.dialog({
                title: '增加部门',
                message:$("#goClassAddForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            //点击确定获取用户输入框里新增节点的值

                            var param = {};
                            param.gPId = v_Id;
                            param.gName = $("#gName",addGoClassDialog).val();

                            $.ajax({
                                type:"post",
                                data:param,
                                url:"<%=request.getContextPath()%>/goClass/addGoClass.jhtml",
                                success:function(result){
                                    if (result.code == 200) {
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                            size: 'small',
                                            title:"提示信息"});
                                        var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
                                        var newNode = {};
                                        newNode.id = result.data.gId;
                                        newNode.name = result.data.gName;
                                        newNode.pId = result.data.gPid;
                                        newNode = treeObj.addNodes(nodes[0], newNode);
                                    }
                                }
                            })

                            //使用ajax把获取到的值发送到后台
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
            });
        }else if(nodes.length == 0){
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
                size: 'small',
                title:"提示信息"});
        }else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个部门",
                size: 'small',
                title:"提示信息"});
        }
    }

    //加载树
function initTree(){
    $.ajax({
        type:"post",
        url:"<%=request.getContextPath()%>/goClass/FindGoList.jhtml",
        success:function(result){
            console.log(result.data);
            if(result.code == 200){
                var setting = {

                    data: {
                        simpleData: {
                            enable: true
                        }
                    }
                };
                $(document).ready(function(){
                    $.fn.zTree.init($("#ztreeDemo"), setting, result.data);
                });
            }
        }
    })
}
</script>
</body>
</html>
