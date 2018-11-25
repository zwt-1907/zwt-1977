package com.fh.shop.admin.biz.goods;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.goods.GoodsDao;
import com.fh.shop.admin.po.Goods;
import com.fh.shop.admin.util.CosUploadFile;
import com.fh.shop.admin.util.DataTableResult;
import com.fh.shop.admin.util.SystemConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements  GoodsService{
    @Autowired
    private GoodsDao goodsDao;



    @Override
    public List<Goods> findGoods(Goods goods) {

        return goodsDao.findGoods(goods);
    }

    @Override
    public void addGoods(Goods goods) {
        goodsDao.addGoods(goods);
    }

    @Override
    public void deleteGoods(List<Integer> ids) {
        goodsDao.deleteGoods(ids);
    }

    @Override
    public Goods toUpdateGoods(Integer id) {
        return goodsDao.toUpdateGoods(id);
    }

    @Override
    public void updateGoods(Goods goods, String realPath) {
        String oldFilePath = goods.getOldGoodsFile();
        String newFilePath = goods.getGoodsPhoto();
        if (!oldFilePath.equals(newFilePath)){
            //删除老图片
           /* String filePath = realPath+oldFilePath;
            File file = new File(filePath);
            if (file.exists()){
                file.delete();
            }*/
            CosUploadFile.deleteFile(oldFilePath.replace(SystemConst.COS_URL,""));
        }
        goodsDao.updateGoods(goods);
    }

    @Override
    public ServerResponse findgoodsAndCount(Goods goods, Integer draw) {
        if (goods.getGoodsName() != null){
            goods.setGoodsName("%"+goods.getGoodsName()+"%");
        }
        int count = goodsDao.pageCount(goods);
        List<Goods> goodsList = goodsDao.findGoods(goods);
        DataTableResult dataTable = new DataTableResult();
        dataTable.setDraw(draw);
        dataTable.setiTotalRecords(count);
        dataTable.setiTotalDisplayRecords(count);
        dataTable.setData(goodsList);

        return ServerResponse.success(dataTable);
    }
}
