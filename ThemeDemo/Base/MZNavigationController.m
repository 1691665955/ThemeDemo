//
//  MZNavigationController.m
//  themeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZNavigationController.h"

@interface MZNavigationController ()

@end

@implementation MZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeUpdate) name:MZNotificationNameThemeUpdate object:nil];
    
    self.interactivePopGestureRecognizer.delegate = (id)self;
    [self.navigationBar setTranslucent:NO];
    [self themeUpdate];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[[MZThemeManage shareInstance] imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)themeUpdate {
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[[MZThemeManage shareInstance] colorNamed:KNavigationBarBackgroundColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTintColor:[[MZThemeManage shareInstance] colorNamed:KNavigationBarTextColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[[MZThemeManage shareInstance] colorNamed:KNavigationBarTextColor]}];
    if (self.childViewControllers.count > 1) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[[MZThemeManage shareInstance] imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        self.viewControllers.lastObject.navigationItem.leftBarButtonItem = backItem;
    }
}

@end
