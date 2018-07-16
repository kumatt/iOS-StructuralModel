//
//  BaseTransformViewController.m
//  ExampleProjectDemo
//
//  Created by BlanBok on 2018/2/9.
//  Copyright © 2018年 juyuanGroup. All rights reserved.
//

#import "BaseTransformViewController.h"

@interface BaseTransformViewController ()

/**
 数据源
 */
@property (nonnull,nonatomic,strong) NSArray<NSString*> *feedEntity;

@end

@implementation BaseTransformViewController
static NSString *_Nonnull const ReuseIdentifier = @"_transformCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"自定义跳转";
    
    self.feedEntity = @[@"神奇移动",@"弹性pop",@"翻页效果",@"小圆点扩散"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            PrapPageModel *pageModel = [PrapPageModel new];
            pageModel.path = @"TransformModule/magic";
            [self.navigationController pushViewController:[PTPageRouter PT_getViewControllerForPageModel:pageModel] animated:YES];
        }
            break;
        case 3:
        {
            PrapPageModel *pageModel = [PrapPageModel new];
            pageModel.path = @"TransformModule/circleSpread";
            [self.navigationController pushViewController:[PTPageRouter PT_getViewControllerForPageModel:pageModel] animated:YES];
        }
        default:
            break;
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedEntity.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.feedEntity[indexPath.row];
    return cell;
}



@end
