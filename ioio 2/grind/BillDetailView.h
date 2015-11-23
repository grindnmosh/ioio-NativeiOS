//
//  BillDetailView.h
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillsaObject.h"
#import <iAd/iAd.h>


@interface BillDetailView : UIViewController <ADBannerViewDelegate>
{
    BillsaObject *listArray;
}
@property (weak, nonatomic) IBOutlet UILabel *presentDate;
@property (weak, nonatomic) IBOutlet UILabel *presentName;
@property (weak, nonatomic) IBOutlet UILabel *presentAmount;
@property (weak, nonatomic) IBOutlet UILabel *presentPhone;
@property (weak, nonatomic) IBOutlet UIButton *presentURL;
@property (weak, nonatomic) IBOutlet UITextView *presentComment;

-(IBAction)onClick:(UIButton*)button;

@property (strong, nonatomic) BillsaObject *insertName;

@end
