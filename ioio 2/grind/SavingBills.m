//
//  SavingBills.m
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "SavingBills.h"

@implementation SavingBills
{
    SavingBills *anotherItem;
}
@synthesize billName, billAmount, billDate, billPhone, billURL, billComments;
//singleton vars
//@synthesize;

//singleton static method
+(SavingBills*)singleOBJ
{
    static SavingBills *singleton = nil;
    @synchronized(self)
    {
        if (!singleton)
        {
            singleton = [[SavingBills alloc] init];
        }
        return singleton;
    }
    
}
@end
