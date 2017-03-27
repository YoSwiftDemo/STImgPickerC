//
//  ViewController.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/14.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.showPopMenuBtn.layer.cornerRadius  =  self.showPopMenuBtn.frame.size.width/2.f;
    self.showPopMenuBtn.layer.masksToBounds = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSTPopMenu:(UIButton *)sender {
    STPopMenuManager *manaager = [STPopMenuManager sharePopMenuCenter];
    [manaager setStPopMenuShowState:STPopMenuShow];
}




@end
