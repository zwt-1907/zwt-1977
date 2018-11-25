package com.fh.shop.admin.util;

public interface SystemConst {

    int LOG_SUCCESS = 1;

    int LOG_FAIL = 0;
    //登录状态（锁定）
    int USER_LOCK = 1;
    //密码错误的次数
    int USER_ERROR_COUNT = 3;
    String PHOTO_PATH = "upload//";

    String COS_ACCESSKEY = "AKIDDJEGQXsp4PsNlyzqaAZnqhS8g3EH9pKn";
    String COS_SECRETKEY = "VSHuMdptnV1LUSM6lJfqumTyHPL5tY1I";
    String COS_AREA = "ap-shanghai";
    String COS_BACKNAME = "000-1257349327";
    String COS_URL = "https://000-1257349327.cos.ap-shanghai.myqcloud.com/";
}
