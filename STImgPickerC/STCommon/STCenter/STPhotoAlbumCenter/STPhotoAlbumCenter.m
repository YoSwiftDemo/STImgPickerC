//
//  STPhotoAlbumCenter.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/16.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STPhotoAlbumCenter.h"

@implementation STPhotoAlbumCenter
#pragma mark -life cycle ------------------------------------------ Left Cycle
static STPhotoAlbumCenter *signleton = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signleton = [super allocWithZone:zone];
    });
    return signleton;
}

+ (STPhotoAlbumCenter *)shareManager
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
@end
