 //
//  STPopMenuManager.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STPopMenuManager.h"
#import "STSystemPickerShowViewC.h"
@implementation STPopMenuManager
#pragma mark ************************** Left Cycle ***************************
/**
 * @brief: single
 *
 * @discussion:
 */
static STPopMenuManager *signleton = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signleton = [super allocWithZone:zone];
    });
    return signleton;
}
+(STPopMenuManager *)sharePopMenuCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signleton = [[self alloc] init];
    });
    
    return signleton;
}
+ (id)copyWithZone:(struct _NSZone *)zone
{
    return signleton;
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return signleton;
}

#pragma mark ************************** Delegate *************************
#pragma mark ------------------ <HyPopMenuViewDelegate>
#pragma mark ------- didSelect
-(void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index{
    //目前我写的是6个
    if (index>5) {
        return;
    }
    switch (index) {
        case 0:
            [self showSTSystemViewC];
            break;
        case 1:
            //红包动态
            break;
        default:
            break;
            
    }
}
#pragma mark ************************** Private ***************************
#pragma mark ------ show  PopView
-(void)showPopView{
    // _popMenuView
    if (!_popMenuView) {
        [self popMenuView];
    }
    
    //show data
    NSMutableArray *tempDSMArray = @[].mutableCopy;
    NSMutableArray *picStrMArray = @[@"PopMenuCenter_System",
                                     @"PopMenuCenter_Third",].mutableCopy;
    NSMutableArray *titleStrMArray = @[@"System ",
                                       @"Third ",].mutableCopy;
    if (picStrMArray.count == titleStrMArray.count) {
        for (int i = 0;i<picStrMArray.count;i++) {
            [tempDSMArray addObject: [PopMenuModel
                                      allocPopMenuModelWithImageNameString:picStrMArray[i]
                                      AtTitleString:titleStrMArray[i]
                                      AtTextColor:[UIColor grayColor]
                                      AtTransitionType:PopMenuTransitionTypeSystemApi
                                      AtTransitionRenderingColor:nil]];
        }
    }
    //ds
    _popMenuView.dataSource = tempDSMArray.copy;
    //显示
    [_popMenuView openMenu];
}
#pragma mark ------ show STSystem select img/Videxo ViewC
-(void)showSTSystemViewC{
    STSystemPickerShowViewC *stSystemPickerShowViewC = (STSystemPickerShowViewC *)[STSystemPickerShowViewC showSTBaseViewCOnSuperViewC:nil
                                                                                                                          andFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                                                                              andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                                                                           andComplete:^(BOOL finished,
                                                                                                                                         STBaseViewC *stBaseViewC) {
        
    }];
    if (!stSystemPickerShowViewC) {
        return;
    }
    
    
       stSystemPickerShowViewC.stSystemPickerShowView = [stSystemPickerShowViewC stSystemPickerShowView];
    [stSystemPickerShowViewC showSTRefreshTableView: [stSystemPickerShowViewC.stSystemPickerShowView tableView]
                                   andSTRefreshType:STRefreshTypeDefault
                             andSTRefreshHeaderType:STRefreshHeaderTypeNormal
                          andSTRefreshTimeLabHidden:NO
                         andSTRefreshStateLabHidden:NO];
       [stSystemPickerShowViewC.stSystemPickerShowView setDataSoureArray:@[@"photo",@"video",@"UplaodToOSS"].mutableCopy];
    UINavigationController *nav =  [[UINavigationController alloc]initWithRootViewController:stSystemPickerShowViewC];
    nav.navigationBarHidden = YES;
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
}
#pragma mark ------ show STThird select img/Videxo ViewC
-(void)showSTThirdViewC{
    
}
#pragma mark ------
#pragma mark ************************** Setter  ***************************
#pragma mark ----- stPopMenuShowState
-(void)setStPopMenuShowState:(STPopMenuShowState)stPopMenuShowState{
    //_popMenuView
    if (!_popMenuView) {
        [self popMenuView];
    }
    
    switch (stPopMenuShowState) {
        case STPopMenuHidden:
            [_popMenuView closeMenu];
            
            break;
        case STPopMenuShow:
            [self showPopView];
            break;
            
        default:
            break;
    }
    _stPopMenuShowState = stPopMenuShowState;
}
#pragma mark ************************** Getter  ***************************
#pragma mark ---- PopMenuView
-(HyPopMenuView *)popMenuView{
    if (!_popMenuView) {
        _popMenuView = [HyPopMenuView sharedPopMenuManager];
        _popMenuView.delegate = self;  //delegate
        _popMenuView.popMenuSpeed = 12.0f;
        _popMenuView.automaticIdentificationColor = YES;
        _popMenuView.animationType = HyPopMenuViewAnimationTypeSina;
        _popMenuView.backgroundType = HyPopMenuViewBackgroundTypeLightBlur;
        
    }
    return _popMenuView;
}
@end
