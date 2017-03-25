//
//  STShowBaseViewC.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STShowBaseViewC.h"

@interface STShowBaseViewC ()

@end

@implementation STShowBaseViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -----------------------------------------Public Method
#pragma mark ------show Photo album
+(void)showPhotoAlbumOfSTSystemPhotoAlbumSelectType:(STSystemPhotoAlbumSelectType)stSystemPhotoAlbumSelectType
                                        andComplete:(void(^)(BOOL finished))block{
    #pragma mark - select -Photo
    if (stSystemPhotoAlbumSelectType == STSystemPhotoAlbumSelectPhoto ) {
        
    }
    #pragma mark - select -Video
    else if (stSystemPhotoAlbumSelectType == STSystemPhotoAlbumSelectVideo){
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        }
        
    }
    #pragma mark - select -Unknown type or not set
    else{
        NSLog(@"error");
    }
    
}
#pragma mark ----------------------------------------- setter
#pragma mark ----------------------------------------- getter
#pragma mark ------------- imagePickerController
-(UIImagePickerController *)imagePickerController{
        if (!_imagePickerController) {
            //new
            _imagePickerController = [UIImagePickerController new];
            //delegate
            [_imagePickerController setDelegate:self];
            //
        }
        return _imagePickerController;
}


@end
