//
//  ZCTopSelectView.h
//  xxoogo
//
//  Created by Huang Zhicong on 2018/4/28.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCMultiSelectButton.h"
@interface ZCTopSelectView : UIScrollView
@property(nonatomic,strong)NSMutableArray<ZCMultiSelectButton*> * btnArr;
@property(nonatomic,strong)UIView * bottomLine;
-(void)setButtonsWithArray:(NSArray*)array selectedIndex:(NSInteger)index andButtonWidth:(CGFloat)width;
@property(nonatomic,copy)void (^clickBlock)(NSInteger);

-(void)btnClick:(NSInteger)index;

-(void)setTopViewColor:(UIColor*)color selectedColor:(UIColor*)selectColor;
@end
