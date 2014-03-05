//
//  IntroScene.m
//  PacmanPlus
//
//  Created by Maksat Aman on 2/28/14.
//  Copyright (c) 2014 Peak games. All rights reserved.
//

#import "IntroScene.h"

@implementation IntroScene


+(instancetype) scene
{
    return [[self alloc] init];
}


-(instancetype) init
{
    if(self = [super init])
    {
        CCMenuItemFont* connectButton = [CCMenuItemFont itemWithString:@"Connect" target:self selector:@selector(connectPressed:)];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        connectButton.position = ccp(winSize.width/2.f, winSize.height/2.f);
        
        CCMenu *menu = [CCMenu menuWithItems:connectButton, nil];
        menu.position = ccp(0,0);
        menu.anchorPoint = ccp(0,0);
        [self addChild:menu];
    }
    
    return self;
}

-(void) connectPressed:(id) sender
{
    NSString* host = @"10.96.0.86";
    int port = 9999;
    
    NSString* data = @"CONNECT";
    
    if(self.socket == nil)
    {
        self.socket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        NSError* error = nil;
        
        [self.socket connectToHost:host onPort:port error:&error];
        if(error)
        {
            NSLog(@"error: %@", error);
        }
        
        [self.socket beginReceiving:&error];
        
        if(error)
        {
            NSLog(@"error: %@", error);
        }
    }
    [self.socket sendData:[data dataUsingEncoding:NSUTF8StringEncoding] withTimeout:10 tag:0];
    
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didConnectToAddress:(NSData *)address
{
    NSString* addrString = [[NSString alloc] initWithData:address encoding:NSUTF8StringEncoding];
    NSLog(@"%s %@", __PRETTY_FUNCTION__, addrString);
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didNotConnect:(NSError *)error
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data
      fromAddress:(NSData *)address
withFilterContext:(id)filterContext
{
    NSString* string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%s %@", __PRETTY_FUNCTION__, string);
}

- (void)udpSocketDidClose:(GCDAsyncUdpSocket *)sock withError:(NSError *)error
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

@end
