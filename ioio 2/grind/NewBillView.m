//
//  NewBillView.m
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "NewBillView.h"

@interface NewBillView ()

@end

@implementation NewBillView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    optSingleton = [SavingBills singleOBJ];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        due = _date.date;
        //format date on unchanged UIDatePicker
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE, MMM dd, yyy"];
        dateString = [dateFormatter stringFromDate:due];
            if ([_name.text  isEqual: @""])
            {
                //missing info alert
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Product Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }
            else if ([_amt.text  isEqual: @""])
            {
                //missing info alert
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Product Description" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }
            else
            {
                //save to singleton
                optSingleton.billName = _name.text;
                optSingleton.billAmount = _amt.text;
                optSingleton.billDate = dateString;
                optSingleton.billPhone = _ph.text;
                optSingleton.billURL = _url.text;
                optSingleton.billComments = _comm.text;
                //paas images in ver 4.0
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        

    }
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

+ (void)setDefaultTimeZone:(NSTimeZone *)aTimeZone
{
    [NSTimeZone localTimeZone];
}


-(IBAction)onChange:(id)sender
{
    //minimum date
    _date.minimumDate = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    
}


@end
