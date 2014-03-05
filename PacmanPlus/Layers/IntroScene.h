//
//  IntroScene.h
//  PacmanPlus
//
//  Created by Maksat Aman on 2/28/14.
//  Copyright (c) 2014 Peak games. All rights reserved.
//

#import "CCLayer.h"
#import <cocos2d.h>
#import <GCDAsyncUdpSocket.h>

@interface IntroScene : CCScene <GCDAsyncUdpSocketDelegate>

+(instancetype) scene;


@property (nonatomic, strong) GCDAsyncUdpSocket* socket;
@end
