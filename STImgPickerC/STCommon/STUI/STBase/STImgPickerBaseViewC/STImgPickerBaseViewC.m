//
//  STImgPickerBaseViewC.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/27.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STImgPickerBaseViewC.h"
#import <Photos/Photos.h>
#import <MediaPlayer/MediaPlayer.h>
@interface STImgPickerBaseViewC ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation STImgPickerBaseViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ------------------------- System
-(void)showSystemImgPickerC{
     UIImagePickerController *imgPickerCtrl = [[UIImagePickerController alloc] init];
    imgPickerCtrl.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] == YES) {
        
        imgPickerCtrl.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

        //弹出模态
        [self presentViewController:imgPickerCtrl animated:YES
                         completion:^{
                             
                         }];
        
    }else{
        
       
        return;
    }

}

@end
