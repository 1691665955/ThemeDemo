//
//  MZThemeCell.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZThemeCell.h"

@interface MZThemeCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLB;
@property (nonatomic, strong) UIView *line;
@end

@implementation MZThemeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 15, 20, 20)];
        [self.contentView addSubview:self.iconView];
        self.nameLB = [[UILabel alloc] initWithFrame:CGRectMake(44, 0, [UIScreen mainScreen].bounds.size.width-50, 50)];
        self.nameLB.textColor = [[MZThemeManage shareInstance] colorNamed:KTitleColor];
        self.nameLB.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.nameLB];
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 49, [UIScreen mainScreen].bounds.size.width, 1)];
        self.line.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KLineColor];
        [self.contentView addSubview:self.line];
    }
    return self;
}

- (void)setTheme:(MZThemeModel *)theme {
    _theme = theme;
    self.nameLB.text = theme.displayName;
    self.iconView.image = [[MZThemeManage shareInstance] imageNamed:theme.isCurrentTheme?@"theme_selected":@"theme_unselected"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)themeUpdate {
    [super themeUpdate];
    self.nameLB.textColor = [[MZThemeManage shareInstance] colorNamed:KTitleColor];
    self.line.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KLineColor];
    self.iconView.image = [[MZThemeManage shareInstance] imageNamed:self.theme.isCurrentTheme?@"theme_selected":@"theme_unselected"];
}

@end
