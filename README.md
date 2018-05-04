# ZCMuliSelectController
How To Use:

#import "ZCMultiSelectController.h" and inherit ZCMultiSelectController

    //title Array Of Buttons
    NSArray *titleArr=@[@"First",@"Second",@"Three",@"Four",@"Five"];
    
    //the ChildController Array
    NSMutableArray* controllerArr = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        [controllerArr addObject:[[OneTableViewController alloc]init]];
    }
    
    //This is done;
    [self setUp:titleArr controllerArr:controllerArr];
    
    //if you want to change buttons color
    //[self setTopViewColor:[UIColor grayColor] selectedColor:[UIColor orangeColor]];
