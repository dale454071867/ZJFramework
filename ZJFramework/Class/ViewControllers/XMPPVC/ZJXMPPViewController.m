//
//  ZJXMPPViewController.m
//  ZJFramework
//
//  Created by DL on 15/4/14.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ZJXMPPViewController.h"
#import "XMPPJID.h"
#import "XMPPPresence.h"
@interface ZJXMPPViewController ()
@property(nonatomic,strong)XMPPStream *xmppStream;
@end

@implementation ZJXMPPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)connect {
    if (self.xmppStream == nil) {
        self.xmppStream = [[XMPPStream alloc] init];
        [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    
    if (![self.xmppStream isConnected]) {
//        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        XMPPJID *jid = [XMPPJID jidWithUser:@"zhoujie" domain:@"zhoujiedemacbook.local" resource:@"Ework"];
        [self.xmppStream setMyJID:jid];
        [self.xmppStream setHostName:@"172.16.98.212"];
        [self.xmppStream setHostPort:5222];
        NSError *error = nil;
        if (![self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error]) {
         
            NSLog(@"Connect Error: %@", [[error userInfo] description]);
        }
    }
}
- (IBAction)connet:(id)sender {
      [self connect];
}
//身份认证
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
//    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSError *error = nil;
    if (![self.xmppStream authenticateWithPassword:@"111111" error:&error]) {
        NSLog(@"Authenticate Error: %@", [[error userInfo] description]);
    }
}
//退出并断开连接
- (void)disconnect {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [self.xmppStream sendElement:presence];
    
    [self.xmppStream disconnect];
}
//上线
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
     NSLog(@"xmppStreamDidAuthenticate");
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"available"];
    [self.xmppStream sendElement:presence];
}
//启动连接操作后，回调函数（委托函数）

- (void)xmppStreamWillConnect:(XMPPStream *)sender//将被调用，表示将要连接

{
    
    NSLog(@"xmppStreamWillConnect");
    
}
//连接错误
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error

{
    
    NSLog(@"didNotAuthenticate:%@",[error description]);
    
}
//注册失败
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error;
{
    NSLog(@"didNotRegister:%@",[error description]);
}
- (void)xmppStream:(XMPPStream *)sender didReceiveError:(NSXMLElement *)error;
{
    NSLog(@"didReceiveError:%@",[error description]);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
