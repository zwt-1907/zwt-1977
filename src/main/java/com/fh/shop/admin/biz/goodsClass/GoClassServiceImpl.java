package com.fh.shop.admin.biz.goodsClass;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.goods.GoodsDao;
import com.fh.shop.admin.mapper.goodsClass.GoClassDao;
import com.fh.shop.admin.po.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goClassService")
public class GoClassServiceImpl implements GoClassService{
    @Autowired
    private GoClassDao goClassDao;
    //注入商品service
    @Autowired
    private GoodsDao goodsDao;
    @Override
    public List<Type> FindGoList(Type gocs) {
        return goClassDao.FindGoList(gocs);
    }

    @Override
    public void addGoClass(Type gocs) {
        goClassDao.addGoClass(gocs);
    }

    @Override
    public void updateGoClass(Type gocs) {
        goClassDao.updateGoClass(gocs);
    }

    @Override
    public void deleteGoClass(List<Integer> idList) {
        goClassDao.deleteGoClass(idList);
        goodsDao.deleteGoodsByTypeId(idList);
    }

    @Override
    public ServerResponse findByAddGoods(Integer id) {
        List<Type> byAddGoods = goClassDao.findByAddGoods(id);
        return ServerResponse.success(byAddGoods);
    }
}


