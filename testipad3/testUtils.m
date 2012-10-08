//
//  testUtils.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/31/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "testUtils.h"
#import "JSON.h"
#import "dealObject.h"
#import "localAdsObject.h"
#import "couponsAdsObject.h"

@interface testUtils (Private)

+ (dealObject *) dealFromJSON: (NSDictionary *)dealJSONObj;
+ (NSData *) callHttp:(NSString *)url;
+ (NSDictionary *) JSONObjFromResponse: (NSData *)resp error: (NSError **) err;
+ (NSDictionary *) JSONCouponObjFromResponse: (NSData *)resp error: (NSError **) err;
+ (couponsAdsObject *) couponFromJSON: (NSDictionary *)couponJSONObj;
+ (localAdsObject *) localAdFromJSON: (NSDictionary *)localAdJSONObj;

@end

@implementation testUtils


+ (NSArray *) httpCallJsonDeal:(NSString *) url{
    
    NSError **err = nil;
    NSData *data = [self callHttp:url];
    NSDictionary *results = [self JSONObjFromResponse:data error:err];
    NSArray *list = [results objectForKey:@"deal"];
    NSMutableArray *deals = [NSMutableArray arrayWithCapacity:[list count]];
    NSLog(@"request is %d", [list count]);

    
	for (int i = 0; i < [list count]; i++) {
        dealObject *deal = [self dealFromJSON:[list objectAtIndex:i]];
        [deals addObject:deal];
   	}
    
    NSLog(@"deals are %@", deals);
    return deals;

}

+ (NSMutableArray *) httpCallJsonLocalAd:(NSString *) url{
    
    NSError **err = nil;
    NSData *data = [self callHttp:url];
    NSDictionary *results = [self JSONLocalAdObjFromResponse:data error:err];
    NSLog(@"localAds are %@", results);
    NSArray *list = [results objectForKey:@"ad"];
    NSMutableArray *localAds = [NSMutableArray arrayWithCapacity:[list count]];
    NSLog(@"request is %d", [list count]);
    
    
	for (int i = 0; i < [list count]; i++) {
        localAdsObject *localAd = [self localAdFromJSON:[list objectAtIndex:i]];
        [localAds addObject:localAd];
   	}
    
    NSLog(@"localAds are %@", localAds);
    return localAds;
    
}

+ (NSMutableArray *) httpCallJsonCoupon:(NSString *) url{
    
    NSError **err = nil;
    NSData *data = [self callHttp:url];
    NSDictionary *results = [self JSONCouponObjFromResponse:data error:err];
    NSLog(@"coupons are %@", results);
    NSArray *list = [results objectForKey:@"coupon"];
    NSMutableArray *coupons = [NSMutableArray arrayWithCapacity:[list count]];
    NSLog(@"request is %d", [list count]);
    
    
	for (int i = 0; i < [list count]; i++) {
        couponsAdsObject *coupon = [self couponFromJSON:[list objectAtIndex:i]];
        [coupons addObject:coupon];
   	}
    
    NSLog(@"coupons are %@", coupons);
    return coupons;
    
}

+ (NSData *) callHttp:(NSString *)url{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLResponse *response = nil;
    NSError **err = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
													 error:err];
    return data;
}


+ (NSDictionary *) JSONObjFromResponse: (NSData *)resp error: (NSError **) err{
	NSObject *obj = nil;
	if (!resp) {
		return nil;
	}
    
	NSString* dataStr = [[[NSString alloc] initWithData:resp encoding:NSUTF8StringEncoding] autorelease];
	SBJSON *jsonParser = [[SBJSON new] autorelease];
	obj = [jsonParser objectWithString:dataStr error:err];
	if (!obj) {
		return nil;
	}
	if (![obj isKindOfClass: [NSDictionary class]]) {
		return nil;
	}
	NSDictionary *jsonObj = (NSDictionary *)obj;
	jsonObj = [jsonObj objectForKey:@"result"];
    NSLog(@"json is %@", jsonObj);
	if (!jsonObj) {
		return nil;
	}
	NSNumber *status = [jsonObj objectForKey: @"status"];
    
	// status can only be 500 or 200
	if ([status intValue] == 500) {
		
		NSArray *errors = [jsonObj objectForKey:@"errors"];
		NSString *errorMsg = @"";
		int errCode = 6;
		for (int i = 0; i < [errors count]; i++) {
			NSDictionary *curErr = [errors objectAtIndex:i];
			NSArray *keys = [curErr allKeys];
			
			id code = [curErr objectForKey:@"code"];
			id msg = [curErr objectForKey:@"msg"];
			if (code != nil && [code isKindOfClass:[NSNumber class]] &&
				msg != nil && [msg isKindOfClass:[NSString class]]) {
				errCode = [code intValue];
				errorMsg = [NSString stringWithFormat:@"%@\n", msg];
				continue;
			}
			else {
				for (int j = 0; j < [keys count]; j++) {
					NSString *curKey = [keys objectAtIndex:j];
					NSObject *curVal = [curErr objectForKey:curKey];
					errorMsg = [[[errorMsg stringByAppendingString:curKey]
								 stringByAppendingString: @": "]
								stringByAppendingFormat: @"%@", curVal];
					if (j < [keys count] - 1) {
						errorMsg = [errorMsg stringByAppendingString:@"\n"];
					}
				}
			}
            
			
			errorMsg = [errorMsg stringByAppendingString:@"\n"];
		}
		
		return nil;
	}
	
	return jsonObj;
}

