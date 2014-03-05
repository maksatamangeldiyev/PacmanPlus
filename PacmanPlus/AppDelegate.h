//
//  AppDelegate.h
//  PacmanPlus
//
//  Created by Maksat Aman on 2/28/14.
//  Copyright (c) 2014 Peak games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppDelegate : NSObject <UIApplicationDelegate>
{
}

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) MyNavigationController *navController;
@property (nonatomic, strong) CCDirectorIOS *director;

@end

