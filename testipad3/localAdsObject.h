//
//  localAdsObject.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 8/6/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

/*
 "id": "11627482",
 "catid": "4132",
 "catname": "Heat & Air Conditioning",
 "advid": "4117",
 "advname": "Barnett Heating & Air",
 "start": "20120731",
 "end": "20120806",
 "imageUrl": "http://cdn.travidia.com/rop-ad/13332827",
 "pubid": "100702",
 "url": "http://100702.demo.findnsave.com/Local-Ads/a-4117/Barnett-Heating-and-Air/11627482"
 },
 */

#import <Foundation/Foundation.h>

@interface localAdsObject : NSObject{
    
    NSNumber *localAdId;
    NSNumber *catId;
    NSString *catName;
    NSNumber *advId;
    NSString *advName;
    NSNumber *start;
    NSNumber *end;
    NSURL *imageUrl;
    NSNumber *pubId;
    NSURL *url;

}

@property (nonatomic, retain) NSNumber *localAdId;
@property (nonatomic, retain) NSNumber * catId;
@property (nonatomic, retain) NSString * catName;
@property (nonatomic, retain) NSNumber * advId;
@property (nonatomic, retain) NSString * advName;
@property (nonatomic, retain) NSNumber * start;
@property (nonatomic, retain) NSNumber * end;
@property (nonatomic, retain) NSURL * imageUrl;
@property (nonatomic, retain) NSNumber * pubId;
@property (nonatomic, retain) NSURL * url;


@end
