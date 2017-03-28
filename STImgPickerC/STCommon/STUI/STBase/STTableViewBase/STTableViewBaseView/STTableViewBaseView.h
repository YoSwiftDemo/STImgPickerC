//
//  STTableViewBaseView.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"

@interface STTableViewBaseView : STBaseView<UITableViewDelegate,UITableViewDataSource,STNavViewDelegate>
@property(nonatomic,strong)STNavView *stNavView;   //custom stNavView
@property (nonatomic,strong)UITableView *tableView;
@end
