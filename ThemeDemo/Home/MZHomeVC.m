//
//  MZHomeVC.m
//  themeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZHomeVC.h"
#import "MZDetailVC.h"

@interface MZHomeVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLB;

@end

@implementation MZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self themeUpdate];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetail)];
    [self.view addGestureRecognizer:tap];
}

- (void)showDetail {
    MZDetailVC *vc = [[MZDetailVC alloc] initWithNibName:@"MZDetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)themeUpdate {
    [super themeUpdate];
    self.textLB.textColor = [[MZThemeManage shareInstance] colorNamed:KTitleColor];
    self.imageView.image = [[MZThemeManage shareInstance] imageNamed:@"avatar"];
}

@end
