package com.fh.shop.admin.controller.goods;

import com.fh.shop.admin.annotation.LogAnnotation;
import com.fh.shop.admin.biz.brand.IBrandService;
import com.fh.shop.admin.biz.goods.GoodsService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Brand;
import com.fh.shop.admin.po.Goods;
import com.fh.shop.admin.util.CosUploadFile;
import com.fh.shop.admin.util.FileUtil;
import com.fh.shop.admin.util.SystemConst;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("goods")
public class GoodsController {
    @Resource
    private GoodsService goodsService;
    @Resource(name = "brandService")
    private IBrandService brandService;

    @RequestMapping("jump")
    @LogAnnotation("进入商品页面")
    public String jump(){
        return "/goods/goods";
    }


    @RequestMapping("jumpAddGoods")
    @LogAnnotation("进入添加商品页面")
    public String jumpAddGoods(){
        return "/goods/addGoods";
    }

    //进入到商品修改页面
    @RequestMapping("jumpUpdateGoods")
    @LogAnnotation("进入添加商品页面")
    public String jumpUpdateGoods(){
        return "/goods/updateGoods";
    }

    @RequestMapping("/findGoods")
    @ResponseBody
    @LogAnnotation("查询商品列表")
    public ServerResponse findGoods(Goods goods ,Integer draw){
        //所有的业务都在service层
        return goodsService.findgoodsAndCount(goods,draw);
    }
    //新增时查询品牌
    @RequestMapping("/findBrand")
    @ResponseBody
    @LogAnnotation("新增时查询品牌")
    public ServerResponse  findBrand(){

        List<Brand> brandList = brandService.findBrandAndGoods();

        return  ServerResponse.success(brandList);
    }
    //添加
    @RequestMapping("/addGoods")
    @ResponseBody
    @LogAnnotation("新增商品")
    public ServerResponse addGoods(Goods goods){
        goodsService.addGoods(goods);
        return ServerResponse.success();
    }
    //删除   deleteGoode
    @RequestMapping("/deleteGoods")
    @ResponseBody
    @LogAnnotation("新增商品")
    public ServerResponse deleteGoods(@RequestParam(value = "ids[]") List<Integer> ids){
        for (int i = 0; i < ids.size(); i++) {
            System.out.println(ids.get(i));
        }
        goodsService.deleteGoods(ids);
        return ServerResponse.success();
    }
    //回显   toUpdateGoods
    @RequestMapping("/toUpdateGoods")
    @ResponseBody
    @LogAnnotation("修改前回显")
    public ServerResponse toUpdateGoods(Integer id){
        Goods goods = goodsService.toUpdateGoods(id);
        return ServerResponse.success(goods);
    }

    //修改
    @RequestMapping("/updateGoods")
    @ResponseBody
    @LogAnnotation("修改商品")
    public ServerResponse updateGoods(Goods goods, HttpServletRequest request){

        goodsService.updateGoods(goods,request.getServletContext().getRealPath("/"));
        return ServerResponse.success();
    }
    //上传图片到腾讯cos
    //上传图片
    @RequestMapping("cosFlieinput")
    @ResponseBody
    public ServerResponse flieinput(@RequestParam("photo") MultipartFile photo, HttpSession session) throws IOException {
       InputStream inputStream = photo.getInputStream();
       String filePath = CosUploadFile.uploadFiless(inputStream);
       return ServerResponse.success(filePath);
    }

}
