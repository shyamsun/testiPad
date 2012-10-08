//
//  testUtils.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/31/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testUtils : NSObject

+ (NSMutableArray *) httpCallJsonDeal:(NSString *) url;
+ (NSMutableArray *) httpCallJsonLocalAd:(NSString *) url;
+ (NSMutableArray *) httpCallJsonCoupon:(NSString *) url;

@end
