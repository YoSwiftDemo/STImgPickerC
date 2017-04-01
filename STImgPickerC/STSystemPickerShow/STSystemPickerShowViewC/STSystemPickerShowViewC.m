//
//  STSystemPickerShowViewC.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STSystemPickerShowViewC.h"

@interface STSystemPickerShowViewC ()<STTableViewBaseViewDelegate,STNavViewDelegate>

@end

@implementation STSystemPickerShowViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(STSystemPickerShowView *)stSystemPickerShowView{
    if (!_stSystemPickerShowView) {
        _stSystemPickerShowView = (STSystemPickerShowView *) [STSystemPickerShowView showSTBaseViewOnSuperView:self.view andFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) andComplete:^(BOOL finished, STBaseView *stBaseView) {
            
        }];
        _stSystemPickerShowView.backgroundColor = [UIColor redColor];
        [_stSystemPickerShowView setBaseDelegate:self];
        [_stSystemPickerShowView.stNavView setDelegate:self];
        _stSystemPickerShowView.stNavView.leftBtn.hidden = NO;
        [_stSystemPickerShowView.stNavView.leftBtn  setTitle:@"back"
                                                    forState:UIControlStateNormal];
        [_stSystemPickerShowView.stNavView.leftBtn setTitleColor:[UIColor redColor]
                                                         forState:UIControlStateNormal];
    }
    return _stSystemPickerShowView;
}
#pragma mark **************************** Delegate  *********************
#pragma mark -----------<STTableViewBaseViewDelegate>
#pragma mark --tableview did select
-(void)showTableViewDidSelectIndexpath:(NSIndexPath *)indexPath andSTTableViewBaseView:(STTableViewBaseView *)stTableViewBaseView{
    if (indexPath.section == 0) {
        [self showSystemImgPickerC];
    }
}
#pragma mark -----------<STNavViewDelegate>
#pragma mark -- leftBtn
-(void)showLeftBtnEventResponseOfSTNavView:(STNavView *)stNavView{
    
}

#pragma mark **************************** API **************************
-(void)showAPIDataAndComplete:(void (^)(BOOL))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) {
            block(YES);
        }
    });
}
@end
