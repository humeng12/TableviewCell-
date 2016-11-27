//
//  ViewController.m
//  UITabviewCell(optimization)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "ViewController.h"
#import "MJStatus.h"
#import "MJStatusFrame.h"
#import "MJStatusCell.h"

@interface ViewController ()

/**
 *  存放所有cell的frame模型数据
 */
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation ViewController


- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建MJStatus模型对象
            MJStatus *status = [MJStatus statusWithDict:dict];
            
            // 3.2.创建MJStatusFrame模型对象
            MJStatusFrame *statusFrame = [[MJStatusFrame alloc] init];
            statusFrame.status = status;
            
            // 3.2.添加模型对象到数组中
            [statusFrameArray addObject:statusFrame];
        }
        
        // 4.赋值
        _statusFrames = statusFrameArray;
    }
    return _statusFrames;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - 实现数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJStatusCell *cell = [MJStatusCell cellWithTableView:tableView];
    
    // 2.在这个方法算好了cell的高度
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    // 3.返回cell
    return cell;
}

#pragma mark - 实现代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出这行对应的frame模型
    MJStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
