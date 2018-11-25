package com.fh.shop.admin.po;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fh.shop.admin.util.BigDecimalJackson;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Goods extends PageUtil implements Serializable {
    private static final long serialVersionUID = -8832197572315818344L;

    private Integer id;

    private String goodsName;

    @JsonSerialize(using = BigDecimalJackson.class)
    private BigDecimal goodsPrice;

    private Integer inventory;

    private String goodsPhoto;
    //旧图片
    private String oldGoodsFile;
    //品牌id
    private Integer brandId;
    //商品分类
    private Integer category1;
    private Integer category2;
    private Integer category3;
    private String  cateName;


    //对应品牌表
    private Brand brand = new Brand();

    private List<Integer> idList = new ArrayList<Integer>();

    //
    private Double minPrice;
    private  Double maxPrice;
    private Integer minInventory;
    private  Integer maxInventory;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Integer getMinInventory() {
        return minInventory;
    }

    public void setMinInventory(Integer minInventory) {
        this.minInventory = minInventory;
    }

    public Integer getMaxInventory() {
        return maxInventory;
    }

    public void setMaxInventory(Integer maxInventory) {
        this.maxInventory = maxInventory;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public String getGoodsPhoto() {
        return goodsPhoto;
    }

    public void setGoodsPhoto(String goodsPhoto) {
        this.goodsPhoto = goodsPhoto;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public List<Integer> getIdList() {
        return idList;
    }

    public void setIdList(List<Integer> idList) {
        this.idList = idList;
    }

    public Integer getCategory1() {
        return category1;
    }

    public void setCategory1(Integer category1) {
        this.category1 = category1;
    }

    public Integer getCategory2() {
        return category2;
    }

    public void setCategory2(Integer category2) {
        this.category2 = category2;
    }

    public Integer getCategory3() {
        return category3;
    }

    public void setCategory3(Integer category3) {
        this.category3 = category3;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getOldGoodsFile() {
        return oldGoodsFile;
    }

    public void setOldGoodsFile(String oldGoodsFile) {
        this.oldGoodsFile = oldGoodsFile;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", goodsName='" + goodsName + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", inventory=" + inventory +
                ", goodsPhoto='" + goodsPhoto + '\'' +
                ", category1=" + category1 +
                ", category2=" + category2 +
                ", category3=" + category3 +
                ", cateName='" + cateName + '\'' +
                ", brand=" + brand +
                ", idList=" + idList +
                ", minPrice=" + minPrice +
                ", maxPrice=" + maxPrice +
                ", minInventory=" + minInventory +
                ", maxInventory=" + maxInventory +
                '}';
    }
}
