//
//  STBaseView.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"

@implementation STBaseView
#pragma mark *************************** Plublic ****************************
#pragma mark ------new View
/**
 * @brief:  new View "+" methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 */
+(STBaseView *)showSTUIBridgeViewOnSuperView:(UIView *)superView
                                andFrameRect:(CGRect)frameRect
                                 andComplete:(void(^)(BOOL finished,
                                                      STBaseView *stBaseView))block{
    //①superView
    if(!superView){
        if (block) {
            block(NO,nil);
        }
        return nil;
    }
    //②remove existing View
    for (UIView *oneView in superView.subviews) {
        if([oneView isKindOfClass:[self class]]){
            [oneView removeFromSuperview];
        }
    }
    //③new
    STBaseView *newViewC = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class])
                                                           owner:nil
                                                         options:nil]firstObject];
    
    //④frame
    //[stBaseView setFrame:superView.frame];
    newViewC.frame = frameRect;
    //⑤ child
    [superView addSubview:newViewC];
    //⑥ record
    newViewC.recordSupreView = superView;
    //⑦ return、block
    if (block) {
        block(YES,newViewC);
    }
    return newViewC;
}
@end
