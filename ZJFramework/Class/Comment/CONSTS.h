//
//  CONSTS.h
//  Hupan
//
//  Copyright 2010 iTotem Studio. All rights reserved.
//

#define NOTIFY_POST(NAME, ARGS) ([[NSNotificationCenter defaultCenter] postNotificationName:NAME object:nil userInfo: ARGS]);

#define NOTIFY_REMOVE(NAME, OBJ) ([[NSNotificationCenter defaultCenter] removeObserver:OBJ name:NAME object:nil]);

#define NOTIFY_REGISTER(NAME, FUNC) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FUNC:) name:NAME object:nil];
#define REQUEST_DOMAIN @"http://cx.itotemstudio.com/api.php" // default env

//text
#define TEXT_LOAD_MORE_NORMAL_STATE @"向上拉动加载更多..."
#define TEXT_LOAD_MORE_LOADING_STATE @"更多数据加载中..."


#define USER_WM_NOTIFICATION_LOGIN     @"USER_WM_NOTIFICATION_LOGIN"
#define USER_WM_NOTIFICATION_LOGOUT    @"USER_WM_NOTIFICATION_LOGOUT"

#define KEY_BOARD_WINDOWN       [[[UIApplication sharedApplication]windows]count]>1?[[[UIApplication sharedApplication]windows]objectAtIndex:1]:nil;

#define KEY_WINDOW          [UIApplication sharedApplication].keyWindow
#define KEY_DOEN_BTN_TAG    108
#define REAL_ORIGIN_Y   ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0f)?20:0
#define REAL_ORIGIN_H    ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0f)?70:50

#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion]compare:@"7.0"]!=NSOrderedAscending)

#define ScreenBoundHeight [UIScreen mainScreen].bounds.size.height
#define ScreenBoundWith [UIScreen mainScreen].bounds.size.width
#define ScreenBound [UIScreen mainScreen].bounds
#define is4InchScreen() ([UIScreen mainScreen].bounds.size.height == SCREEN_HEIGHT_OF_IPHONE5)

//#define DATEFORMATTER @"yyyy/MM/dd HH:mm:ss"

#define kMode_Development             @"00"

#define WAIMAI_PHONENUM  @"400-669-6210"
#define UMENG_APPKEY @"5487c083fd98c5f7d60011e1"
#define WM_SHAREURL    @"http://dz.jbwzx.com/app/testserver/iosPage/demo.html"
//请求链接

//#define REQUEST_BASE_URL   @"http://dz.jbwzx.com/app/server/"

#define REQUEST_BASE_URL   @"http://dz.jbwzx.com/app/testserver/"


#define REQUEST_IMAGE_URL  @"http://dz.jbwzx.com/"

///CacheDefaine
//历史记录地址
#define WM_CACHE_HISTROYADDRESS @"WM_CACHE_HISTROYADDRES"
//历史记录搜索餐厅
#define WM_CACHE_HISTROYCAFETERIA @"WM_CACHE_HISTROYCAFETERIA"
//用户名
#define WM_CACHE_USERINFO   @"WM_CACHE_USERINFO"
//版本管理//内部｛bundleArray：［“1.0”，“2.0”］｝
#define WM_CACHE_CFBundleShortVersionString @"WM_CACHE_CFBundleShortVersionString"
//首页广告缓存
#define WM_HOMEBANNERCACHE  @"WM_HOMEBANNERCACHE"



///NSNotification
#define WM_NOTIFICATION_LOGIN   @"WM_NOTIFICATION_LOGIN"
#define WM_NOTIFICATION_LOGOUT  @"WM_NOTIFICATION_LOGOUT"
#define WM_NOTIFICATION_ALIPAY  @"WM_NOTIFICATION_ALIPAY"
#define WM_NOTIFACATION_UPDATA  @"WM_NOTIFACATION_UPDATA"

//shoppingTrilley中保存的key
#define WM_KEY_DISHMODEL   @"WM_KEY_DISHMOEL"
#define WM_KEY_SHOPNUM  @"WM_KEY_SHOPNUM"
#define WM_KEY_INDEXPATH    @"WM_KEY_INDEXPATH"

//是否显示评论功能
#ifndef WM_NOT_SHOW_COMMENT
    #define WM_NOT_SHOW_COMMENT @"注释掉此宏,可以显示评论模块"
#endif


#define REQUESTURLCONNECT(interfaceName) [NSString stringWithFormat:@"%@%@",REQUEST_BASE_URL,interfaceName]

#define REQUESTIMAGEURLCONNECT(IMAGEURL) [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",REQUEST_IMAGE_URL,IMAGEURL]]
//other consts




typedef enum{
	kTagWindowIndicatorView = 501,
	kTagWindowIndicator,
} WindowSubViewTag;

typedef enum{
    kTagHintView = 101
} HintViewTag;


