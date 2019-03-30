//
//  ZCMultiSelectController.m
//  xxoogo
//
//  Created by Huang Zhicong on 2018/4/28.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import "ZCMultiSelectController.h"
#import "ZCTopSelectView.h"
#import "UIView+UIView_ZCExtension.h"

CGFloat topViewHeight=45;
@interface ZCMultiSelectController ()<UIScrollViewDelegate>
@property(nonatomic,strong)ZCTopSelectView * topView;
//@property(nonatomic,weak)id<ZCMultiSelectControllerDelegate> delegate;

/** 用来显示所有子控制器view的scrollView */
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation ZCMultiSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setUp:(NSArray<NSString*>*)titleArr controllerArr:(NSArray<UIViewController*>*)controllerArr buttonWidth:(CGFloat)btnWidth{
    CGFloat SCREENWIDTH = [[UIScreen mainScreen] bounds].size.width;
    CGFloat SCREENHEIGHT = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat Height_NavBar;
    if (self.navigationController.isNavigationBarHidden){
        Height_NavBar=[[UIApplication sharedApplication] statusBarFrame].size.height;
    }else{
        Height_NavBar = [[UIApplication sharedApplication] statusBarFrame].size.height+44;
    }
    __weak typeof(self) wself = self;
    self.topView=[[ZCTopSelectView alloc]initWithFrame:CGRectMake(0, Height_NavBar, SCREENWIDTH, topViewHeight)];
    __weak typeof(self) weakSelf = self;
    self.topView.clickBlock = ^(NSInteger index) {
        CGPoint offset = weakSelf.scrollView.contentOffset;
        offset.x = index * self.scrollView.xmg_width;
        [weakSelf.scrollView setContentOffset:offset animated:YES];
        // 子控制器的索引
        NSInteger cIndex = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
        // 取出对应位置的子控制器
        wself.currentController= wself.childViewControllers[cIndex];
    };
    [self.topView setButtonsWithArray:titleArr selectedIndex:0 andButtonWidth:btnWidth];
    [self.view addSubview:self.topView];
    
    for (NSInteger i=0; i<controllerArr.count; i++) {
        [self addChildViewController:controllerArr[i]];
    }
    [self setupScrollView:controllerArr];
    // 默认添加一个子控制器的view到scrollView中
    [self addChildVcViewIntoScrollView];
    
}

/**
 *  添加中间的scrollView
 */
- (void)setupScrollView:(NSArray<UIViewController*>*)arr
{
    // 不要自动设置内边距
    if(@available(iOS 11.0,*)){
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    
    CGFloat SCREENHEIGHT = [[UIScreen mainScreen] bounds].size.height;
    CGFloat Height_NavBar;
    if (self.navigationController.isNavigationBarHidden){
        Height_NavBar=[[UIApplication sharedApplication] statusBarFrame].size.height;
    }else{
        Height_NavBar = [[UIApplication sharedApplication] statusBarFrame].size.height+44;
    }
    
    CGFloat topSpace  = topViewHeight + Height_NavBar;
    scrollView.xmg_y= topSpace;
    CGFloat bottomspace = self.tabBarController.tabBar.isHidden?0:49;
    scrollView.xmg_height = self.view.xmg_height-(topSpace + bottomspace);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    // 设置scrollView的内容宽度（左右滚动）
    CGSize contentSize = scrollView.contentSize;
    contentSize.width = arr.count * scrollView.frame.size.width;
    scrollView.contentSize = contentSize;
    
    scrollView.pagingEnabled = YES;
    
    self.scrollView = scrollView;
}
/**
 *  添加对应位置的子控制器view到scrollView中
 */
- (void)addChildVcViewIntoScrollView
{
    // 子控制器的索引
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    // 取出对应位置的子控制器
    UIViewController *childVc = self.childViewControllers[index];
    self.currentController=childVc;
    // 如果这个子控制器的view已经添加过了，那么直接返回
    if (childVc.isViewLoaded) return;
    
    // 添加子控制器的view到scrollView
    [self.scrollView addSubview:childVc.view];
    // 设置子控制器view的frame
    childVc.view.frame = self.scrollView.bounds;
}


#pragma mark - <UIScrollViewDelegate>
/**
 *  当scrollView停止滚动时调用
 *  前提：通过调用scrollView的以下2个方法导致停止滚动
 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcViewIntoScrollView];
}

/**
 *  当scrollView停止滚动时调用
 *  前提：通过拖拽的方式让scrollView滚动后减速完毕
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 按钮的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    [self.topView btnClick:index];
    // 添加对应位置的子控制器view到scrollView中
    [self addChildVcViewIntoScrollView];
}

-(void)setTopViewColor:(UIColor*)color selectedColor:(UIColor*)selectColor{
    [self.topView setTopViewColor:color selectedColor:selectColor];
}

@end

