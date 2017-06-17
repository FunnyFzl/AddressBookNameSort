//
//  BaseTableView.h
//  YouYouBao
//
//  Created by Funny on 2017/4/18.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define FWidth ([UIScreen mainScreen].bounds.size.width/375.0f)
#define FHeight ([UIScreen mainScreen].bounds.size.height/667.0f)

#define LineColor Color(221, 221, 221, 1)
#define Color(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)/1.0f]
#define FFont(x)       [UIFont systemFontOfSize:(x)]
#define FboldFont(x)   [UIFont boldSystemFontOfSize:(x)]


@interface BaseTableView : UITableView

@property(nonatomic,strong)NSArray * _Nullable dataModels;

@end




@interface BaseTableViewCell : UITableViewCell

+ (instancetype _Nullable )cellWithTableView:(UITableView *_Nullable)tableView IndexPath:(NSIndexPath *_Nullable)indexPath;

@end
