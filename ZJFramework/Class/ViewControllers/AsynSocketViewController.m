//
//  AsynSocketViewController.m
//  ZJFramework
//
//  Created by DL on 15/4/2.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "AsynSocketViewController.h"

@implementation AsynSocketViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError *err = nil;
    if(![asyncSocket connectToHost:@"127.0.0.1" onPort:5222 error:&err])
    {
        NSLog(@"Error: %@", err);
    }
}
- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"onSocket:%p didConnectToHost:%@ port:%hu", sock, host, port);
    [sock readDataWithTimeout:1 tag:0];
}
-(void) onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString* aStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"===%@",aStr);
    NSData* aData= [@"<xml>我喜欢你<xml>" dataUsingEncoding: NSUTF8StringEncoding];
    [sock writeData:aData withTimeout:-1 tag:1];
    [sock readDataWithTimeout:1 tag:0];
}
- (void)onSocket:(AsyncSocket *)sock didSecure:(BOOL)flag
{
    NSLog(@"onSocket:%p didSecure:YES", sock);
}
- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"onSocket:%p willDisconnectWithError:%@", sock, err);
}
- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    //断开连接了
    NSLog(@"onSocketDidDisconnect:%p", sock);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
    asyncSocket=nil;
}

@end
