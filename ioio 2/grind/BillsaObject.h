//
//  BillsaObject.h
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillsaObject : NSObject
{
    NSMutableArray *bills;
    NSString *bName;
    NSString *bAmount;
    NSString *bDate;
    NSString *bPhone;
    NSString *bURL;
    NSString *bComments;
}


@property(nonatomic)NSString *bName;
@property(nonatomic)NSString *bAmount;
@property(nonatomic)NSString *bDate;
@property(nonatomic)NSString *bPhone;
@property(nonatomic)NSString *bURL;
@property(nonatomic)NSString *bComments;
@property(nonatomic)NSMutableArray *bills;


-(id)initWithBill:(NSString*)title amount:(NSString*)amount date:(NSString*)date comments:(NSString*)comments  url:(NSString*)url phone:(NSString*)phone;


//database builder static
+(BillsaObject*)sharedDataArray;

@end
