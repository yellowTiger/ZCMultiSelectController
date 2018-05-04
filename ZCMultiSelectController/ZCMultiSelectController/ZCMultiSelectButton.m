//
//  ZCMultiSelectButton.m
//  xxoogo
//
//  Created by Huang Zhicong on 2018/4/28.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import "ZCMultiSelectButton.h"

@implementation ZCMultiSelectButton

///init方法内部会自动调用-(instancetype)initWithFrame:(CGRect)frame  方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:15];
    }
    return self;
}
/**
 * 这个方法专门用来布局子控件，一般在这里设置子控件的frame
 * 当控件本身的尺寸发生改变的时候，系统会自动调用这个方
 */
-(void)layoutSubviews{
    // 一定要调用super方法
    [super layoutSubviews];
    
}

@end
