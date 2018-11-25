<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加商品</title>
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
</head>
<body>


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            添加商品
                        </div>
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
                                <label class="col-sm-2 control-label" >商品品牌：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="brand" id="add_brandName">
                                        <option value="">===请选择===</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" id="cateDiv">
                                <label class="col-sm-2 control-label" >商品分类：</label>

                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >商品照片：</label>
                                <div class="col-sm-6">
                                    <input type="file" name="photo" data-ref="url12" class="col-sm-10" id="gphoto" multiple />
                                    <input type="text" id="goodsFile">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 20px;">
                                <label class="col-sm-2 control-label" ></label>
                                <div class="col-sm-6">
                                    <button type="button" class="btn btn-warning" onclick="addGoods()">
                                        <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                                        添加
                                    </button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
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
<script type="text/javascript">

        $(function () {
            initType(0);
            fileinput();
            findBrand();
        })
        //无限极联动
       //var cateName = "";
        function  initType(id,obj) {
            //先去查询数据库，查出第一级菜单
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/type/findByAddGoods.jhtml?id="+id,
                success:function (result) {
                    if (result.code == 200){
                        //清除，如果obj存在
                        if (obj){
                            //cateName += "-"+$(obj).find("[value="+id+"]").html();
                            $(obj).parent().nextAll().remove();
                            var v_index = obj.selectedIndex;
                            $(obj).prev().val(obj.options[v_index].text);
                        }
                        var v_data = result.data;
                        if (v_data == 0){
                            return;
                        }
                        var v_option = '<div class="col-sm-2"><input type="hidden" name="selectCateName"/><select class="form-control" name="cateVal" id="category1" onchange="initType(this.value,this)"><option value="">===请选择===</option>';
                        for (var i=0; i<v_data.length; i++){
                            v_option+='<option value="'+v_data[i].gId+'" name="cate">'+v_data[i].gName+'</option>';
                        }

                        v_option+='</select></div>';
                        $("#cateDiv").append(v_option);
                    }
                }
            })
        }
        function addGoods(){

            var goodsName = $("#add_goodsName").val();
            var goodsPrice = $("#add_goodsPrice").val();
            var inventory = $("#add_inventory").val();
            var brandId = $("#add_brandName").val();
            var goodsPhoto =$("#goodsFile").val();

            /*var cate  = $("[name='cate']");
            var  category1 = cate[0].value;
            var  category2 = cate[1].value;
            var  category3 = cate[2].value;*/

            var cateVal = [];
            $("select[name='cateVal']").each(function () {
                cateVal.push(this.value);
            })
            var category1 =  cateVal.length>=1 ? cateVal[0]:-1;
            var category2 =  cateVal.length>=2 ? cateVal[1]:-1;
            var category3 =  cateVal.length>=3 ? cateVal[2]:-1;
            var idList = $("#sc_typeId").val();

           var  cateName = $("input[name='selectCateName']")[0].value+"-"+$("input[name='selectCateName']")[1].value+"-"+$("input[name='selectCateName']")[2].value;
            var param = {};
            param.goodsName = goodsName;
            param.goodsPrice = goodsPrice;
            param.inventory = inventory;
            param["brand.id"] = brandId;
            param.goodsPhoto = goodsPhoto;
            param.category1 = category1;
            param.category2 = category2;
            param.category3 = category3;
            param.cateName = cateName;
            console.log(cateName);
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
                        //跳转
                        location.href="<%=request.getContextPath()%>/goods/jump.jhtml";
                    }else{
                        bootbox.alert({
                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>+result.message",
                            size: 'small',
                            title:"提示信息"});
                    }
                }
            })

        }

        //品牌
        function findBrand(){
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/goods/findBrand.jhtml",
                success:function (result) {
                    var v_data = result.data;
                    for (var i=0; i<=v_data.length; i++){
                        $("#add_brandName").append('<option value="'+v_data[i].id+'">'+v_data[i].brandName+'</option>');
                    }
                }
            })
        }
        //图片
        function fileinput(){
            $("#gphoto").fileinput({
                language:'zh', //设置语言
                showRemove :false, //显示移除按钮
                showPreview :true, //是否显示预览
                autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
                enctype:'multipart/form-data',
                maxFileCount:1, //表示允许同时上传的最大文件个数,
                initialPreviewAsData:true,
                uploadUrl:"<%=request.getContextPath()%>/goods/cosFlieinput.jhtml",
            }) .on("fileuploaded", function(event, data) {
                console.info(data)
                $("#goodsFile").val(data.response.data);
            });
        }
</script>
</body>
</html>
