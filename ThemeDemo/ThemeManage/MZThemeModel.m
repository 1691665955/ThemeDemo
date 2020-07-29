//
//  MZThemeModel.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZThemeModel.h"

@implementation MZThemeModel
- (BOOL)isCurrentTheme {
    return [self.themeName isEqualToString:[MZThemeManage shareInstance].themeName];
}
@end
