//
//  MZBaseViewController.m
//  themeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZBaseViewController.h"


@interface MZBaseViewController ()

@end

@implementation MZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KBackgroundColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeUpdate) name:MZNotificationNameThemeUpdate object:nil];
    [self themeUpdate];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)themeUpdate {
    self.view.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KBackgroundColor];
}

@end
