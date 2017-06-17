//
//  BMClientTableView.h
//  YouYouBao
//
//  Created by Funny on 2017/4/21.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "BaseTableView.h"
#import "NameModel.h"

@interface BMClientTableView : BaseTableView

@property(nonatomic)NSArray *initialArray;

@end

@interface BMClientTableHeaderView : UIView

@property(weak,nonatomic)UILabel *sectionTitleLabel;


@end
