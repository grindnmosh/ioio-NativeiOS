//
//  ViewController.h
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavingBills.h"
#import "BillsaObject.h"
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>
{
    IBOutlet UITableView *onChart;
    
    SavingBills *optSingleton;
    BillsaObject *listArray;
    
    
    NSMutableArray *list;
    NSMutableArray *continuous1;
    NSMutableArray *continuous2;
    NSMutableArray *continuous3;
    NSMutableArray *continuous4;
    NSMutableArray *continuous5;
    NSMutableArray *continuous6;
    NSMutableArray *namedBill;
    NSMutableArray *amtBill;
    NSMutableArray *datedBill;
    NSMutableArray *phoneBill;
    NSMutableArray *urlBill;
    NSMutableArray *comBill;
    
    NSString *billName;
    NSString *billAmount;
    NSString *billDate;
    NSString *billPhone;
    NSString *billURL;
    NSString *billComments;
}

-(IBAction)onClick:(UIButton*)button;

@end
