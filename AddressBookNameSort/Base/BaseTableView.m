//
//  BaseTableView.m
//  YouYouBao
//
//  Created by Funny on 2017/4/18.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "BaseTableView.h"

static NSString *identifier = @"BaseTableViewCellIdentifier";

@interface BaseTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.backgroundColor = Color(255, 255, 255, 1);
        self.separatorColor = LineColor;
        
        self.tableFooterView = [UIView new];
        
        self.delegate = self;
        self.dataSource = self;

    }
    return self;
}

- (void)setDataModels:(NSArray *)dataModels {
    _dataModels = dataModels;
    [self reloadData];
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseTableViewCell *cell = [BaseTableViewCell cellWithTableView:tableView IndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

@end


@implementation BaseTableViewCell

+ (instancetype _Nullable )cellWithTableView:(UITableView *_Nullable)tableView IndexPath:(NSIndexPath *_Nullable)indexPath {
    
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = Color(255, 255, 255, 1);
        self.contentView.backgroundColor = Color(255, 255, 255, 1);
    }
    return self;
}

@end
