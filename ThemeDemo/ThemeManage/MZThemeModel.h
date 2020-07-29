//
//  MZThemeModel.h
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZThemeModel : NSObject
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *themeName;
@property (nonatomic, assign, readonly) BOOL isCurrentTheme;
@end

NS_ASSUME_NONNULL_END
