//
//  MZThemeManage.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZThemeManage.h"

@interface MZThemeManage ()

@end

@implementation MZThemeManage
@synthesize themeName = _themeName;
+ (instancetype)shareInstance {
    static MZThemeManage *themeManage = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        themeManage = [[MZThemeManage alloc] init];
    });
    return themeManage;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setIsSystemDarkMode:(BOOL)isSystemDarkMode {
    _isSystemDarkMode = isSystemDarkMode;
    [[NSNotificationCenter defaultCenter] postNotificationName:MZNotificationNameThemeUpdate object:nil];
}

- (NSArray<MZThemeModel *> *)getThemeList {
    NSArray *displayNames = @[@"默认",@"暗黑",@"粉色"];
    NSArray *themeNames = @[@"Default",@"Dark",@"Pink"];
    NSMutableArray *themeList = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < displayNames.count; i++) {
        MZThemeModel *model = [[MZThemeModel alloc] init];
        model.displayName = displayNames[i];
        model.themeName = themeNames[i];
        [themeList addObject:model];
    }
    return themeList;
}

- (void)updateTheme:(NSString *)themeName {
    [self setThemeName:themeName];
    [[NSNotificationCenter defaultCenter] postNotificationName:MZNotificationNameThemeUpdate object:nil];
}

- (void)setThemeName:(NSString *)themeName {
    _themeName = themeName;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:themeName forKey:@"themeName"];
    [defaults synchronize];
}

- (NSString *)themeName {
    if (self.isSystemDarkMode) {
        return @"Dark";
    } else {
        if (_themeName == nil) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *themeName = [defaults valueForKey:@"themeName"];
            if (themeName) {
                return themeName;
            }
            [defaults setObject:@"Default" forKey:@"themeName"];
            [defaults synchronize];
            return @"Default";
        }
        return _themeName;
    }
}


- (UIImage *)imageNamed:(NSString *)name {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@_%@.png",[self themeName],name]];
}

- (UIColor *)colorNamed:(NSString *)name {
    NSDictionary *themeData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_theme",self.themeName] ofType:@"plist"]];
    NSDictionary *colors = [themeData objectForKey:@"colors"];
    return [self colorWithHexString:[colors objectForKey:name]];
}

/**
 根据16进制字符串获取颜色
 
 @param hexString 16进制字符串
 @return 颜色
 */
- (UIColor *)colorWithHexString:(NSString *)hexString {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //hexString应该6到8个字符
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    //如果hexString 有@"0X"前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    
    //如果hexString 有@"#""前缀
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    //RGB转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R
    NSString *rString = [cString substringWithRange:range];
    
    //G
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //B
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    //
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
