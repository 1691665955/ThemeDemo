//
//  MZDetailVC.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZDetailVC.h"

@interface MZDetailVC ()

@end

@implementation MZDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情页面";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetail)];
    [self.view addGestureRecognizer:tap];
}

- (void)showDetail {
    MZDetailVC *vc = [[MZDetailVC alloc] initWithNibName:@"MZDetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
