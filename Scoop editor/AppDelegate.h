//
//  AppDelegate.h
//  Scoop editor
//
//  Created by Alberto Di Martino on 4/26/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ADMLoginViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong)  UITabBarController *tabBarController;
@property (nonatomic,strong)  UINavigationController *appDNAV;

@end

