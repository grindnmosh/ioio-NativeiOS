//
//  SavingBills.h
//  grind
//
//  Created by Robert Warren on 2/24/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavingBills : NSObject
{
    NSString *billName;
    NSString *billAmount;
    NSString *billDate;
    NSString *billPhone;
    NSString *billURL;
    NSString *billComments;
}


@property(nonatomic)NSString *billName;
@property(nonatomic)NSString *billAmount;
@property(nonatomic)NSString *billDate;
@property(nonatomic)NSString *billPhone;
@property(nonatomic)NSString *billURL;
@property(nonatomic)NSString *billComments;

+(SavingBills *) singleOBJ;

@end
