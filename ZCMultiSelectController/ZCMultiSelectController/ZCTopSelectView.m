//
//  ZCTopSelectView.m
//  xxoogo
//
//  Created by Huang Zhicong on 2018/4/28.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import "ZCTopSelectView.h"

#import "UIView+UIView_ZCExtension.h"

@interface ZCTopSelectView()

@property(nonatomic,strong)ZCMultiSelectButton * selectedBtn;
@property(nonatomic,assign)CGFloat btnWidth;
@end
@implementation ZCTopSelectView
//-(UIView *)bottomLine{
//    if (_bottomLine==nil) {
//        _bottomLine=[[UIView alloc]init];
//        _bottomLine.backgroundColor=[UIColor redColor];
//    }
//    return _bottomLine;
//}
-(NSMutableArray *)btnArr{
    if (_btnArr==nil) {
        _btnArr=[NSMutableArray array];
    }
    return _btnArr;
}
///init方法内部会自动调用-(instancetype)initWithFrame:(CGRect)frame  方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        

 
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
-(void)setButtonsWithArray:(NSArray *)array selectedIndex:(NSInteger)index andButtonWidth:(CGFloat)width{
    self.btnWidth=width;
    for (NSInteger i=0 ;i<array.count;i++) {
        ZCMultiSelectButton* btn=[[ZCMultiSelectButton alloc]init];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
       
        btn.index=i;
        if (i==index) {
            btn.selected=YES;
            self.selectedBtn=btn;
        }
        [self.btnArr addObject:btn];
        
        btn.frame=CGRectMake(i*width, 0, width, self.frame.size.height-2);
        [self addSubview:btn];
    }
   
    self.contentSize=CGSizeMake(array.count*width, self.frame.size.height);
    self.showsHorizontalScrollIndicator = NO;
  
    
        _bottomLine=[[UIView alloc]init];
        _bottomLine.backgroundColor=[UIColor redColor];
     
    self.bottomLine.xmg_x=(width-50)/2;
        self.bottomLine.xmg_size=CGSizeMake(50, 2);
        self.bottomLine.xmg_y=self.frame.size.height-2;
        [self addSubview:self.bottomLine];
    
}
-(void)buttonClick:(ZCMultiSelectButton*)btn{
    self.selectedBtn.selected=NO;
    btn.selected=YES;
    self.selectedBtn=btn;
    self.clickBlock(btn.index);
    
    
    // 移动下划线
    [UIView animateWithDuration:0.25 animations:^{
        // 宽度
        //        self.underline.xmg_width = titleButton.titleLabel.xmg_width + XMGCommonMargin;
        // 中心点
        self.bottomLine.xmg_centerX = btn.xmg_centerX;
        CGFloat SCREENWIDTW = [[UIScreen mainScreen] bounds].size.width;
        if (btn.frame.origin.x + btn.frame.size.width>SCREENWIDTW) {
             [self setContentOffset:CGPointMake(btn.xmg_x -self.btnWidth, 0)];
        }else{
            [self setContentOffset:CGPointMake(0, 0)];
        }
    }];
    
}

-(void)btnClick:(NSInteger)index{
    self.selectedBtn.selected=NO;
    self.btnArr[index].selected=YES;
    self.selectedBtn=self.btnArr[index];
    self.clickBlock(index);
    
    
    // 移动下划线
    [UIView animateWithDuration:0.25 animations:^{
        // 宽度
//        self.underline.xmg_width = titleButton.titleLabel.xmg_width + XMGCommonMargin;
        // 中心点
        self.bottomLine.xmg_centerX = self.btnArr[index].xmg_centerX;
        CGFloat SCREENWIDTW = [[UIScreen mainScreen] bounds].size.width;
       
        if (self.btnWidth*(index+1)>SCREENWIDTW) {
            [self setContentOffset:CGPointMake(self.btnArr[index].xmg_x-self.btnWidth, 0)];
        }else{
            [self setContentOffset:CGPointMake(0, 0)];
        }
    }];
    
}
-(void)setTopViewColor:(UIColor*)color selectedColor:(UIColor*)selectColor{
    for (UIButton * btn in self.btnArr) {
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn setTitleColor:selectColor forState:UIControlStateSelected];
    }
    _bottomLine.backgroundColor=selectColor;
}
@end
