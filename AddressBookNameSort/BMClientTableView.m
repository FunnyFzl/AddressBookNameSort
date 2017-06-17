//
//  BMClientTableView.m
//  YouYouBao
//
//  Created by Funny on 2017/4/21.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "BMClientTableView.h"


@interface BMClientTableView ()

@property(nonatomic,strong)NSArray *sectionIndexArray;

@end

static NSString *BMClientTableViewCellIdentifier = @"BMClientTableViewCellIdentifier";

static NSString *headerId = @"BMClientTableHeaderViewIdentifier";

@implementation BMClientTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.sectionHeaderHeight = 27*FHeight;
        self.rowHeight = 44*FHeight;
        
        self.sectionIndexBackgroundColor = self.backgroundColor;
        self.sectionIndexColor = Color(102, 102, 102, 1);
        self.sectionIndexMinimumDisplayRowCount = 10;
        self.sectionIndexTrackingBackgroundColor = self.backgroundColor;
        
        
        
    }
    return self;
}
- (void)setInitialArray:(NSArray *)initialArray {
    _initialArray = initialArray;
    self.sectionIndexArray = self.initialArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowArray = self.dataModels[section];
    return [rowArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BMClientTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BMClientTableViewCellIdentifier];
    }
    NSArray *nameModels = self.dataModels[indexPath.section];
    NameModel *model = nameModels[indexPath.row];
    
    cell.textLabel.text = model.chineseCharacter;
    cell.textLabel.font = FFont(15*FHeight);
    cell.textLabel.textColor = Color(51, 51, 51, 1);
    
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    BMClientTableHeaderView *headerView = (BMClientTableHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerId];
    if (headerView == nil) {
        headerView = [[BMClientTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.sectionHeaderHeight)];
        headerView.backgroundColor = Color(244, 244, 244, 1);
    }
    
    headerView.sectionTitleLabel.text = (NSString *)self.initialArray[section];
    
    return headerView;
}


-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.sectionIndexArray;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSInteger count = 0;
    for(NSString *character in self.sectionIndexArray)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}

@end



@implementation BMClientTableHeaderView

- (UILabel *)sectionTitleLabel {
    if (!_sectionTitleLabel) {
        UILabel *sectionTitleLabel = [[UILabel alloc]init];
        sectionTitleLabel.font = FboldFont(15*FHeight);
        sectionTitleLabel.textColor = Color(102, 102, 102, 1);
        [self addSubview:sectionTitleLabel];
        [sectionTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(20*FWidth);
            make.centerY.equalTo(self.mas_centerY);
        }];
        self.sectionTitleLabel = sectionTitleLabel;
    }
    return _sectionTitleLabel;
}

@end
