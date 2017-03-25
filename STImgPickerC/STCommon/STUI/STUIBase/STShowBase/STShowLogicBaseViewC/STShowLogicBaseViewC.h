//
//  STShowLogicBaseViewC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"

@protocol STShowLogicBaseViewCDelegate <NSObject>

@optional

@end
@interface STShowLogicBaseViewC : STBaseViewC
@property (weak, nonatomic)id<STShowLogicBaseViewCDelegate>delegate;
@end
