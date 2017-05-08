//
//  STImgPickerBaseC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/26.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface STImgPickerBaseC : STBaseViewC
@property (nonatomic, strong)TZImagePickerController *tzImagePickerController;// 第三方照片、视频选择器
@property(nonatomic, strong)UIImagePickerController *imgPickerC;// 系统照片.视频选择器
@end
