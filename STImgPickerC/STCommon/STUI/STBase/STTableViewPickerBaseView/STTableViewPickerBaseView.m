//
//  STTableViewPickerBaseView.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STTableViewPickerBaseView.h"

@implementation STTableViewPickerBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
    }
    return self;
}


- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
     // 确定子控件的frame（这里得到的self的frame/bounds才是准确的）
}
//-(void)removeFromSuperview{
//    
//}

#pragma *************************** Getter ***************************
#pragma mark ------ stNavView
-(STNavView *)stNavView{
    if (!_stNavView) {
        _stNavView = [
    }
}

@end
