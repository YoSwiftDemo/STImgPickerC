//
//  STShowBaseViewC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"
#import "STShowLogicBaseViewC.h"
#import "STShowUIBaseViewC.h"
#pragma mark- delegate
/**
 *UIImagePickerController -->< UINavigationControllerDelegate,UIImagePickerControllerDelegate>-->Photo album photos or video
 *
 *
 *
 */
@interface STShowBaseViewC : STBaseViewC < UINavigationControllerDelegate,UIImagePickerControllerDelegate,STShowLogicBaseViewCDelegate,STShowUIBaseViewCDelegate>
#pragma mark-property
@property (strong, nonatomic)UIImagePickerController *imagePickerController;//system imgPC

@end
