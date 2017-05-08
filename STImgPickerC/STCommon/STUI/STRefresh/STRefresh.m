//
//  STRefresh.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/25.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STRefresh.h"
@implementation STRefresh
#pragma mark ********************* left cycle ********************
static STRefresh *signleton = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signleton = [super allocWithZone:zone];
    });
    return signleton;
}

+ (STRefresh *)shareManager
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
#pragma mark ********************* Public ************************
#pragma mark ------ load STRefresh
-(void)showSTRefreshTableView:(UITableView *)tableView
                 andSTRefreshType:(STRefreshType)stRefreshType
           andSTRefreshHeaderType:(STRefreshHeaderType )stRefreshHeaderType
        andSTRefreshTimeLabHidden:(BOOL)timeLabHidden
       andSTRefreshStateLabHidden:(BOOL)stateLabHidden
                 andDropDownBlock:(void(^)(void))dropDownBlock
                   andDropUpBlock:(void(^)(void))dropUpBlock{
#pragma mark  - Drop Down
    //STRefreshTypeDefault
    if (stRefreshType == STRefreshTypeDefault ||stRefreshType ==STRefreshTypeDropDown) {
        //block
        self.stRefreshDropDownBlock = dropDownBlock;
        if (stRefreshHeaderType == STRefreshHeaderTypeNormal) {
            //_normalheader
            if (!_normalHeader) {
                [self normalHeader];
            }
            _normalHeader.lastUpdatedTimeLabel.hidden = timeLabHidden;
            _normalHeader.stateLabel.hidden = stateLabHidden;
            tableView.mj_header = _normalHeader;
            tableView.mj_header.automaticallyChangeAlpha = YES;
            
        }
        //STRefreshHeaderTypeGif
        else{
            if (!_gifHeader) {
                [self gifHeader];
            }
            //_gifHeader animation
            [_gifHeader setImages:_idleImgMArray
                         forState:MJRefreshStateIdle];
            [_gifHeader setImages:_pullingImgMArray
                         forState:MJRefreshStatePulling];
            [_gifHeader setImages:_refreshingImgMArray
                         forState:MJRefreshStateRefreshing];
            _gifHeader.lastUpdatedTimeLabel.hidden = timeLabHidden;
            _gifHeader.stateLabel.hidden = stateLabHidden;
            tableView.mj_header = _gifHeader;
        }
        
    }
    
#pragma mark  - Drop Up
    if (stRefreshType == STRefreshTypeDefault || stRefreshType == STRefreshTypeDropUp) {
        //block
        self.stRefreshDropUpBlock = dropUpBlock;
        if (!_footer) {
            [self footer];
        }
        tableView.mj_footer = _footer;
    }
}
#pragma mark ********************* Setter ************************
#pragma mark  -- IdleImgMArray
-(void)setIdleImgMArray:(NSMutableArray<UIImage *> *)idleImgMArray{
    [_idleImgMArray removeAllObjects];
    _idleImgMArray = idleImgMArray.mutableCopy;
}
#pragma mark  -- PullingImgMArray
-(void)setPullingImgMArray:(NSMutableArray<UIImage *> *)pullingImgMArray{
    [pullingImgMArray removeAllObjects];
    _pullingImgMArray = pullingImgMArray.mutableCopy;
}
#pragma mark  -- RefreshingImgMArray
-(void)setRefreshingImgMArray:(NSMutableArray<UIImage *> *)refreshingImgMArray{
    [_refreshingImgMArray removeAllObjects];
    _refreshingImgMArray = refreshingImgMArray.mutableCopy;
}
#pragma mark ********************* Getter ************************
#pragma mark  -- normalHeader
-(MJRefreshNormalHeader *)normalHeader{
    if (!_normalHeader) {
        _normalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                         refreshingAction:@selector(dropDownBlockAction)];
    }
    return _normalHeader;
}
#pragma mark  -- gifHeader
-(MJRefreshGifHeader *)gifHeader{
    if (!_gifHeader) {
        _gifHeader =  [MJRefreshGifHeader headerWithRefreshingTarget:self
                                                    refreshingAction:@selector(dropDownBlockAction)];
    }
    return _gifHeader;
}
#pragma mark  -- footer
-(MJRefreshAutoNormalFooter *)footer{
    if (!_footer) {
        _footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self
                                                       refreshingAction:@selector(dropUpBlockAction)];
    }
    return _footer;
}
#pragma mark ********************* Private ************************
#pragma mark -- drop Down blcok
-(void)dropDownBlockAction{
    if (_stRefreshDropDownBlock) {
        _stRefreshDropDownBlock();
    }
}
#pragma mark -- drop up blcok
-(void)dropUpBlockAction{
    if (_stRefreshDropUpBlock) {
        _stRefreshDropUpBlock();
    }
}
@end
