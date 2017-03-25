//
//  STBaseViewC.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
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

#pragma mark ----------------------- Plublic
#pragma mark - new < STBaseViewC *>
/**
 * @brief:  new ViewC methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 *
 * @other: m:Avoid warning to write this way, you can choose to don't write
 */
+(STBaseViewC *)showSTBaseViewCOnSuperViewC:(UIViewController *)superViewC
                               andFrameRect:(CGRect)frameRect
                   andSTViewCTransitionType:(STViewCTransitionType)stViewCTransitionType
                                andComplete:(void(^)(BOOL finished,
                                                     STBaseViewC *stBaseViewC))block{
    if (block) {
        block(NO,nil);
    }
    return nil;
}

@end
