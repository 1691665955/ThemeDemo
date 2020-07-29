//
//  MZThemeManage.h
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MZThemeModel.h"

NS_ASSUME_NONNULL_BEGIN

#define MZNotificationNameThemeUpdate  @"MZNotificationNameThemeUpdate"

@interface MZThemeManage : NSObject
@property (nonatomic, copy, readonly) NSString *themeName;
@property (nonatomic, assign) BOOL isSystemDarkMode;
+ (instancetype)shareInstance;
- (NSArray<MZThemeModel *> *)getThemeList;
- (void)updateTheme:(NSString *)themeName;
- (UIImage *)imageNamed:(NSString *)name;
- (UIColor *)colorNamed:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
