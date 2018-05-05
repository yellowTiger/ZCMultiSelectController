# ZCMuliSelectController 
![image](https://github.com/yellowTiger/ZCMuliSelectController/blob/master/demoPic.png) 
![image](https://github.com/yellowTiger/ZCMuliSelectController/blob/master/333.gif)  
How To Use:如何使用

#import "ZCMultiSelectController.h" and inherit(继承) ZCMultiSelectController

    //title Array Of Buttons  按钮标题的数组
      
   NSArray *titleArr=@[@"First",@"Second",@"Three",@"Four",@"Five"];
    
 
    //the ChildController Array 子控制器的数组
    
    NSMutableArray* controllerArr = [NSMutableArray array];
    
    
    for (int i=0; i<5; i++) {
    
        [controllerArr addObject:[[OneTableViewController alloc]init]];
        
    }
    
    //This is done;一行代码搞定
    
    [self setUp:titleArr controllerArr:controllerArr];
    
    
    //if you want to change buttons color 改按钮颜色在这里改
    
    //[self setTopViewColor:[UIColor grayColor] selectedColor:[UIColor orangeColor]];
