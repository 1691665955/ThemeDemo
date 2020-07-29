//
//  MZThemeVC.m
//  ThemeDemo
//
//  Created by 曾龙 on 2020/7/29.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZThemeVC.h"
#import "MZThemeCell.h"

@interface MZThemeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<MZThemeModel *> *themeList;
@end

@implementation MZThemeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主题";
    [self themeUpdate];
    self.themeList = [[MZThemeManage shareInstance] getThemeList];
    [self.tableView registerClass:[MZThemeCell class] forCellReuseIdentifier:@"MZThemeCell"];
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.themeList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"MZThemeCell";
    MZThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell == nil){
        cell = [[MZThemeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.theme = self.themeList[indexPath.row];
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([MZThemeManage shareInstance].isSystemDarkMode) {
        NSLog(@"系统暗黑模式下默认为暗黑主题，不能自定义调整主题");
        return;
    }
    MZThemeModel *theme = self.themeList[indexPath.row];
    if (theme.isCurrentTheme) {
        return;
    }
    [[MZThemeManage shareInstance] updateTheme:theme.themeName];
    [self.tableView reloadData];
}

- (void)themeUpdate {
    [super themeUpdate];
    self.tableView.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KBackgroundColor];
}

@end
