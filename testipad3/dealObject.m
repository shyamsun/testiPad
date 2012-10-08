//
//  dealObject.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/31/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "dealObject.h"

@implementation dealObject

@synthesize dealId, title, dealUrl, imageUrlSmall, imageUrlMedium, imageUrlLarge, offerCount, price, value, discountPercent, discount, quantitySold, merchantName, announcementTitle, publisherName, publisherLogo;

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


@end
