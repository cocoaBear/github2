//
//  LiftAdress.h
//  LifeOfHouse
//
//  Created by qf on 16/4/6.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#ifndef LifeOfHouse_LiftAdress_h
#define LifeOfHouse_LiftAdress_h


//@"http://rm.app.diaoyuweng.com/json_rm.php?action=list&ver=4&page=0&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//最新
#define L_NEWURL @"http://rm.app.diaoyuweng.com/json_rm.php?action=list&ver=4&page=%d&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%%20version_4.3%%20oid_0f607264fc6318a92b9e13c65db7cd3c%%20package_com.aslibra.rm.jiaju%%20platform_iphone%%20ver_7.1.2%%20jb_1"

//@"http://rm.app.diaoyuweng.com/json_rm.php?action=detail&albumId=21037&album_type=0&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"


//发现
#define L_FIND @"http://rm.app.diaoyuweng.com/json_shop.php?action=list&ver=0&page=%d&tag=(null)&pageSize=10&appCookie=channel_AppStore%%20version_4.3%%20oid_0f607264fc6318a92b9e13c65db7cd3c%%20package_com.aslibra.rm.jiaju%%20platform_iphone%%20ver_7.1.2%%20jb_1"





//通用Detail
#define DETAIL_URL @"http://rm.app.diaoyuweng.com/json_rm.php?action=detail&albumId=%@"
#define DETAIL_STR  @"&album_type=0&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"



#pragma mark - 分类详情页面URL
//编辑精选

#define CLASS @"http://rm.app.diaoyuweng.com/json_rm.php?action=list&ver=4&page=%d"

#define CLASS_1 @"&category=jiaju&category2=E&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//装修案例
#define CLASS_2 @"&category=jiaju&category2=%E8%A3%85%E4%BF%AE%E6%A1%88%E4%BE%8B&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//攻略
#define CLASS_3 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E8%A3%85%E4%BF%AE%E6%94%BB%E7%95%A5"
//装修清单
#define CLASS_4 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E8%A3%85%E4%BF%AE%E6%B8%85%E5%8D%95"
//家饰
#define CLASS_5 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E5%AE%B6%E5%B1%85%E8%A3%85%E9%A5%B0"
//迷你户型
#define CLASS_6 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E8%BF%B7%E4%BD%A0%E6%88%B7%E5%9E%8B"
//小户型
#define CLASS_7 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E5%B0%8F%E6%88%B7%E5%9E%8B"
//地中海
#define CLASS_8 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E5%9C%B0%E4%B8%AD%E6%B5%B7"
//宜家
#define CLASS_9 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E5%AE%9C%E5%AE%B6"
//现代
#define CLASS_10 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E7%8E%B0%E4%BB%A3"
//田园
#define CLASS_11 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E7%94%B0%E5%9B%AD"
//美式
#define CLASS_12 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E7%BE%8E%E5%BC%8F"
//欧式
#define CLASS_13 @"&category=jiaju&category2=&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1&keyword=%E6%AC%A7%E5%BC%8F"
//客厅
#define CLASS_14 @"&category=jiaju&category2=%E5%AE%A2%E5%8E%85&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//玄关
#define CLASS_15 @"&category=jiaju&category2=%E7%8E%84%E5%85%B3&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//卧室
#define CLASS_16 @"&category=jiaju&category2=%E5%8D%A7%E5%AE%A4&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//儿童房
#define CLASS_17 @"&category=jiaju&category2=%E5%84%BF%E7%AB%A5%E6%88%BF&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//厨房
#define CLASS_18 @"&category=jiaju&category2=%E5%8E%A8%E6%88%BF&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//餐厅
#define CLASS_19 @"&category=jiaju&category2=%E9%A4%90%E5%8E%85&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//卫浴间
#define CLASS_20 @"&category=jiaju&category2=%E5%8D%AB%E6%B5%B4%E9%97%B4&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//阳台
#define CLASS_21 @"&category=jiaju&category2=%E9%98%B3%E5%8F%B0&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//书房
#define CLASS_22 @"&category=jiaju&category2=%E4%B9%A6%E6%88%BF&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"
//其他
#define CLASS_23 @"&category=jiaju&category2=%E5%85%B6%E4%BB%96&pageSize=10&appCookie=channel_AppStore%20version_4.3%20oid_0f607264fc6318a92b9e13c65db7cd3c%20package_com.aslibra.rm.jiaju%20platform_iphone%20ver_7.1.2%20jb_1"


#endif
