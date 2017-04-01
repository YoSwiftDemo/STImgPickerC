//
//  STImgPickerBaseViewC.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"

@interface STImgPickerBaseViewC : STBaseViewC

@property (nonatomic ,strong)NSMutableArray <UIImage *>*recordSelectImgMArray;  // record select img in mArray
@property (nonatomic ,strong)NSMutableArray <NSData *>*recordSelectVideoMArray; // record Video of nsdata in mArray
-(void)showSystemImgPickerC;
@end
