//
//  STNavView.h
//  FanweApp
//
//  Created by 岳克奎 on 17/3/6.
//  Copyright © 2017年 xfg. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol STNavViewDelegate<NSObject>
@optional
-(void)showLeftBtnEventResponseOfSTNavView;
@end
@interface STNavView : UIView<XXNibBridge>
@property (weak, nonatomic) IBOutlet UIButton  *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton  *rightBtn;
@property (weak, nonatomic) IBOutlet UIView    *sparatorView;//分割线
@property (weak, nonatomic) IBOutlet UILabel   *titleLab;    //标题
@property (weak, nonatomic)id<STNavViewDelegate>delegate;
@end
