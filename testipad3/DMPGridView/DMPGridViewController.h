//
//  DMPGridViewController.h
//  DMPGridViewController
//
//  Created by David Patierno on 11/7/11.
//  Copyright (c) 2011. All rights reserved.
//

#import "DMPGridViewDelegate.h"
#import "ProductDescriptionViewController.h"

@interface DMPGridViewController : UITableViewController{
    
    NSArray *array;
    ProductDescriptionViewController *vc1;
}

@property (nonatomic, assign) id<DMPGridViewDelegate> delegate;
@property (nonatomic, retain) NSArray *array;

- (id)initWithDelegate:(id<DMPGridViewDelegate>)delegate;

@end
