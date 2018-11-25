package com.fh.shop.admin.biz.goodsClass;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Type;

import java.util.List;

public interface GoClassService {
    List<Type> FindGoList(Type gocs);

    void addGoClass(Type gocs);

    void updateGoClass(Type gocs);

    void deleteGoClass(List<Integer> idList);

    ServerResponse findByAddGoods(Integer id);
}
