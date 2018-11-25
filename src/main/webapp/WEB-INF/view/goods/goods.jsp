<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品页面</title>
    <!--路径图片-->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/2.png" />
    <!-- Bootstrap 核心 CSS 文件-->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 加载bootbox -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
    <!-- datetime -->
    <link href="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.css" rel="stylesheet" >
    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath() %>/js/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" >
    <!--fileInput-->
    <link href="<%=request.getContextPath()%>/js/bootstrap/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css"/>
    <!-- zTree -->
    <link href="<%=request.getContextPath() %>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" >
    <!--validator-->
    <link href="<%=request.getContextPath() %>/js/bootstrap/validator/bootstrapValidator.min.css" rel="stylesheet" >
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    分类管理
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
        <div class="col-md-8">
            <!-- 条件查询 -->
            <div class="panel panel-info">
                <div class="panel-heading" style="height: 50px;">
                    条件查询
                    <div style="float: right">
                        <button type="reset" class="btn btn-success" onclick="returnHome()">
                            <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
                            主页
                        </button>
                    </div>
                </div>
                <form class="form-horizontal" id="goodsForm">
                    <div class="form-group" style="margin-top: 20px;">
                        <label class="col-sm-3 control-label" >商品名查询：</label>
                        <div class="col-sm-8">
                            <input type="hidden" id="sc_typeId">
                            <input type="text" class="form-control" id="sc_goodsName" name="goodsName" placeholder="商品名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" >商品价格查询：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="minPrice" name="goodsPrice" placeholder="最小">
                        </div>
                        <div style="float: left; margin-top:5px; height: 30px;"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="maxPrice" name="goodsPrice" placeholder="最大">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" >商品库存查询：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="minInventory" name="inventory"  placeholder="最少">
                        </div>
                        <div style="float: left; margin-top:5px; height: 30px;"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="maxInventory" name="inventory"  placeholder="最多">
                        </div>
                    </div>

                    <div class="form-group" id="cateDiv">
                        <label class="col-sm-3 control-label" >商品分类查询：</label>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" >商品品牌查询：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="brand" id="sc_brand">
                                <option value="">===请选择===</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-5 control-label" ></label>
                        <div class="col-sm-7">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-info" onclick="searchGoods()">
                                <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
                                查询
                            </button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="reset" class="btn btn-info">
                                <span class="glyphicon glyphicon-flash" aria-hidden="true"></span>
                                重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                商品列表
                <button type="button" class="btn btn-warning" onclick="addGoods()">
                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                    添加
                </button>
                <button type="button" class="btn btn-warning" onclick="deleteGoods()">
                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                    删除
                </button>
                <button type="button" class="btn btn-warning" onclick="updateGoods()">
                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                   修改
                </button>
                <button type="button" class="btn btn-info" onclick="jumpAddGoods()">
                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                    添加页面
                </button>
                <button type="button" class="btn btn-info" onclick="jumpUpdateGoods()">
                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                    修改页面
                </button>
            </div>
            <div class="panel-body">
                <div class="panel-body">
                    <table id="goodsDataTable" class="table table-bordered table-striped table-hover" >
                        <thead>
                        <tr>
                            <th>选择</th>
                            <th>商品名</th>
                            <th>价格</th>
                            <th>库存</th>
                            <th>品牌</th>
                            <th>分类</th>
                            <th>图片</th>
                        </tr>
                        <thead>
                    </table>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>



        <!--新增-->
        <div id="addGoodsForm" style="display:none">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品名：</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="add_goodsName" placeholder="商品名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品价格：</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="add_goodsPrice" placeholder="商品价格">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品库存：</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="add_inventory" placeholder="商品库存">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品分类：</label>
                    <div class="col-sm-2">
                        <select class="form-control"  name="category1" onchange="chageSeleet(this)" id="add_category1">
                            <option value="">==请选择==</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select class="form-control"name="category2" onchange="chagetype2idSeleet(this)" id="add_category2">
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select class="form-control" name="category3" id="add_category3">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品品牌：</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="brand" id="add_brandName">
                            <option value="">===请选择===</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品照片：</label>
                    <div class="col-sm-6">
                        <input type="file" name="photo" data-ref="url12" class="col-sm-10" id="gphoto" multiple />
                        <input type="hidden" id="goodsFile">
                    </div>
                </div>
            </form>
        </div>



        <!--修改商品-->
        <div id="editGoodsForm" style="display:none">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品名：</label>
                    <div class="col-sm-6">
                        <input type="hidden"  id="goodsid">
                        <input type="text" class="form-control" id="edit_goodsName" placeholder="商品名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品价格：</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="edit_goodsPrice" placeholder="商品价格">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品库存：</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="edit_inventory" placeholder="商品库存">
                    </div>
                </div>
                <div class="form-group"id="updateCates">
                    <label class="col-sm-2 control-label" >商品分类：</label>

                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品品牌：</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="brand" id="edit_brandName">
                            <option value="">===请选择===</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品照片：</label>
                    <div class="col-sm-6">
                        <input type="file" name="photo" data-ref="url12" class="col-sm-10" id="edit_gphoto" multiple />
                        <input type="hidden" id="edit_goodsPhoto">
                    </div>
                </div>
            </form>
        </div>



