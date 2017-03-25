//
//  STShowUIBaseViewC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"
@protocol STShowUIBaseViewCDelegate <NSObject>

@optional

@end
@interface STShowUIBaseViewC : STBaseViewC
@property (weak, nonatomic)id<STShowUIBaseViewCDelegate>delegate;
@end
