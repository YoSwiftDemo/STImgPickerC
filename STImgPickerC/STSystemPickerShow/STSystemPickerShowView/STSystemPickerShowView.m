//
//  STSystemPickerShowView.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STSystemPickerShowView.h"
#import "STTableBtnCell.h"
@implementation STSystemPickerShowView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self  showSetSubView];
}
-(void)showSetSubView{
    if(!self.dataSoureArray){
        self.dataSoureArray = @[].mutableCopy;
    }
    if (!self.tableView) {
        [self tableView];
    }
    if (!self.stNavView) {
        [self stNavView];
    }
    [self registerCell];
}
#pragma mark --
-(void)registerCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"STTableBtnCell" bundle:nil]
         forCellReuseIdentifier:@"STTableBtnCell"];
}
#pragma mark -- cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   STTableBtnCell *cell = [STTableBtnCell showCellWithTableView:tableView
                                                   forIndexPath:indexPath];
    [cell.singleBtn setTitle:self.dataSoureArray[indexPath.row] forState:UIControlStateNormal];
    return cell;
}
#pragma mark -- row height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
@end
