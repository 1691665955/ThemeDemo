//
//  MZWindow.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZWindow.h"

@implementation MZWindow

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (@available(iOS 13.0, *)) {
        if (previousTraitCollection.userInterfaceStyle != [UITraitCollection currentTraitCollection].userInterfaceStyle) {
            [MZThemeManage shareInstance].isSystemDarkMode = ([UITraitCollection currentTraitCollection].userInterfaceStyle == UIUserInterfaceStyleDark);
        }
    }
}

@end
