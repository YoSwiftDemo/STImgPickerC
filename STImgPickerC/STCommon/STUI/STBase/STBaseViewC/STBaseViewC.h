//
//  STBaseViewC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 15/3/25.
//  Copyright © 2015年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IQKeyboardManager.h>
#import "STRefresh.h"
<<<<<<< HEAD
#pragma mark - TransitionTyp
=======
#pragma mark - Transition Type
>>>>>>> origin/master
typedef NS_ENUM(NSUInteger, STViewCTransitionType) {
    STViewCTransitionTypeOfPush       = 0,  // psuh
    STViewCTransitionTypeOfModal      = 1,  // Model
    STViewCTransitionOfChild          = 2,  // addSubView/aadChildViewC
};
@interface STBaseViewC : UIViewController

#pragma mark *************************** Property **************************
@property(nonatomic,strong)  UIViewController           *recordSuperViewC;
@property(nonatomic,strong)  UIViewController           *recordLogicViewC;
@property(nonatomic,strong)  UIViewController           *recordUIViewC;
@property (nonatomic, strong)UITabBarController         *recordTabBarC;
@property (nonatomic,assign) BOOL                       hasNextPage;
@property (nonatomic,assign) NSInteger                  recordCurrentPage;
@property(nonatomic,assign)  STViewCTransitionType      stViewCTransitionType;   //Transition typ

#pragma mark *************************** Plublic ****************************
#pragma mark --- newViewC < STBaseViewC *>
/**
 * @brief:  new ViewC methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 */
+(STBaseViewC *)showSTBaseViewCOnSuperViewC:(UIViewController *)superViewC
                               andFrameRect:(CGRect)frameRect
                   andSTViewCTransitionType:(STViewCTransitionType)stViewCTransitionType
                                andComplete:(void(^)(BOOL finished,STBaseViewC *stBaseViewC))block;
#pragma mark ------- Refresh
#pragma mark --load refresh
/**
 * @brief:  If you need to refresh the effect,newViewC load this mehod.
 *
 * @attention: newViewC != nil
 */
#pragma mark ------- STRefresh
-(void)showSTRefreshTableView:(UITableView *)tableView
             andSTRefreshType:(STRefreshType)stRefreshType
       andSTRefreshHeaderType:(STRefreshHeaderType )stRefreshHeaderType
    andSTRefreshTimeLabHidden:(BOOL)timeLabHidden
   andSTRefreshStateLabHidden:(BOOL)stateLabHidden;
#pragma mark ------- show Request API
/**
 * @brief: refresh alter need to request API
 *
 * @attention: Refresh of API need to rewrite on subViewC.m file
 */
-(void)showAPIDataAndComplete:(void(^)(BOOL finished))block;
@end
