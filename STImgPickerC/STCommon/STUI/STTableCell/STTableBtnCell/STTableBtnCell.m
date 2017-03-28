//
//  STTableBtnCell.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STTableBtnCell.h"

@implementation STTableBtnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.singleBtn.layer.cornerRadius = 3;
    self.singleBtn.layer.masksToBounds = YES;
    self.singleBtn.userInteractionEnabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
