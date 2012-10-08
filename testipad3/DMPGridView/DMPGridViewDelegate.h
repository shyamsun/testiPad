//
//  DMPGridViewDelegate.h
//  DMPGridViewController
//
//  Created by David Patierno on 11/7/11.
//  Copyright (c) 2011. All rights reserved.
//

#import "dealObject.h"
#import "dealObject.h"

@class DMPGridViewController;

@protocol DMPGridViewDelegate <UITableViewDelegate>

- (NSURL *)gridViewController:(DMPGridViewController *)gridViewController imageForCellAtIndex:(NSUInteger)index;
- (NSString *)gridViewController:(DMPGridViewController *)gridViewController titleForCellAtIndex:(NSUInteger)index;
- (NSInteger)numberOfCellsForGridViewController:(DMPGridViewController *)gridViewController;
- (dealObject *)gridViewController:(DMPGridViewController *)gridViewController tappedCellAtIndex:(NSUInteger)index;

@end
