//
//  STBaseViewC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, STViewCTransitionType) {
    STViewCTransitionTypeOfPush       = 0, //psuh
    STViewCTransitionTypeOfModal      = 1 , //Model
    STViewCTransitionOfChild          = 2 ,// addSubView/aadChildViewC
};
@interface STBaseViewC : UIViewController
#pragma mark ---------------------- record 记录
@property(nonatomic,strong)UIViewController           *recordSuperViewC;
@property(nonatomic,strong)UIViewController           *recordLogicViewC;
@property(nonatomic,strong)UIViewController           *recordUIViewC;
@property (nonatomic, strong)UITabBarController       *recordTabBarC;
@property(nonatomic,assign)STViewCTransitionType      stViewCTransitionType;   //Transition type
#pragma mark ----------------------- Plublic
#pragma mark - new < STBaseViewC *>
/**
 * @brief:  new ViewC methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 */
+(STBaseViewC *)showSTBaseViewCOnSuperViewC:(UIViewController *)superViewC
                               andFrameRect:(CGRect)frameRect
                   andSTViewCTransitionType:(STViewCTransitionType)stViewCTransitionType
                                andComplete:(void(^)(BOOL finished,
                                                     STBaseViewC *stBaseViewC))block;

@end
