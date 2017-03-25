//
//  STBaseView.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBaseView : UIView <XXNibBridge>
//record super View
@property(strong,nonatomic)UIView *stRecordSuperView;
@property(strong,nonatomic)UIViewController *stRecordSuperViewC;
#pragma mark ----------------------- Plublic
#pragma mark - new < STBaseView *>
/**
 * @brief:  new View methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 */
+( STBaseView *)showSTBaseViewOnSuperView:(UIView *)superView
                             andFrameRect:(CGRect)frameRect
                              andComplete:(void(BOOL finished,STBaseView
                                                *stBaseView))block;
@end
