//
//  MZPersonVC.m
//  themeDemo
//
//  Created by 曾龙 on 2020/7/28.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "MZPersonVC.h"
#import "MZPersonCell.h"
#import "MZThemeVC.h"

@interface MZPersonVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MZPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    [self themeUpdate];
    [self.tableView registerNib:[UINib nibWithNibName:@"MZPersonCell" bundle:nil] forCellReuseIdentifier:@"MZPersonCell"];
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MZPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MZPersonCell"];
    cell.type = indexPath.row;
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case MZPersonItemTypeTheme:
        {
            MZThemeVC *vc = [[MZThemeVC alloc] initWithNibName:@"MZThemeVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)themeUpdate {
    [super themeUpdate];
    self.tableView.backgroundColor = [[MZThemeManage shareInstance] colorNamed:KBackgroundColor];
}

@end
