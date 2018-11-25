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
    <title>品牌</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/2.png" />
    <!-- Bootstrap 核心 CSS 文件-->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- zTree -->
    <link href="<%=request.getContextPath() %>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" >
    <!-- 加载bootbox -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
    <!-- datetime -->
    <link href="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.css" rel="stylesheet" >
    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath() %>/js/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" >
    <!--fileInput-->
    <link href="<%=request.getContextPath()%>/js/bootstrap/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css"/>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-warning">
                <div class="panel-heading" style="height: 50px;">
                    条件查询
                    <div style="float: right">
                        <button type="reset" class="btn btn-success" onclick="returnHome()">
                            <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                            主页
                        </button>
                    </div>
                </div>
                <div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" >品牌名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="sc_brandName" placeholder="品牌名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" ></label>
                            <div class="col-sm-6">
                                <button type="reset" class="btn btn-warning" >
                                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                                   重置
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-warning" onclick="search()">
                                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                                    查询
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="container-fluid">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    品牌列表
                    <button type="button" class="btn btn-warning" onclick="addBrand()">
                        <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                        添加
                    </button>
                    <button type="button" class="btn btn-warning" onclick="">
                        <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                        批量
                    </button>
                    <button type="button" class="btn btn-warning" onclick="addBrands()">
                        <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                        批量添加
                    </button>
                </div>
                <div class="panel-body">
                    <table id="brandDatatable" class="table table-bordered table-striped table-hover" border="1" >
                        <tbody>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>品牌名</th>
                            <th>Logo</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                        <thead>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- 新增 -->
            <div class="container-fluid" id="add_Brand" style="display:none; ">
                <div class="row">
                    <div class="col-md-10">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <button type="button" class="btn btn-plus" onclick="addpanel(this)" id="a">
                                    <span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>
                                    添加面板
                                </button>
                            </div>
                                <div id="brandAddForm" style="margin-top: 20px;">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" >品牌名：</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="brandName" id="add_brandName" placeholder="品牌名">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" >品牌描述：</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="description" id="add_description" placeholder="品牌描述">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" >品牌Logo：</label>
                                            <div class="col-sm-6">
                                                <input type="file" name="photo" id="photoId" data-ref="url12" multiple class="col-sm-10 myfile"/>
                                                <input type="hidden" id="brandLogo" name="brandLogo">
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


