
//
//  STBaseView.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"

@implementation STBaseView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
#pragma mark - new < STBaseView *>
/**
 * @brief:  new View methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 * 
 * @other: m:Avoid warning to write this way, you can choose to don't write
 */
+(STBaseView *)showSTBaseViewOnSuperView:(UIView *)superView
                            andFrameRect:(CGRect)frameRect
                             andComplete:(void(BOOL finished,STBaseView
                                               *stBaseView))block{
    if (block) {
        block(NO,nil);
    }
    return nil;
}
@end