+ (NSDictionary *) JSONLocalAdObjFromResponse: (NSData *)resp error: (NSError **) err{
	NSObject *obj = nil;
	if (!resp) {
		return nil;
	}
    
	NSString* dataStr = [[[NSString alloc] initWithData:resp encoding:NSUTF8StringEncoding] autorelease];
	SBJSON *jsonParser = [[SBJSON new] autorelease];
	obj = [jsonParser objectWithString:dataStr error:err];
	if (!obj) {
		return nil;
	}
	if (![obj isKindOfClass: [NSDictionary class]]) {
		return nil;
	}
	NSDictionary *jsonObj = (NSDictionary *)obj;
	jsonObj = [jsonObj objectForKey:@"ads"];
	if (!jsonObj) {
		return nil;
	}
	NSNumber *status = [jsonObj objectForKey: @"status"];
    
	// status can only be 500 or 200
	if ([status intValue] == 500) {
		
		NSArray *errors = [jsonObj objectForKey:@"errors"];
		NSString *errorMsg = @"";
		int errCode = 6;
		for (int i = 0; i < [errors count]; i++) {
			NSDictionary *curErr = [errors objectAtIndex:i];
			NSArray *keys = [curErr allKeys];
			
			id code = [curErr objectForKey:@"code"];
			id msg = [curErr objectForKey:@"msg"];
			if (code != nil && [code isKindOfClass:[NSNumber class]] &&
				msg != nil && [msg isKindOfClass:[NSString class]]) {
				errCode = [code intValue];
				errorMsg = [NSString stringWithFormat:@"%@\n", msg];
				continue;
			}
			else {
				for (int j = 0; j < [keys count]; j++) {
					NSString *curKey = [keys objectAtIndex:j];
					NSObject *curVal = [curErr objectForKey:curKey];
					errorMsg = [[[errorMsg stringByAppendingString:curKey]
								 stringByAppendingString: @": "]
								stringByAppendingFormat: @"%@", curVal];
					if (j < [keys count] - 1) {
						errorMsg = [errorMsg stringByAppendingString:@"\n"];
					}
				}
			}
            
			
			errorMsg = [errorMsg stringByAppendingString:@"\n"];
		}
		
		return nil;
	}
	
	return jsonObj;
}

+ (NSDictionary *) JSONCouponObjFromResponse: (NSData *)resp error: (NSError **) err{
	NSObject *obj = nil;
	if (!resp) {
		return nil;
	}
    
	NSString* dataStr = [[[NSString alloc] initWithData:resp encoding:NSUTF8StringEncoding] autorelease];
	SBJSON *jsonParser = [[SBJSON new] autorelease];
	obj = [jsonParser objectWithString:dataStr error:err];
	if (!obj) {
		return nil;
	}
	if (![obj isKindOfClass: [NSDictionary class]]) {
		return nil;
	}
	NSDictionary *jsonObj = (NSDictionary *)obj;
	jsonObj = [jsonObj objectForKey:@"result"];
	if (!jsonObj) {
		return nil;
	}
	NSNumber *status = [jsonObj objectForKey: @"status"];
    
	// status can only be 500 or 200
	if ([status intValue] == 500) {
		
		NSArray *errors = [jsonObj objectForKey:@"errors"];
		NSString *errorMsg = @"";
		int errCode = 6;
		for (int i = 0; i < [errors count]; i++) {
			NSDictionary *curErr = [errors objectAtIndex:i];
			NSArray *keys = [curErr allKeys];
			
			id code = [curErr objectForKey:@"code"];
			id msg = [curErr objectForKey:@"msg"];
			if (code != nil && [code isKindOfClass:[NSNumber class]] &&
				msg != nil && [msg isKindOfClass:[NSString class]]) {
				errCode = [code intValue];
				errorMsg = [NSString stringWithFormat:@"%@\n", msg];
				continue;
			}
			else {
				for (int j = 0; j < [keys count]; j++) {
					NSString *curKey = [keys objectAtIndex:j];
					NSObject *curVal = [curErr objectForKey:curKey];
					errorMsg = [[[errorMsg stringByAppendingString:curKey]
								 stringByAppendingString: @": "]
								stringByAppendingFormat: @"%@", curVal];
					if (j < [keys count] - 1) {
						errorMsg = [errorMsg stringByAppendingString:@"\n"];
					}
				}
			}
            
			
			errorMsg = [errorMsg stringByAppendingString:@"\n"];
		}
		
		return nil;
	}
	
	return jsonObj;
}



