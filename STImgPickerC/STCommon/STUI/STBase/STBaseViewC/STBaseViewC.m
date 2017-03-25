//
//  STBaseViewC.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/25.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"

@interface STBaseViewC ()

@end

@implementation STBaseViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark *************************** Plublic ****************************
#pragma mark --- newViewC < STBaseViewC *>
+(STBaseViewC *)showSTBaseViewCOnSuperViewC:(UIViewController *)superViewC
                               andFrameRect:(CGRect)frameRect
                   andSTViewCTransitionType:(STViewCTransitionType)stViewCTransitionType
                                andComplete:(void(^)(BOOL finished,STBaseViewC *stBaseViewC))block{
    //need to rewrite on subViewC
    if (block) {
        block(YES,nil);
    }
    return nil;
}
#pragma mark ------- show Request API
-(void)showAPIDataAndComplete:(void(^)(BOOL finished))block{
    // subview rewite
}
#pragma mark ***************************** BaseFuncationSet  *********************************
#pragma mark ------- STRefresh
-(void)showSTRefreshTableView:(UITableView *)tableView
             andSTRefreshType:(STRefreshType)stRefreshType
       andSTRefreshHeaderType:(STRefreshHeaderType )stRefreshHeaderType
    andSTRefreshTimeLabHidden:(BOOL)timeLabHidden
   andSTRefreshStateLabHidden:(BOOL)stateLabHidden {
    __weak typeof(self)weak_Self = self;
    [[STRefresh shareManager] showSTRefreshTableView:tableView
                                    andSTRefreshType:stRefreshType
                              andSTRefreshHeaderType:stRefreshHeaderType
                           andSTRefreshTimeLabHidden:timeLabHidden
                          andSTRefreshStateLabHidden:stateLabHidden
                                    andDropDownBlock:^{
                                        weak_Self.hasNextPage = 1;
                                        [self showAPIDataAndComplete:^(BOOL finished) {
                                            if ([tableView.mj_header isRefreshing]) {
                                                [tableView.mj_header endRefreshing];
                                            }
                                        }];
                                                      }
                                      andDropUpBlock:^{
                                          if (_hasNextPage == YES) {
                                              _recordCurrentPage++;
                                                [self showAPIDataAndComplete:^(BOOL finished) {
                                                    if (finished) {
                                                        
                                                    }else{
                                                        _recordCurrentPage--;
                                                    }
                                                    if ([tableView.mj_footer isRefreshing]) {
                                                        [tableView.mj_footer endRefreshing];
                                                    }
                                                }];
                                          }
    }];
}
#pragma mark -----IQKeyboardManager
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [IQKeyboardManager sharedManager].enable = YES; //YES == Open IQKeyboard
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 100.0f;
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

@end
