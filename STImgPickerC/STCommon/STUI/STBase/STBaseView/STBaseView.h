//
//  STBaseView.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBaseView : UIView<XXNibBridge>
#pragma mark *************************** Property **************************
@property (nonatomic ,strong)UIView           *recordSupreView;
@property (nonatomic ,strong)UIViewController *recordSupreViewC;
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
                                                      STBaseView *stBaseView))block;
@end
