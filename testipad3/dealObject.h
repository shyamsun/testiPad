//
//  dealObject.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/31/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "dealId": "617409",
 "title": "66% off three rooms of carpet cleaning from Service Kings in Fair Oaks!",
 "dealUrl": "http://100702.demo.findnsave.com/Daily-Deals/617409/No-Name?ac=dailydeals_api",
 "imageUrlSmall": "http://c.eblastengine.com/EmailImages/58131.jpg",
 "imageUrlMedium": "http://c.eblastengine.com/EmailImages/58131.jpg",
 "imageUrlLarge": "http://c.eblastengine.com/EmailImages/58131.jpg",
 "offerCount": "0",
 "price": "$49",
 "value": "$144",
 "discountPercent": "66%",
 "discount": "$95",
 "quantitySold": "10",
 "merchantName": null,
 "announcementTitle": "66% off three rooms of carpet cleaning from Service Kings in Fair Oaks!",
 "publisherName": "dealsaver",
 "publisherLogo": "http://content.findnsave.com/v1335220125/100702/i/dealsaver_logo.png"
 */
@interface dealObject : NSObject{
    
    NSNumber *dealId;
    NSString *title;
    NSURL *dealUrl;
    NSURL *imageUrlSmall;
    NSURL *imageUrlMedium;
    NSURL *imageUrlLarge;
    NSNumber *offerCount;
    NSString *price;
    NSString *value;
    NSString *discountPercent;
    NSString *discount;
    NSNumber *quantitySold;
    NSString *merchantName;
    NSString *announcementTitle;
    NSString *publisherName;
    NSURL *publisherLogo;
    
}

@property (nonatomic, retain) NSNumber * dealId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSURL * dealUrl;
@property (nonatomic, retain) NSURL * imageUrlSmall;
@property (nonatomic, retain) NSURL * imageUrlMedium;
@property (nonatomic, retain) NSURL * imageUrlLarge;
@property (nonatomic, retain) NSNumber * offerCount;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) NSString * discountPercent;
@property (nonatomic, retain) NSString * discount;
@property (nonatomic, retain) NSNumber * quantitySold;
@property (nonatomic, retain) NSString * merchantName;
@property (nonatomic, retain) NSString * announcementTitle;
@property (nonatomic, retain) NSString * publisherName;
@property (nonatomic, retain) NSURL * publisherLogo;


@end
