//
//  couponsAdsObject.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 8/6/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

/*
 {
 "couponId": "103545",
 "couponUrl": "http://100702.demo.findnsave.com/Coupon/103545/Mr-Mattress?ac=coupons_api",
 "startDate": "2012-08-06T07:00:00",
 "endDate": "2012-09-07T06:59:59",
 "title": "20% Off Any Purchase",
 "details": "20% Off Any Purchase At Mr. Mattress. Free Delivery and Removal of Old Set - 60 Night Satisfaction Guarantee - Layaway. Pressure Free Environment. Offer expires 9.6.12. \r\nwww.mrmattresscenter.com",
 "conditions": null,
 "couponPhotoUrl": "http://s3.amazonaws.com/photos.offers.analoganalytics.com/production/103545/standard.png?1344274587",
 "advertiserId": "64100",
 "advertiserName": "Mr. Mattress",
 "advertiserLogoUrl": "http://s3.amazonaws.com/logos.advertisers.analoganalytics.com/production/64100/standard.png?1344274610",
 "advertiserWebUrl": "http://www.mrmattresscenter.com",
 "address": "8546 Madison Ave, Fair Oaks",
 "city": null,
 "stateAbbr": "CA",
 "postalCode": "95628",
 "phoneNumber": "(916) 243-5503"
 },
 */

#import <UIKit/UIKit.h>

@interface couponsAdsObject : NSObject{
    
    NSNumber *couponId;
    NSURL *couponUrl;
    NSDate *startDate;
    NSDate *endDate;
    NSString *title;
    NSString *details;
    NSString *conditions;
    NSURL *couponPhotoUrl;
    NSNumber *advertiserId;
    NSString *advertiserName;
    NSURL *advertiserLogoUrl;
    NSURL *advertiserWebUrl;
    NSString *address;
    NSString *city;
    NSString *stateAbbr;
    NSNumber *postalCode;
    NSNumber *phoneNumber;

}

@property (nonatomic, retain) NSNumber *couponId;
@property (nonatomic, retain) NSURL *couponUrl;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSDate *endDate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *details;
@property (nonatomic, retain) NSString *conditions;
@property (nonatomic, retain) NSURL *couponPhotoUrl;
@property (nonatomic, retain) NSNumber *advertiserId;
@property (nonatomic, retain) NSString *advertiserName;
@property (nonatomic, retain) NSURL *advertiserLogoUrl;
@property (nonatomic, retain) NSURL *advertiserWebUrl;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *stateAbbr;
@property (nonatomic, retain) NSNumber *postalCode;
@property (nonatomic, retain) NSNumber *phoneNumber;

@end
