//
//  STTableViewBaseView.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STTableViewBaseView.h"

@implementation STTableViewBaseView
#pragma mark *********************** Left  cycle *********************
#pragma mark  -- initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
    }
    return self;
}
#pragma mark  --
- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    // 确定子控件的frame（这里得到的self的frame/bounds才是准确的）
    
}
//-(void)removeFromSuperview{
//
//}

#pragma *************************** Getter ***************************
#pragma mark --- stNavView
-(STNavView *)stNavView{
    if (!_stNavView) {
        _stNavView = (STNavView *)[STNavView showSTUIBridgeViewOnSuperView:self
                                                              andFrameRect:CGRectMake(0, 0, self.frame.size.width, 64)
                                                               andComplete:^(BOOL finished,
                                                                             STBaseView *stBaseView) {
                                                                   
                                                               }];
        [_stNavView setDelegate:self];
    }
    return _stNavView;
}
#pragma mark --- tableView
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height-64)
                                                 style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return  _tableView;
}
#pragma *************************** Delegate ***************************


@end
