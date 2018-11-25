package com.fh.shop.admin.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DataTableResult<t> implements Serializable {
    private Integer draw;
    private Integer iTotalRecords;
    private Integer iTotalDisplayRecords;
    private List<t> data = new ArrayList<t>();

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(Integer iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public Integer getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(Integer iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public List<t> getData() {
        return data;
    }

    public void setData(List<t> data) {
        this.data = data;
    }
}
