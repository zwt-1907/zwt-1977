package com.fh.shop.admin.biz.brand;


import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.brand.IBrandDao;
import com.fh.shop.admin.po.Brand;
import com.fh.shop.admin.util.CacheManager;
import com.fh.shop.admin.util.DataTableResult;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("brandService")
public class BrandServiceImpl implements IBrandService {
    @Autowired
    private IBrandDao brandDao;


        /*if (brand.getBrandName() != null){
            List<Brand> brandList = brandDao.findBrandList(brand);
            return brandList;
        }
        Object findBrandList = CacheManager.getInstance().getObj("brandList");
        if (findBrandList != null){
            return (List<Brand>) findBrandList;
        }
        List<Brand> brandList = brandDao.findBrandList(brand);
        CacheManager.getInstance().putObj("brandList",brandList);
        return brandList;*/


    @Override
    public void addBrand(Brand brand) {
        CacheManager.getInstance().remove("brandList");
        brandDao.addBrand(brand);
    }

    @Override
    public void deleteBrand(Integer id) {
        CacheManager.getInstance().remove("brandList");
        brandDao.deleteBrand(id);
    }
    @Override
    public void updateBrand(Brand brand) {
        CacheManager.getInstance().remove("brandList");
        brandDao.updateBrand(brand);
    }

    @Override
    public int countpage(Brand brand) {
        return brandDao.countpage(brand);
    }

    @Override
    public Brand toUpBrand(Integer id) {
        return brandDao.toUpBrand(id);
    }

    @Override
    public List<Brand> findBrandAndGoods() {
        return brandDao.findBrandAndGoods();
    }

    @Override
    public void addBrandS(List<Brand> brand) {
        for(Brand brand2 : brand){
            brandDao.addBrandS(brand2);
        }
    }

    @Override
    public ServerResponse addBrandTo(Brand brand) {
        if (brand == null){
            return ServerResponse.error();
        }
        String brandName = brand.getBrandName();
        String description = brand.getDescription();
        String brandLogo = brand.getBrandLogo();
        if (StringUtils.isEmpty(brandName) || StringUtils.isEmpty(brandLogo)){
            return ServerResponse.error();
        }
        String[] brandNames = brandName.split(",");
        String[] brandLogos = brandLogo.split(",");
        String[] descriptions = null;

        if (StringUtils.isNotEmpty(description)){
            descriptions = description.split(",");
        }
        List<Brand> brandList = new ArrayList<Brand>();
        for (int i=0; i < brandNames.length; i++){
            Brand brandS = new Brand();
            brandS.setBrandName(brandNames[i]);
            brandS.setBrandLogo(brandLogos[i]);
            if (descriptions != null){
                brandS.setDescription(descriptions[i]);
            }else{
                brandS.setDescription("该商品暂未添加描述");
            }
            brandList.add(brandS);
        }
        brandDao.addBrandTo(brandList);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findBrandList(Brand brand, Integer draw) {

        if (null != brand.getBrandName()) {
            brand.setBrandName("%" + brand.getBrandName() + "%");
        }
        DataTableResult dataTable = new DataTableResult();
        int count = brandDao.countpage(brand);
        List<Brand> brandList = brandDao.findBrandList(brand);
        dataTable.setDraw(draw);
        dataTable.setiTotalRecords(count);
        dataTable.setiTotalDisplayRecords(count);
        dataTable.setData(brandList);

        return ServerResponse.success(dataTable);
    }

}
