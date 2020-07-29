//
//  MZTabbarController.m
//  themeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZTabbarController.h"
#import "MZNavigationController.h"
#import "MZHomeVC.h"
#import "MZPersonVC.h"

@interface MZTabbarController ()

@end

@implementation MZTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeUpdate) name:MZNotificationNameThemeUpdate object:nil];
    [self themeUpdate];
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers {
    MZHomeVC *mainPageVC = [[MZHomeVC alloc] initWithNibName:@"MZHomeVC" bundle:nil];
    [self setupController:mainPageVC title:@"首页" image:[UIImage imageNamed:@"tabbar_home_normal"] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]];
    
    MZPersonVC *personVC = [[MZPersonVC alloc] initWithNibName:@"MZPersonVC" bundle:nil];
    [self setupController:personVC title:@"个人中心" image:[UIImage imageNamed:@"tabbar_person_normal"] selectedImage:[UIImage imageNamed:@"tabbar_person_selected"]];
}

-(void)setupController:(UIViewController*) viewController
                 title:(NSString*)title
                 image:(UIImage*) image
         selectedImage:(UIImage*)selectedImage
{
    
    UITabBarItem* item = [[UITabBarItem alloc]initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    viewController.tabBarItem = item;
    MZNavigationController *nvc = [[MZNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nvc];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)themeUpdate {
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:[[MZThemeManage shareInstance] colorNamed:KTabBarBackgroundColor]]];
    
    if (@available(iOS 10.0, *)) {
        self.tabBar.tintColor = [[MZThemeManage shareInstance] colorNamed:KTabBarSelectedColor];
        self.tabBar.unselectedItemTintColor = [[MZThemeManage shareInstance] colorNamed:KTabBarNormalColor];
        UITabBarItem *tabbarItem = [UITabBarItem appearance];
        [tabbarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    } else {
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName] = [[MZThemeManage shareInstance] colorNamed:KTabBarNormalColor];
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:11];

        NSMutableDictionary *selectAttri = [NSMutableDictionary dictionary];
        selectAttri[NSForegroundColorAttributeName] = [[MZThemeManage shareInstance] colorNamed:KTabBarSelectedColor];
        selectAttri[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        //通过appearance对tabBarItem的文字属性进行统一设置，这样所有的控制的tabBarItem的文字属性久都是这种样式的了
        UITabBarItem *tabbarItem = [UITabBarItem appearance];
        [tabbarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [tabbarItem setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
        [tabbarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    }
}

@end
