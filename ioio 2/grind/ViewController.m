//
//  ViewController.m
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "BillDetailView.h"
#import "BillsaObject.h"
#import "SVWebViewController.h"

@interface ViewController ()
{
    BillsaObject *toInsertName;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //singleton calls
    optSingleton = [SavingBills singleOBJ];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (defaults != nil);
    {
        namedBill = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedBill"] mutableCopy];
        amtBill = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedAmt"] mutableCopy];
        datedBill = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedDate"] mutableCopy];
        phoneBill = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedPhone"] mutableCopy];
        urlBill = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedURL"] mutableCopy];
        comBill = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedComments"] mutableCopy];
        
        for (int i = 0; i < [namedBill count]; i++)
        {
            billName = [namedBill objectAtIndex:i];
            billAmount = [amtBill objectAtIndex:i];
            billDate = [datedBill objectAtIndex:i];
            billPhone = [phoneBill objectAtIndex:i];
            billURL = [urlBill objectAtIndex:i];
            billComments = [comBill objectAtIndex:i];
     
            if (billName != nil)
            {
                BillsaObject *load = [[BillsaObject alloc] initWithBill:billName amount:billAmount date:billDate comments:billComments url:billURL phone:billPhone];
                BillsaObject *database = [BillsaObject sharedDataArray];
                list = database.bills;
                if (list != nil)
                {
                    [list addObject:load];
                }
                listArray = [BillsaObject sharedDataArray];
                
            }
        }
        [onChart reloadData];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  ^{
                      
                      
                  });
    //check for previous data
    
    
    //set row height
    self->onChart.rowHeight = 60.0f;
    
    //set editing to off on load
    [onChart setEditing:false animated:true];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    //singleton data from EventsViewController
    NSString *named = [optSingleton billName];
    NSString *amount = [optSingleton billAmount];
    NSString *date = [optSingleton billDate];
    NSString *phone = [optSingleton billPhone];
    NSString *url = [optSingleton billURL];
    NSString *comments = [optSingleton billComments];
    
    if (named != nil)
    {
        BillsaObject *load = [[BillsaObject alloc] initWithBill:named amount:amount date:date comments:comments url:url phone:phone];
        BillsaObject *database = [BillsaObject sharedDataArray];
        list = database.bills;
        if (list != nil)
        {
            [list addObject:load];
        }
        listArray = [BillsaObject sharedDataArray];
        [onChart reloadData];
    }
    
    
    optSingleton.billName = nil;
    optSingleton.billAmount = nil;
    optSingleton.billDate = nil;
    optSingleton.billPhone = nil;
    optSingleton.billURL = nil;
    optSingleton.billComments = nil;
    
    
    [onChart reloadData];
    if ([listArray bills] != nil) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (defaults != nil)
        {
            int im = 0;
            continuous1 =[[NSMutableArray alloc] init];
            continuous2 =[[NSMutableArray alloc] init];
            continuous3 =[[NSMutableArray alloc] init];
            continuous4 =[[NSMutableArray alloc] init];
            continuous5 =[[NSMutableArray alloc] init];
            continuous6 =[[NSMutableArray alloc] init];
            for (int i =0; i < [listArray.bills count]; i++)
            {
                
                NSString *load1 = [[listArray.bills objectAtIndex:i] bName];
                NSString *load2 = [[listArray.bills objectAtIndex:i] bAmount];
                NSString *load3 = [[listArray.bills objectAtIndex:i] bDate];
                NSString *load4 = [[listArray.bills objectAtIndex:i] bPhone];
                NSString *load5 = [[listArray.bills objectAtIndex:i] bURL];
                NSString *load6 = [[listArray.bills objectAtIndex:i] bComments];
                im++;
                if (listArray.bills != nil)
                {
                    [continuous1 addObject:load1];
                    [continuous2 addObject:load2];
                    [continuous3 addObject:load3];
                    [continuous4 addObject:load4];
                    [continuous5 addObject:load5];
                    [continuous6 addObject:load6];
                }
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:continuous1 forKey:@"filedBill"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous2 forKey:@"filedAmt"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous3 forKey:@"filedDate"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous4 forKey:@"filedPhone"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous5 forKey:@"filedURL"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous6 forKey:@"filedComments"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    }
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set number of labels based on title array size.
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listArray.bills count];
}

//commit to the delete here.
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //verify editing style
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove object from UI
        //[listArray.wishList removeObjectAtIndex:indexPath.section];
        
        
        //remove from arrays
        [onChart deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [onChart reloadData];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //create tags
    static NSString *cellId = @"Test";
    UITableViewCell *wishCell = [onChart dequeueReusableCellWithIdentifier: cellId];
    if (wishCell == nil)
    {
        wishCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [wishCell.textLabel setNumberOfLines:6];
        wishCell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    //add image to label
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 60, 50)];
    UIImage *imageName = [UIImage imageNamed:@"ioio.png"];
    imv.image = imageName;
    [wishCell.contentView addSubview:imv];
    wishCell.textLabel.text = [NSString stringWithFormat:@"%@", [[listArray.bills objectAtIndex:indexPath.row] bName]];
    //return label
    return wishCell;
    
}

//universal segue call to pass the custom data to detail page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        BillDetailView *destination = segue.destinationViewController;
        destination.insertName = toInsertName;
    }
}

//selected row calls
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    toInsertName = [listArray.bills objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier: @"detail" sender: self];
    
}



-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        
    }
    else if (button.tag == 1)
    {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"https://www.facebook.com/GrindDesign"];
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
