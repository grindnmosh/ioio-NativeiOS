//
//  BillsaObject.m
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "BillsaObject.h"

@implementation BillsaObject
@synthesize bName, bAmount, bDate, bPhone, bURL, bComments, bills;

-(id)initWithBill:(NSString*)title amount:(NSString*)amount date:(NSString*)date comments:(NSString*)comments  url:(NSString*)url phone:(NSString*)phone
{
    if ((self = [super init]))
    {
        bName = title;
        bAmount = amount;
        bDate = date;
        bPhone = phone;
        bURL = url;
        bComments = comments;
    }
    return self;
}


//database builder
static BillsaObject* _sharedDataArray = nil;
+(BillsaObject*)sharedDataArray
{
    if (!_sharedDataArray)
    {
        _sharedDataArray = [[self alloc] init];
    }
    return _sharedDataArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        bills = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
