//
//  ViewController.m
//  AddressBookNameSort
//
//  Created by Funny on 2017/6/17.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "ViewController.h"
#import "FunnyData.h"
#import "NameModel.h"
#import "SortNameTool.h"
#import "BMClientTableView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //计算时间
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    
    //排序
    SortNameTool *tool = [[SortNameTool alloc]init];
    NSArray *names = [FunnyData getNames];
    NSArray *tabelArray = [tool getTableArrayWithNames:names];

    
    BMClientTableView *clientTableView = [[BMClientTableView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), kScreenHeight-20) style:UITableViewStylePlain];
    clientTableView.initialArray = tool.initialArray;
    clientTableView.dataModels = tabelArray;
    [self.view addSubview:clientTableView];

    
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"整个过程花费的时间time cost: %0.3f", end - start);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
