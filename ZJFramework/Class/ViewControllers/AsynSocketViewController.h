//
//  AsynSocketViewController.h
//  ZJFramework
//
//  Created by DL on 15/4/2.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "BaseViewController.h"

#import "AsyncSocket.h"
#define SRV_CONNECTED 0
#define SRV_CONNECT_SUC 1
#define SRV_CONNECT_FAIL 2
#define HOST_IP @"127.0.0.1"
#define HOST_PORT 5222

@interface AsynSocketViewController : BaseViewController {
    
    AsyncSocket *asyncSocket;
}

@end
