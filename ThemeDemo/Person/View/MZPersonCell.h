//
//  MZPersonCell.h
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MZPersonItemType) {
    MZPersonItemTypeTheme
};

@interface MZPersonCell : MZBaseTableViewCell
@property (nonatomic, assign) MZPersonItemType type;
@end

NS_ASSUME_NONNULL_END