+ (dealObject *) dealFromJSON: (NSDictionary *)dealJSONObj{
    
    dealObject *deal = [[[dealObject alloc] init] autorelease];
	[deal setDealId:[dealJSONObj objectForKey:@"dealId"]];
	[deal setTitle:[dealJSONObj objectForKey:@"title"]];
	[deal setDealUrl:[dealJSONObj objectForKey:@"dealUrl"]];
	[deal setImageUrlSmall:[dealJSONObj objectForKey:@"imageUrlSmall"]];
	[deal setImageUrlMedium:[dealJSONObj objectForKey:@"imageUrlMedium"]];
	[deal setImageUrlLarge:[NSURL URLWithString:[dealJSONObj objectForKey:@"imageUrlLarge"]]];
	[deal setOfferCount:[dealJSONObj objectForKey:@"offerCount"]];
	[deal setPrice:[dealJSONObj objectForKey:@"price"]];
	[deal setValue:[dealJSONObj objectForKey:@"value"]];
    [deal setDiscountPercent:[dealJSONObj objectForKey:@"discountPercent"]];
	[deal setDiscount:[dealJSONObj objectForKey:@"discount"]];
	[deal setQuantitySold:[dealJSONObj objectForKey:@"quantitySold"]];
	[deal setMerchantName:[dealJSONObj objectForKey:@"merchantName"]];
	[deal setAnnouncementTitle:[dealJSONObj objectForKey:@"announcementTitle"]];
	[deal setPublisherName:[dealJSONObj objectForKey:@"publisherName"]];
	[deal setPublisherLogo:[dealJSONObj objectForKey:@"publisherLogo"]];	
	return deal;

}

+ (localAdsObject *) localAdFromJSON: (NSDictionary *)localAdJSONObj{
    
    localAdsObject *localAd = [[[localAdsObject alloc] init] autorelease];
	[localAd setLocalAdId:[localAdJSONObj objectForKey:@"id"]];
	[localAd setCatId:[localAdJSONObj objectForKey:@"catid"]];
    [localAd setCatName:[localAdJSONObj objectForKey:@"catname"]];
	[localAd setAdvId:[localAdJSONObj objectForKey:@"advid"]];
	[localAd setAdvName:[localAdJSONObj objectForKey:@"advname"]];
	[localAd setStart:[localAdJSONObj objectForKey:@"start"]];
	[localAd setEnd:[localAdJSONObj objectForKey:@"end"]];
	[localAd setImageUrl:[NSURL URLWithString:[localAdJSONObj objectForKey:@"imageUrl"]]];
	[localAd setPubId:[localAdJSONObj objectForKey:@"pubid"]];
	[localAd setUrl:[NSURL URLWithString:[localAdJSONObj objectForKey:@"url"]]];
	return localAd;
    
}

+ (couponsAdsObject *) couponFromJSON: (NSDictionary *)couponJSONObj{
    
    couponsAdsObject *coupon = [[[couponsAdsObject alloc] init] autorelease];
	[coupon setCouponId:[couponJSONObj objectForKey:@"couponId"]];
	[coupon setCouponUrl:[couponJSONObj objectForKey:@"couponUrl"]];
    [coupon setStartDate:[couponJSONObj objectForKey:@"startDate"]];
	[coupon setEndDate:[couponJSONObj objectForKey:@"endDate"]];
	[coupon setTitle:[couponJSONObj objectForKey:@"title"]];
	[coupon setDetails:[couponJSONObj objectForKey:@"details"]];
	[coupon setConditions:[couponJSONObj objectForKey:@"conditions"]];
	[coupon setCouponPhotoUrl:[NSURL URLWithString:[couponJSONObj objectForKey:@"couponPhotoUrl"]]];
	[coupon setAdvertiserId:[couponJSONObj objectForKey:@"advertiserId"]];
	[coupon setAdvertiserName:[NSURL URLWithString:[couponJSONObj objectForKey:@"advertiserName"]]];
    [coupon setAdvertiserLogoUrl:[couponJSONObj objectForKey:@"advertiserLogoUrl"]];
	[coupon setAdvertiserWebUrl:[couponJSONObj objectForKey:@"advertiserWebUrl"]];
	[coupon setAddress:[couponJSONObj objectForKey:@"address"]];
	[coupon setCity:[couponJSONObj objectForKey:@"city"]];
	[coupon setStateAbbr:[couponJSONObj objectForKey:@"stateAbbr"]];
	[coupon setPostalCode:[couponJSONObj objectForKey:@"postalCode"]];
	[coupon setPhoneNumber:[couponJSONObj objectForKey:@"phoneNumber"]];

	return coupon;
    
}


@end
