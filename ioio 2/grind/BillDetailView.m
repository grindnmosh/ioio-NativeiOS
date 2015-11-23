//
//  BillDetailView.m
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "BillDetailView.h"
#import "SVWebViewController.h"

@interface BillDetailView ()

@end

@implementation BillDetailView

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
    self.presentDate.text = _insertName.bDate;
    self.presentName.text = _insertName.bName;
    self.presentAmount.text = _insertName.bAmount;
    self.presentPhone.text = _insertName.bPhone;
    [self.presentURL setTitle:_insertName.bURL forState:UIControlStateNormal];
    self.presentComment.text = _insertName.bComments;
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
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[NSString stringWithFormat:@"http://%@", _insertName.bURL]];
        [self presentViewController:webViewController animated:YES completion:NULL];
    }
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
}


@end