<!--修改-->
<div id="editAddForm" style="display:none">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" >品牌名：</label>
            <div class="col-sm-6">
                <input type="hidden" class="form-control" id="edit_id" placeholder="id">
                <input type="text" class="form-control" id="edit_brandName" placeholder="品牌名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >品牌描述：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="edit_description" placeholder="品牌描述">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >品牌Logo：</label>
            <div class="col-sm-6">
                <input type="file" name="photo" id="upFileInput" data-ref="url12" multiple class="col-sm-10 myfile"/>
                <input type="text" id="edit_brandLogo">
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
<!-- datetime -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTime/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/highCharts/highcharts.src.js"></script>
<!--fileInput-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/locales/zh.js"></script>
<script type="text/javascript">
    $(function () {
        //构建表格
        initBrandTable();
        fileinput();
        updateImage();
    })
    //返回主页
    function returnHome() {
        location.href="<%=request.getContextPath()%>/user/index.jhtml";
    }
    //进入多表单添加页面
    function addBrands(){
        location.href="<%=request.getContextPath()%>/brand/jumpAddBrand.jhtml";
    }
    //条件查询
    function search(){
        var name = $("#sc_brandName").val();
        var param = {};
        param.brandName = name;
        brandDatatable.settings()[0].ajax.data=param;
        brandDatatable.ajax.reload();
    }
    //修改
    var editBrandDialog;
    function updateBrand(id){
        $.ajax({
            type:"post",
            data:{"id":id},
            url:"<%=request.getContextPath()%>/brand/toUpBrand.jhtml",
            success:function(result){
                console.log(result.data);
                $("#edit_id",editBrandDialog).val(result.data.id);
                $("#edit_brandName",editBrandDialog).val(result.data.brandName);
                $("#edit_description",editBrandDialog).val(result.data.description);


                var url = new Array();
                url.push("<%=request.getContextPath()%>/"+result.data.brandLogo);
                $("#upFileInput",editBrandDialog).fileinput("destroy");
                updateImage(url);
                $("#edit_brandLogo",editBrandDialog).val(result.data.brandLogo);

            }
        })

       editBrandDialog = bootbox.dialog({
            title: '<h2>修改品牌</h2>',
            message:$("#editAddForm form").clone(),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        //点击确定获取新增用户输入框里新增节点的值
                        var v_id =  $("#edit_id",editBrandDialog).val();
                        var v_brandName =  $("#edit_brandName",editBrandDialog).val();
                        var v_description =   $("#edit_description",editBrandDialog).val();
                        var v_brandLogo=   $("#edit_brandLogo",editBrandDialog).val();
                        param = {};
                        param.id = v_id;
                        param.brandName = v_brandName;
                        param.description = v_description;
                        param.brandLogo = v_brandLogo;
                        $.ajax({
                            type:"post",
                            data:param,
                            url:"<%=request.getContextPath()%>/brand/updateBrand.jhtml",
                            success:function(result){
                                if (result.code == 200){
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改成功",
                                        size: 'small',
                                        title:"提示信息"});
                                    brandDatatable.ajax.reload();
                                }
                            }
                        })
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
        });
    }

    //删除
    function deleteBrand(id) {
       $.ajax({
           type:"post",
           data:{"id":id},
           url:"<%=request.getContextPath()%>/brand/deleteBrand.jhtml",
           success:function(result){
               if (result.code == 200){
                   bootbox.alert({
                       message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除成功",
                       size: 'small',
                       title:"提示信息"});
                   brandDatatable.ajax.reload();
               }
           }
       })
    }
    //新增时添加面板
    function addpanel(obj){
            //$("#add_Brand",addBrandDialog).append($("#add_Brand",addBrandDialog).clone());
        var paneldiv = $(obj).parent().parent();
        var paneldivcolne = paneldiv.clone();
        paneldiv.parent().append(paneldivcolne);
        var panelbuttondiv= paneldivcolne.children().first();
        panelbuttondiv.html('<button type="button" class="btn btn-primary glyphicon glyphicon-remove" onclick="delpanel(this)">删除品牌</button>');
        fileinput();
    }
    //删除面板
    function delpanel(obj){
        $(obj).parent().parent().remove();
    }
    //添加品牌
    var addBrandDialog;
    function addBrand(){
        addBrandDialog = bootbox.dialog({
            title: '<h2>添加面板</h2>',
            message:$("#add_Brand"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        //点击确定获取新增用户输入框里新增节点的值
                        //获得面板里所有的from表单
                        var formObj = $(".form-horizontal",addBrandDialog);
                        //遍历表单  放入集合中  接收往表里添加的值
                        var dataList = new Array();
                        for (var i = 0; i < formObj.length; i++){
                            //创建对象，先把值放进对象，最后再放进集合中
                            var brand = new Object();
                            //接收所有form表单的值
                            var formJson = $(formObj[i]).serializeArray();
                           //循环form的值
                            for (var k=0; k<formJson.length; k++){
                                //获取第一个值   品牌名
                                if (formJson[k].name == "brandName"){
                                    brand.brandName = formJson[k].value;
                                }
                                if (formJson[k].name == "description") {
                                    brand.description = formJson[k].value;
                                }
                                if (formJson[k].name == "brandLogo"){
                                    brand.brandLogo =formJson[k].value;
                                }
                            }
                            dataList.push(brand);
                        }
                        //把script对象转换成json格式的数据传怂到后台
                        var dataListJson = JSON.stringify(dataList);
                        $.ajax({
                            type:"post",
                            data:dataListJson,
                            contentType:"application/json; charset=utf-8",
                            url:"<%=request.getContextPath()%>/brand/addBrandS.jhtml",
                            success:function(result){
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                        size: 'small',
                                        title:"提示信息"});
                                    brandDatatable.ajax.reload();
                                }else{
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
                                        size: 'small',
                                        title:"警告"});
                                }
                            }
                        })
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
        });
    }
    //添加品牌
    /*function addBrand(){
        addBrandDialog = bootbox.dialog({
            title: '<h2>添加面板</h2>',
            message:$("#add_Brand"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        //点击确定获取新增用户输入框里新增节点的值
                        var param = {};
                        var add_brandName = $("#add_brandName",addBrandDialog).val();
                        var add_description = $("#add_description",addBrandDialog).val();
                        var add_brandLogo = $("#brandLogo",addBrandDialog).val();
                        param.brandName = add_brandName;
                        param.description = add_description;
                        param.brandLogo = add_brandLogo;
                        $.ajax({
                            type:"post",
                            data:param,
                            url:"/brand/addBrand.jhtml",
                            success:function(result){
                                if (result.code == 200) {
                                    empTable.ajax.reload();
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                        size: 'small',
                                        title:"提示信息"});
                                    brandDatatable.ajax.reload();
                                }else{
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
                                        size: 'small',
                                        title:"警告"});
                                }
                            }
                        })
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
        });
    }*/
    //修改图片
    function updateImage(url){
        $("#upFileInput",editBrandDialog).fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            initialPreview:url,
            uploadUrl:"<%=request.getContextPath()%>/brand/flieinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#edit_brandLogo",editBrandDialog).val(data.response.data);
        });
    }
    //图片
    function fileinput(){
        $(".myfile").fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            uploadUrl:"<%=request.getContextPath()%>/brand/flieinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#brandLogo").val(data.response.data);
        });
    }
    //构建图书表格
    var brandDatatable;
    function initBrandTable(){
        brandDatatable = $("#brandDatatable").DataTable({

            'bStateSave': true,
            'paging': true,
            "searching": true,//屏蔽datatales的查询框
            'lengthMenu': [5, 10, 20, 30],
            "processing": false,//刷新的那个对话框
            "serverSide": true,//服务器端分页
            "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
            'ajax': {
                'url': '<%=request.getContextPath()%>/brand/findBrandList.jhtml',
                'type': 'POST',
                "dataSrc":function(result){

                        console.log(result);
                        result.draw = result.data.draw;
                        result.iTotalRecords=result.data.iTotalRecords;
                        result.iTotalDisplayRecords=result.data.iTotalDisplayRecords;
                        return result.data.data;

                }
            },
            'columns': [
                {
                    "data": "id",
                    render:function(data){
                        return '<input type="checkbox" value="'+data+'" name="updateCheck"/>'
                    }
                },
                {"data": "brandName"},
                {
                    "data": "brandLogo",
                    render:function(data){
                        return '<img src="<%=request.getContextPath()%>/'+data+'" width="50px"/>'
                    }
                },
                {"data": "description"},
                {
                    "data": "id",
                    render:function(data){
                        return '<button type="button" class="btn btn-warning" onclick="updateBrand('+data+')">\n' +
                            '<span class="glyphicon glyphicon-record" aria-hidden="true"></span>\n' +
                            '修改\n' +
                            '</button>'+
                            '&nbsp;&nbsp;&nbsp;&nbsp;' +
                            '<button type="button" class="btn btn-warning" onclick="deleteBrand('+data+')">\n' +
                            '<span class="glyphicon glyphicon-record" aria-hidden="true"></span>\n' +
                            '删除\n' +
                            '</button>'
                    }
                },
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
            },
        });
    }
</script>

</body>
</html>
