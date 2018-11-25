package com.fh.shop.admin.mapper.brand;

import com.fh.shop.admin.po.Brand;

import java.util.List;

public interface IBrandDao {
    List<Brand> findBrandList(Brand brand);

    void addBrand(Brand brand);

    void deleteBrand(Integer id);

    void updateBrand(Brand brand);

    int countpage(Brand brand);

    Brand toUpBrand(Integer id);

    List<Brand> findBrandAndGoods();

    void addBrandS(Brand brand2);

    void addBrandTo(List<Brand> brandList);
}
