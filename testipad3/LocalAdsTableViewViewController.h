//
//  LocalAdsTableViewViewController.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 8/6/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalAdsTableViewViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UITableView *table;
    NSMutableArray *list;

}

@property(nonatomic, retain) UITableView *table;
@property(nonatomic, retain) NSMutableArray *list;

- (void) tableFeatures;

@end
