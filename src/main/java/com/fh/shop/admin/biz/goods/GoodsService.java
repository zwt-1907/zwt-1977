package com.fh.shop.admin.biz.goods;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Goods;

import java.util.List;

public interface GoodsService {


    List<Goods> findGoods(Goods goods);

    void addGoods(Goods goods);

    void deleteGoods(List<Integer> ids);

    Goods toUpdateGoods(Integer id);

    void updateGoods(Goods goods, String realPath);

    ServerResponse findgoodsAndCount(Goods goods, Integer draw);
}
