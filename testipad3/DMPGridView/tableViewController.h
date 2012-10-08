//
//  tableViewController.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 8/4/12.
//  Copyright (c) 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDescriptionViewController.h"
#import "listPickerController.h"
#import "AZGenieView.h"

@interface tableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, listPickerDelegate, UIGestureRecognizerDelegate,AZGenieAnimationDelegate>{
    
    IBOutlet UITableView *table;
    NSMutableArray *list;
    NSString *typeOfAd;
    UIPopoverController *_colorPickerPopover;
    listPickerController *listPicker;
    NSUInteger _dragOriginIndex;
	CGPoint _dragOriginCellOrigin;
	NSIndexPath *_lastIndexPath;
    NSMutableArray *images;
    CGPoint global;
    CGPoint global2;
    CGPoint local;
    IBOutlet UINavigationBar *navItem;
    IBOutlet UILabel *counter;
    IBOutlet UIButton *listButton;
    IBOutlet UIButton *redBadgeRound;
    IBOutlet UIButton *redBadgeLong;
    NSArray *imagesList;
    NSMutableArray *productsToBeSent;
    
}

@property(nonatomic, retain) UITableView *table;
@property(nonatomic, retain) NSMutableArray *list;
@property(nonatomic, retain) NSString *typeOfAd;
@property (nonatomic, retain) UIPopoverController *colorPickerPopover;
@property (nonatomic, retain) listPickerController *listPicker;
@property (nonatomic, retain) UIImageView *dragView;
@property (nonatomic, retain) NSMutableArray *images;
@property (nonatomic, retain) UIButton *redBadgeRound;
@property (nonatomic, retain) UIButton *redBadgeLong;
@property (nonatomic, retain) UILabel *counter;
@property (nonatomic, retain) NSArray *imagesList;
@property (nonatomic, retain) NSMutableArray *productsToBeSent;

- (void) tableFeatures;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withType:(NSString *)type;
- (void)setListsButtonTapped:(id)sender;
- (void)handleTap;
- (IBAction)lisButtonPress:(id)sender;

@end

@interface UIView (Adiciones)
- (UIImage *) screenshot;
@end
