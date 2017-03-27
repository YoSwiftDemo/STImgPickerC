//
//  STPopMenuManager.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HyPopMenuView.h"
typedef NS_ENUM(NSInteger, STPopMenuShowState) {
    STPopMenuHidden    = 0, // dimiss PopMenu
    STPopMenuShow      = 1, //show   PopMenu
};
@interface STPopMenuManager : NSObject <HyPopMenuViewDelegate>
#pragma mark ************************** Property   ***************************
@property(nonatomic,assign) STPopMenuShowState  stPopMenuShowState;//though setter control popmenu state
@property (nonatomic, strong) HyPopMenuView     *popMenuView;      // popMenuView of Third encapsulation，need to rewrite Getter
#pragma mark ************************** Left Cycle ***************************
+(STPopMenuManager *)sharePopMenuCenter;                           //single -> load STPopMenuManager
@end
