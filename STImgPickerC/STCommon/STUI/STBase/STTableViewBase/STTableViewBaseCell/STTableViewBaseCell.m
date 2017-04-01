//
//  STTableViewBaseCell.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STTableViewBaseCell.h"
#import <POP.h>
@implementation STTableViewBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



+(instancetype)showCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = NSStringFromClass([self class]);
    id cell = [tableView dequeueReusableCellWithIdentifier:ID
                                              forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:ID owner:nil options:nil] lastObject];
    }
    return cell;
}

#pragma mark --- animated 
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [self.contentView pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
    } else {
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        sprintAnimation.springBounciness = 20.f;
        [self.contentView  pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
    }
}
@end