<!-- 新增分类 -->
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

<!-- 修改分类    -->
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
<!-- 加载bootbox -->
<script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
<!-- datetime -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTime/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
        <!-- zTree -->
        <script src="<%=request.getContextPath() %>/js/zTree_v3/js/jquery.ztree.core.min.js"></script>
 <!--fileInput-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/locales/zh.js"></script>
<!--validator-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/validator/bootstrapValidator.min.js"></script>
<script type="text/javascript">

    $(function(){
        goodsTable();
        trColor();
        fileinput();
        searchBrand();
        initTree();
        initType();
        initTypeAndGoods(0);
        Validator($("#goodsForm"));
    })


    //验证
    function Validator(data){
        data.bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
                goodsName: {/*键名username和input name值对应*/
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '不能为空'
                        },
                    }
                },
                userPwd: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '密码不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min:0,
                            max: 11,
                            message: '密码长度不能超过11位'
                        },
                        regexp : {
                            regexp : /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])|(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).{8,16}$/,
                            message : '用户确认密码长度为8至16位,并且需要包含数字、小写字母、大写字母、符号(至少三种)'
                        },
                    }
                },
                code: {
                    message: '验证码失败',//默认
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 4,
                            message: '用户名长度不能超过4位'
                        },
                        regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '只能是数字和字母_.'
                        },
                    }
                },
            }
        })
    }
    //返回主页
    function returnHome() {
        location.href="<%=request.getContextPath()%>/user/index.jhtml";
    }
    //跳转到修改页面
    function jumpUpdateGoods() {
        var checkId = [];
        //获取当前被选中的复选框内的id
        $("input[name='goodsCheckbox']:checkbox:checked").each(function () {
            checkId.push($(this).val());
        });
        if(checkId.length > 1) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一件商品,请取消复选框",
                size: 'small',
                title: "提示信息"
            });
        }else if (checkId.length == 0){
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请至少选择一件商品",
                size: 'small',
                title: "提示信息"
            });
        }else {
            //取出数组里唯一一个值
            var id = checkId[0];
           location.href="<%=request.getContextPath()%>/goods/jumpUpdateGoods.jhtml?id="+id;
        }

    }

    //商品分类 查询
    function initTypeAndGoods(id,obj){
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/type/findByAddGoods.jhtml?id="+id,
            success: function (result) {
                if (result.code == 200){
                    if (obj){
                        $(obj).parent().nextAll().remove();
                        var v_index = obj.selectedIndex;
                        $(obj).prev().val(obj.options[v_index].text);
                    }
                    var v_data = result.data;
                    if (v_data == 0){
                        return ;
                    }
                    var v_option = '<div class="col-sm-3"><input type="hidden" name="selectCateName"/><select class="form-control" name="cateVal" id="category1" onchange="initTypeAndGoods(this.value,this)"><option value="">==请选择==</option>';
                    for (var i=0; i<v_data.length; i++){
                        v_option += '<option value="'+v_data[i].gId+'" name="cate">'+v_data[i].gName+'</option>';
                    }
                    v_option+='</select></div>';
                    $("#cateDiv").append(v_option);
                }
            }
        })
    }


    //跳转页面添加
    function  jumpAddGoods() {
        location.href="<%=request.getContextPath()%>/goods/jumpAddGoods.jhtml";
    }
    //分类关联商品
    function typeClickEmp(event,treeId,treeNode){
        var ids ;
        //获取当前选中节点的ID
        var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length ==1){
            ids = nodes[0].id;
        }
        //给条件查询表单的隐藏域赋值
        $("#sc_typeId").val(ids);
        //调用查询方法
        searchGoods(ids);
    }

    //三级联动
    var  datalist = null;
    function  initType() {
        $.ajax({
            url:"<%=request.getContextPath()%>/goClass/FindGoList.jhtml",
            type:"post",
            success:function(result){
                datalist =result.data;
                for (var i = 0; i < datalist.length; i++) {
                    if (datalist[i].pId == 1) {
                        $("[name='category1']").append('<option  value="' + datalist[i].id + '">' + datalist[i].name + '</option>');
                    };

                }
                chageSeleet();
                chagetype2idSeleet();
            }
        })
    }
    //第一个下拉框的
    function chageSeleet(obj) {
        $("[name='category2']").html("<option  value=''>---请选择-</option>");
        for (var i = 0; i < datalist.length; i++) {
            if ($(obj).val() == datalist[i].pId) {
                $("[name='category2']").append('<option  value="' + datalist[i].id + '">' + datalist[i].name + '</option>');
            }
        }
        if ($(obj).val() == ''){
            $("[name='category2']").html("<option  value=''>---请选择-</option>");
        }
    }

    //第二个下拉框的
    function  chagetype2idSeleet(obj) {
        $("[name='category3']").html("<option  value=''>---请选择-</option>");
        for (var i = 0; i < datalist.length; i++) {
            if ($(obj).val()== datalist[i].pId) {
                $("[name='category3']").append('<option  value="' + datalist[i].id + '">' + datalist[i].name + '</option>');
            }
        }
        if ($(obj).val()== ''){
            $("[name='category3']").html("<option  value=''>---请选择-</option>");
        }
    }


    //商品分类 修改时查询
    var updateCateNames = "";
    var   v_cateData;
    function updateTypeAndGoods(id,obj){
        $.ajax({
            type: "post",
            async:false,
            url: "<%=request.getContextPath()%>/type/findByAddGoods.jhtml?id="+id,
            success: function (result) {
                if (result.code == 200){
                    if (obj){
                        $(obj).parent().nextAll().remove();
                        var v_index = obj.selectedIndex;
                        updateCateNames = obj.options[v_index].text;
                        $(obj).prev().val(obj.options[v_index].text);
                    }
                    v_cateData = result.data;
                    if (v_cateData == 0){
                        return ;
                    }
                    var v_option = '<div class="col-sm-3"><input type="text" name="updateCateName"/><select class="form-control" name="updateCateVal" id="updateCategory" onchange="updateTypeAndGoods(this.value,this)"><option value="">==请选择==</option>';
                    for (var i=0; i<v_cateData.length; i++){
                        v_option += '<option value="'+v_cateData[i].gId+'" name="updateCate">'+v_cateData[i].gName+'</option>';
                    }
                    v_option+='</select></div>';
                    $("#updateCates",updateGoodsDialog).append(v_option);
                }
            }
        })
    }
    //修改
    var updateGoodsDialog;
    //品牌的返回值
    var v_data = [];
    function updateGoods(){
        //被选中的行id
        var checkId = [];
        //获取当前被选中的复选框内的id
        $("input[name='goodsCheckbox']:checkbox:checked").each(function () {
            checkId.push($(this).val());
        });
        if(checkId.length > 1) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一件商品,请取消复选框",
                size: 'small',
                title: "提示信息"
            });
        }else if (checkId.length == 0){
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请至少选择一件商品",
                size: 'small',
                title: "提示信息"
            });
        }else{
            //取出数组里唯一一个值
            var id = checkId[0];


            //根据id查询商品
            $.ajax({
                type:"post",
                data:{"id":id},
                url:"<%=request.getContextPath()%>/goods/toUpdateGoods.jhtml",
                success:function (result) {
                    if (result.code == 200){
                        //赋值
                        //品牌回显
                        findBrand(result.data.brandId);
                        $("#goodsid",updateGoodsDialog).val(id);
                        $("#edit_goodsName",updateGoodsDialog).val(result.data.goodsName);
                        $("#edit_goodsPrice",updateGoodsDialog).val(result.data.goodsPrice);
                        $("#edit_inventory",updateGoodsDialog).val(result.data.inventory);
                        for(var k=0; k<v_data.length; k++){
                            if (result.data.brandId == v_data[k].id)
                                $("#edit_brandName",updateGoodsDialog).val(v_data[k].brandName);
                        }

                        updateTypeAndGoods(0);

                        $($("select[name='updateCateVal']",updateGoodsDialog)[0]).val(result.data.category1);
                        updateTypeAndGoods(result.data.category1);
                        $($("select[name='updateCateVal']",updateGoodsDialog)[1]).val(result.data.category2);
                        updateTypeAndGoods(result.data.category2);
                        $($("select[name='updateCateVal']",updateGoodsDialog)[2]).val(result.data.category3);

                        var classArr = result.data.cateName.split("-");


                        $($("input[name='updateCateName'],updateGoodsDialog")[0]).val(classArr[0]);

                        $($("input[name='updateCateName'],updateGoodsDialog")[1]).val(classArr[1]);

                        $($("input[name='updateCateName'],updateGoodsDialog")[2]).val(classArr[2]);

                        //初始化fileInput
                        var url = new Array();
                        url.push("<%=request.getContextPath()%>/"+result.data.goodsPhoto);
                        $("#upFileInput",updateGoodsDialog).fileinput("destroy");
                        editFileInput(url);
                        $("#edit_goodsPhoto",updateGoodsDialog).val(result.data.goodsPhoto);
                    }
                }
            })
            updateGoodsDialog = bootbox.dialog({
                title: '<h2>修改分类列表</h2>',
                message:$("#editGoodsForm form"),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            var id = $("#goodsid",updateGoodsDialog).val();
                            var goodsName = $("#edit_goodsName",updateGoodsDialog).val();
                            var goodsPrice = $("#edit_goodsPrice",updateGoodsDialog).val();
                            var inventory = $("#edit_inventory",updateGoodsDialog).val();
                            var brandId = $("#edit_brandName",updateGoodsDialog).val();
                            var goodsPhoto =$("#edit_goodsPhoto",updateGoodsDialog).val();
                            var cateVal = [];
                            $("select[name='updateCateVal']").each(function () {
                                cateVal.push(this.value);
                            })
                            var category1 = cateVal.length >= 1?cateVal[0]:-1;
                            var category2 = cateVal.length >= 2?cateVal[1]:-1;
                            var category3 = cateVal.length >= 3?cateVal[2]:-1;
                            var cateName = $("input[name='updateCateName']")[0].value+"-"+$("input[name='updateCateName']")[1].value+"-"+$("input[name='updateCateName']")[2].value;
                            var param = {};
                            param.id = id;
                            param.goodsName = goodsName;
                            param.goodsPrice = goodsPrice;
                            param.inventory = inventory;
                            param["brand.id"] = brandId;
                            param.goodsPhoto = goodsPhoto;
                            param.category1 = category1;
                            param.category2 = category2;
                            param.category3 = category3;
                            param.cateName = cateName;
                            console.log(param);
                          $.ajax({
                                type:"post",
                                data:param,
                                url:"<%=request.getContextPath()%>/goods/updateGoods.jhtml",
                                success:function (result) {
                                    if (result.code == 200){
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改成功",
                                            size: 'small',
                                            title:"提示信息"});
                                        searchGoods();
                                    }else{
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改失败",
                                            size: 'small',
                                            title:"提示信息"});
                                    }
                                }
                            })
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger',
                        callback: function(){
                            updateTypeAndGoods(0);
                            //找到隐藏域，remove
                            $("#updateCates").children("div").remove();
                        }
                    }
                }
            });
        }
    }

    //修改时回显品牌
   function findBrand(brandId){
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/goods/findBrand.jhtml",
            success:function (result) {
                v_data=result.data;
                for (var i=0; i<v_data.length; i++){
                    if (brandId == v_data[i].id){
                        $("#edit_brandName",updateGoodsDialog).append('<option value="'+v_data[i].id+'" selected="selected">'+v_data[i].brandName+'</option>');
                    }
                    $("#edit_brandName",updateGoodsDialog).append('<option value="'+v_data[i].id+'">'+v_data[i].brandName+'</option>');
                }
            }
        })
    }
    //修改图片
    function editFileInput(url){
        $("#edit_gphoto",updateGoodsDialog).fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            initialPreview:url,
            uploadUrl:"<%=request.getContextPath()%>/goods/cosFlieinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#edit_goodsPhoto",updateGoodsDialog).val(data.response.data);
        });
    }



    //删除
    function deleteGoods() {
        if (trIds.length == 0) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请至少选择一件商品",
                size: 'small',
                title: "提示信息"
            });
        } else {
            bootbox.confirm({
                message: "你确定删除吗?",
                size: 'small',
                title: "提示信息",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确定',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    //判断这个result的值是否为true  点击取消返回false 点击确定才会进这个判断
                    if (result) {
                        //删除选中的复选框
                        $.ajax({
                            type: "post",
                            data: {"ids":trIds},
                            url:"<%=request.getContextPath()%>/goods/deleteGoods.jhtml",
                            success: function (result) {
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除成功",
                                        size: 'small',
                                        title: "提示信息"
                                    });
                                    searchGoods();
                                }
                            }
                        })
                    }
                }
            })
        }
    }
    //新增
    var addGoodsDialog;
    function addGoods(){
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/goods/findBrand.jhtml",
            success:function (result) {
                for (var i=0; i<result.data.length; i++){
                    $("#add_brandName",addGoodsDialog).append('<option value="'+result.data[i].id+'">'+result.data[i].brandName+'</option>');
                }
            }
        })
        fileinput();
        addGoodsDialog = bootbox.dialog({
            title: '<h2>增加商品</h2>',
            message:$("#addGoodsForm form"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        var goodsName = $("#add_goodsName",addGoodsDialog).val();
                        var goodsPrice = $("#add_goodsPrice",addGoodsDialog).val();
                        var inventory = $("#add_inventory",addGoodsDialog).val();
                        var brandId = $("#add_brandName",addGoodsDialog).val();
                        var goodsPhoto =$("#goodsFile",addGoodsDialog).val();
                        var category1 = $("#add_category1",addGoodsDialog).val();
                        var category2 = $("#add_category2",addGoodsDialog).val();
                        var category3 = $("#add_category3",addGoodsDialog).val();
                        var param = {};
                        param.goodsName = goodsName;
                        param.goodsPrice = goodsPrice;
                        param.inventory = inventory;
                        param["brand.id"] = brandId;
                        param.goodsPhoto = goodsPhoto;
                        param.category1 = category1;
                        param.category2 = category2;
                        param.category3 = category3;
                        $.ajax({
                            type:"post",
                            data:param,
                            url:"<%=request.getContextPath()%>/goods/addGoods.jhtml",
                            success:function (result) {
                                if (result.code == 200){
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                        size: 'small',
                                        title:"提示信息"});
                                    searchGoods();
                                }else{
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>+result.message",
                                        size: 'small',
                                        title:"提示信息"});
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

    //图片
    function fileinput(url){
        $("#gphoto").fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            initialPreview:url,
            uploadUrl:"<%=request.getContextPath()%>/goods/cosFlieinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#goodsFile",addGoodsDialog).val(data.response.data);
        });
    }
    function searchBrand(){
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/goods/findBrand.jhtml",
            success:function (result) {
                var v_data=result.data;
                for (var i=0; i<v_data.length; i++){
                    $("#sc_brand").append('<option value="'+v_data[i].id+'">'+v_data[i].brandName+'</option>');
                }
            }
        })
    }
    //条件查询
    function searchGoods(){

        var sc_goodsName = $("#sc_goodsName").val();
        var minPrice = $("#minPrice").val();
        var maxPrice = $("#maxPrice").val();
        var minInventory = $("#minInventory").val();
        var maxInventory = $("#maxInventory").val();
        var sc_brand = $("#sc_brand").val();
        var cateVal = [];
        $("select[name='cateVal']").each(function () {
            cateVal.push(this.value);
        })
        var category1 =  cateVal.length>=1 ? cateVal[0]:-1;
        var category2 =  cateVal.length>=2 ? cateVal[1]:-1;
        var category3 =  cateVal.length>=3 ? cateVal[2]:-1;
        var idList = $("#sc_typeId").val();
        var param = {};
        param.goodsName = sc_goodsName;
        param.minPrice = minPrice;
        param.maxPrice = maxPrice;
        param.minInventory = minInventory;
        param.maxInventory = maxInventory;
        param["brand.id"] = sc_brand;
        param.category1 = category1;
        param.category2 = category2;
        param.category3 = category3;
        param.idList = idList;
       goodsTable.settings()[0].ajax.data=param;
        goodsTable.ajax.reload();
    }
    //初始化表格
    var goodsTable;
   //表格翻页选中存放id的数组
    var trIds = [];
    function trColor(){
       // 给表格的行添加点击事件
        $("#goodsDataTable tbody").on("click","tr",function(){
            var v_checkbox = $(this).find("td input[type='checkbox']");

            if (v_checkbox.prop("checked")) {
                v_checkbox.prop("checked",false);
                $(this).closest("tr").css({background:""})
                //删除数组
                for (var i = 0; i < trIds.length; i++) {
                    if (v_checkbox.val() == trIds[i]) {
                        trIds.splice(trIds[i],1);
                        break;
                    }
                }
            }else{
                //增加
                v_checkbox.prop("checked",true);
                v_checkbox.closest("tr").css({background:"green"});
                trIds.push(v_checkbox.val());
            }
        })
    }
    //员工表格
    function goodsTable(){
        goodsTable = $('#goodsDataTable').DataTable({
            'bStateSave': false,
            'paging': true,
            "processing": true,
            "serverSide": true,
            'lengthMenu': [5, 10, 20, 30],
            "ajax": {
                "url": "<%=request.getContextPath()%>/goods/findGoods.jhtml",
                "type": "POST",
                "dataSrc":function(result){
                    console.log(result.data);
                    if(result.code==200){
                        result.draw = result.data.draw;
                        result.iTotalRecords=result.data.iTotalRecords;
                        result.iTotalDisplayRecords=result.data.iTotalDisplayRecords;
                        return result.data.data;
                    }
                }
            },
            'columns': [
                {
                    "data": "id",
                    "render":function(data,type,row,meta){
                        return '<input type="checkbox" value="'+data+'" name="goodsCheckbox"/>';
                    }
                },
                {"data": "goodsName"},
                {"data": "goodsPrice"},
                {"data": "inventory"},
                {"data": "brand.brandName"},
                {"data":"cateName"},
                {
                    "data": "goodsPhoto",
                    render:function(data){
                        return '<img src="'+data+'" width = "50"/>'
                    }
                },
            ],

            "language": {
                "url": "<%=request.getContextPath()%>/js/DataTables-1.10.15/Chinese.json"
            },
            "drawCallback": function( settings ) {
                $("#goodsDataTable tbody").find(":checkbox").each(function(){
                    var v_id = this.value;
                    if (isExist(v_id)) {
                        $(this).prop("checked",true);
                        $(this).closest("tr").css({background:"green"});
                    }
                })
            },
        } );
    }
 function isExist(id){
        for (var i = 0; i < trIds.length; i++) {
            if (trIds[i] == id) {
                return true;
                break;
            }
        }
        return false;
    }
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
                if(result.code == 200){
                    var setting = {
                        callback: {
                            onClick: typeClickEmp
                        },
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
