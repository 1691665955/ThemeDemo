//
//  MZPersonCell.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZPersonCell.h"

@interface MZPersonCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation MZPersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLB.textColor = [[MZThemeManage shareInstance] colorNamed:KTitleColor];
    self.line.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KLineColor];
}

- (void)setType:(MZPersonItemType)type {
    _type = type;
    switch (type) {
        case MZPersonItemTypeTheme:
            self.iconView.image = [[MZThemeManage shareInstance] imageNamed:@"person_type_theme"];
            self.nameLB.text = @"主题";
            self.arrowView.image = [[MZThemeManage shareInstance] imageNamed:@"right_arrow"];
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)themeUpdate {
    [super themeUpdate];
    self.nameLB.textColor = [[MZThemeManage shareInstance] colorNamed:KTitleColor];
    self.line.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KLineColor];
    switch (self.type) {
        case MZPersonItemTypeTheme:
            self.iconView.image = [[MZThemeManage shareInstance] imageNamed:@"person_type_theme"];
            self.arrowView.image = [[MZThemeManage shareInstance] imageNamed:@"right_arrow"];
            break;
        default:
            break;
    }
}

@end
