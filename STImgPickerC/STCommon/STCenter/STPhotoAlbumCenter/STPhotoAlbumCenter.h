//
//  STPhotoAlbumCenter.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/16.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STPhotoAlbumCenter : NSObject
#pragma mark - LiveCenterManager
/**
 * @brief： STPhotoAlbumCenter  :single
 */
+ (STPhotoAlbumCenter *)shareManager;
@end
