//
//  STPhotoViewC.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STPhotoViewC.h"

@interface STPhotoViewC ()

@end

@implementation STPhotoViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
                                andComplete:(void(^)(BOOL finished,STBaseViewC *stBaseViewC))block{
#pragma mark - exist/clear -清空和判断
    if (stViewCTransitionType == STViewCTransitionOfChild) {
        //1.exist
        if (!superViewC) {
            if (block) {
                block(NO,nil);
            }
            return nil;
        }
        //2.clear
        for(UIViewController *oneViewC in superViewC.childViewControllers){
            if ([oneViewC isKindOfClass:[self class]]) {
                [oneViewC removeFromParentViewController];
                [oneViewC.view removeFromSuperview];
            }
        }
    }
#pragma mark - ViewC /Logic/UI
    //1. ViewC
    STPhotoViewC *newViewC = [[STPhotoViewC alloc]initWithNibName:@"STPhotoViewC"
                                                                     bundle:nil];
    //2.logic
    STPhotoLogicViewC *newLogicViewC = (STPhotoLogicViewC *) [STPhotoLogicViewC showSTBaseViewCOnSuperViewC:newViewC
                                                                                                              andFrameRect:CGRectMake(0, 0, 0,0)
                                                                                                  andSTViewCTransitionType:STViewCTransitionOfChild
                                                                                                               andComplete:^(BOOL finished,
                                                                                                                             STBaseViewC *stBaseViewC) {
                                                                                                               }];
    //3. UI
    STPhotoUIViewC *newUIViewC = (STPhotoUIViewC *) [STPhotoUIViewC showSTBaseViewCOnSuperViewC:newViewC
                                                                                                  andFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                                                      andSTViewCTransitionType:STViewCTransitionOfChild
                                                                                                   andComplete:^(BOOL finished,
                                                                                                                 STBaseViewC *stBaseViewC) {
                                                                                                   }];
#pragma mark -sub/child
    if (stViewCTransitionType == STViewCTransitionOfChild) {
        //1.ViewC
        newViewC.view.frame = frameRect;
        //child
        [superViewC addChildViewController:newViewC];
        [superViewC.view addSubview:newViewC.view];
    }
#pragma mark - record -记录
    //ViewC
    newViewC.recordSuperViewC = superViewC;
    newViewC.recordLogicViewC = newLogicViewC;
    newViewC.recordUIViewC = newUIViewC;
    //logic
    newLogicViewC.recordSuperViewC = newViewC;
    newLogicViewC.recordUIViewC = newUIViewC;
    //UI
    newUIViewC.recordSuperViewC = newViewC;
    newUIViewC.recordUIViewC = newLogicViewC;
#pragma mark -delegate - 协议
    //Logic
    [newLogicViewC setDelegate:newViewC];
    //UI
    [newUIViewC setDelegate:newViewC];
    //
   // [newUIViewC.stDynamicView  setDelegate:newViewC];
#pragma mark - 预处理数据/初始化
   // [newUIViewC.stDynamicView setStDynamicType:STGoodsDynamic];
#pragma mark - 返回new ViewC
    //block
    if (block) {
        block(YES,newViewC);
    }
    //return
    return newViewC;
    
    
}

@end
