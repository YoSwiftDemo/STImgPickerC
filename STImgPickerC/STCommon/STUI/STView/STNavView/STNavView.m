
//
//  STNavView.m
//  FanweApp
//
//  Created by 岳克奎 on 17/3/6.
//  Copyright © 2017年 xfg. All rights reserved.
//

#import "STNavView.h"

@implementation STNavView


#pragma mark ----------------------------- setter/getter 属性的初始化区域 ---------------
-(void)setDelegate:(id<STNavViewDelegate>)delegate{
    _delegate = delegate;
}

- (IBAction)leftBtnClick:(id)sender {
    //键盘下去
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    if(_delegate && [_delegate respondsToSelector:@selector(showLeftBtnEventResponseOfSTNavView)]){
        [_delegate showLeftBtnEventResponseOfSTNavView];
    }
}

- (IBAction)rightBtnClick:(id)sender {
}

@end
