//
//  AppDelegate.m
//  themeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "AppDelegate.h"
#import "MZTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13.0, *)) {
        [MZThemeManage shareInstance].isSystemDarkMode = ([UITraitCollection currentTraitCollection].userInterfaceStyle == UIUserInterfaceStyleDark);
    }
    self.window = [[MZWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[MZTabbarController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
