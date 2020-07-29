//
//  MZBaseTableViewCell.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZBaseTableViewCell.h"

@implementation MZBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeUpdate) name:MZNotificationNameThemeUpdate object:nil];
        [self themeUpdate];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeUpdate) name:MZNotificationNameThemeUpdate object:nil];
    [self themeUpdate];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)themeUpdate {
    self.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KBackgroundColor];
}

@end
