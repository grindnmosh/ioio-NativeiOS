//
//  NewBillView.h
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavingBills.h"

@interface NewBillView : UIViewController 
{
    SavingBills *optSingleton;
    NSDate *due;
    NSString *dateString;
}

//default timezone
+(void)setDefaultTimeZone:(NSTimeZone *)aTimeZone;

//minimum date property
@property (nonatomic, retain) NSDate *minimumDate;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *amt;
@property (weak, nonatomic) IBOutlet UITextField *ph;
@property (weak, nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UITextField *comm;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;


-(IBAction)onClick:(UIButton*)button;

@end
